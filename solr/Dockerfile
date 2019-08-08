FROM openjdk:8-jre-alpine

ARG version=8.2.0
LABEL name="solr" maintainer="EstanteVirtual <ti@estantevirtual.com.br>" version=$version

ARG tgz=http://ftp.unicamp.br/pub/apache/lucene/solr/$version/solr-$version.tgz
ARG solr=/opt/solr
ARG solr_version=$solr-$version
ARG solr_env=/etc/default/solr.in.sh

RUN apk add --no-cache bash && \
    rm -rf /var/cache/apk/* && \
    wget -q -O - $tgz | \
    tar -xzC /opt/ && \
    ln -s $solr_version $solr && \
    addgroup -S solr && \
    adduser -S -D solr -G solr -s /bin/sh && \
    chgrp -R solr $solr $solr_version && \
    chown -R solr:solr $solr $solr_version && \
    chmod -R 770 $solr $solr_version && \
    mkdir /etc/default/ && \
    cp /opt/solr/bin/solr.in.sh $solr_env && \
    chmod 770 $solr_env && \
    chown solr $solr_env && \
    chgrp solr $solr_env

ENV SOLR_ENV $solr_env
WORKDIR /opt/solr

ADD ./cmd /tmp/
ADD ./mysql-connector-java-5.1.36.jar ./dist/

RUN chmod 770  ./dist/*.jar && \
    chown solr ./dist/*.jar && \
    chgrp solr ./dist/*.jar

CMD /tmp/cmd
