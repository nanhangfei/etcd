FROM alpine:latest

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ARG ETCD_VER=v3.0.17
ARG DOWNLOAD_URL=https://github.com/coreos/etcd/releases/download

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
RUN mkdir -p /tmp/test-etcd && \
    tar -xzf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/test-etcd && \
    mv /tmp/test-etcd/etcd-v3.0.17-linux-amd64/etcd* /usr/local/bin/ && \
    rm -Rf tmp/test-etcd/etcd-v3.0.17-linux-amd64/* /var/cache/apk/*

RUN mkdir -p /var/etcd/
RUN mkdir -p /var/lib/etcd/
