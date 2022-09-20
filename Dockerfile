# syntax=docker/dockerfile:1
FROM alpine:latest

ENV HOME='/opt/wordpress/'

WORKDIR ${HOME}
COPY requirements.txt ${HOME}
RUN apk add --no-cache py3-pip curl && \
    pip install -Ur requirements.txt && \
    wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.9.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm helm-v3.9.3-linux-amd64.tar.gz && \
    rm -r linux-amd64 && \
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin
    