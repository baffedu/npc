FROM alpine:3.8
MAINTAINER oldiy <oldiy@163.com>

WORKDIR /
ENV NPC_VERSION 0.22.0

RUN set -x && \
	wget --no-check-certificate https://github.com/cnlh/nps/releases/download/v${NPC_VERSION}/linux_amd64_client.tar.gz && \ 
	mkdir \npc && \
	mv linux_amd64_client* /npc && \
	cd /npc && \
	tar xzf linux_amd64_client.tar.gz && \
	rm -rf *.tar.gz && \
	rm *.conf

ENV SERVERIP 127.0.0.1:8284
ENV VKEY 123
ENV CTYPE kcp

CMD /npc/npc -server=${SERVERIP} -vkey=${VKEY} -type=${CTYPE}
