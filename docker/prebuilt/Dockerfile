FROM gingerbreadz/c3-artifact-base:v1

ARG GEM5_PATH
ARG BENCH_PATH

RUN mkdir -p /gem5 && rm -rf /gem5/* && mkdir -p /benchmarks && rm -rf /benchmarks/*

COPY $GEM5_PATH $BENCH_PATH /
