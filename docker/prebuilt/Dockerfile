FROM gingerbreadz/c3-artifact-base:v1

ARG GEM5_PATH
ARG BENCH_PATH

RUN mkdir -p /gem5 && rm -rf /gem5/* && mkdir -p /benchmarks && rm -rf /benchmarks/*

COPY --chown=1000:1000 --chmod=777 $GEM5_PATH /gem5/
COPY --chown=1000:1000 --chmod=777 $BENCH_PATH /benchmarks/
