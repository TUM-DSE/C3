UID := `id -u`
GID := `id -g`

gem5-unpack:
    tar xf gem5.tar.gz ./gem5/

# build C3 base docker image
docker-build-base:
    docker build -f ./docker/base/Dockerfile -t gingerbreadz/c3-artifact-base:v1 .

# build C3 prebuilt docker image -- from local gem5 & benchmarks directories with prebuilt binaries
docker-build-prebuilt:
    docker build -f ./docker/prebuilt/Dockerfile --build-arg GEM5_PATH=gem5 --build-arg BENCH_PATH=benchmarks -t gingerbreadz/c3-artifact-prebuilt:v1 .

# build C3 prebuilt docker image -- automatically build from C3 github repo, build steps are run when building docker image
docker-build-multi:
    docker build -f ./docker/multi/Dockerfile -t gingerbreadz/c3-artifact-prebuilt:v1 .

# From C3 prebuilt image -- skip gem5 and benchmark compilation
docker-prebuilt:
    docker run                                     \
        -u {{UID}}:{{GID}}                           \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        -it gingerbreadz/c3-artifact-prebuilt:v1

# From c3 base image -- only includes extra dependencies, compile gem5 & benchmarks from instructions
docker-base:
    docker run                                     \
        -u {{UID}}:{{GID}}                           \
        --mount type=bind,source=./gem5.tar.gz,target=/gem5.tar.gz \
        --volume ./gem5:/gem5       \
        --volume ./benchmarks:/benchmarks       \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        -it gingerbreadz/c3-artifact-base:v1

# From gem5 official base image -- install extra C3 dependencies and build gem5 & benchmarks from instructions
gem5-docker:
    sudo docker run                                     \
        --mount type=bind,source=./gem5.tar.gz,target=/gem5.tar.gz \
        --volume ./gem5:/gem5       \
        --volume ./benchmarks:/benchmarks       \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        -it ghcr.io/gem5/ubuntu-24.04_all-dependencies:v25-0
