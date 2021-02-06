#####
FROM ubuntu:18.04

RUN apt-get update && \
        apt-get install -y --no-install-recommends nginx && \
        apt-get clean &&\
        rm -rf /var/lib/apt/lists/*

ARG HASH
ARG LOG
ENV COMMITHASH=$HASH
ENV COMMITLOG=$LOG

COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
