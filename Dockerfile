# syntax=docker/dockerfile:1
FROM alpine:latest

COPY requirements.txt requirements.txt

RUN apk add --no-cache py3-pip curl && \
    pip install -Ur requirements.txt && \
    wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.9.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm helm-v3.9.3-linux-amd64.tar.gz
    