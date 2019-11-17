FROM alpine:3.8
MAINTAINER oldiy <oldiy@163.com>

WORKDIR /
ENV NPC_VERSION 0.23.1

RUN set -x && \
        wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPC_VERSION}/linux_amd64_client.tar.gz && \
        mkdir \npc && \
        mv linux_amd64_client* /npc && \
        cd /npc && \
        tar xzf linux_amd64_client.tar.gz && \
        rm -rf *.tar.gz && \
        rm *.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV SERVERIP 127.0.0.1:8284
ENV TYPE kcp
ENV VKEY 123

ENTRYPOINT ["/entrypoint.sh"]
