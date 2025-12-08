FROM gingerbreadz/c3-artifact-base:v1

ARG GEM5_PATH
ARG BENCH_PATH

RUN mkdir -p /gem5 && rm -rf /gem5/*
RUN mkdir -p /benchmarks && rm -rf /benchmarks/*

COPY $GEM5_PATH /gem5
COPY $BENCH_PATH /benchmarks
