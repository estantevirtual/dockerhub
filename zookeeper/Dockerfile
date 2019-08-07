FROM openjdk:8-jre-alpine

ARG VERSION=3.5.5
LABEL name="zookeeper" maintainer="EstanteVirtual <ti@estantevirtual.com.br>" version=$VERSION

ARG TGZ=http://ftp.unicamp.br/pub/apache/zookeeper/zookeeper-$VERSION/apache-zookeeper-$VERSION-bin.tar.gz

RUN apk add --no-cache bash wget && \
    mkdir -p /opt/zookeeper && \
    wget -q -O - $TGZ | \
    tar -xzC /opt/zookeeper --strip-components=1 && \
    cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg && \
    rm -rf /var/cache/apk/*

RUN echo "4lw.commands.whitelist=*" >> /opt/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

HEALTHCHECK CMD [ $(echo ruok | nc 127.0.0.1:2181) == "imok" ] || exit 1

VOLUME ["/opt/zookeeper/conf"]

CMD bash -c "/opt/zookeeper/bin/zkServer.sh start-foreground"
