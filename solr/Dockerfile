FROM openjdk:8-jre-alpine

ARG VERSION=8.1.1
LABEL name="solr" maintainer="EstanteVirtual <ti@estantevirtual.com.br>" version=$VERSION

ARG TGZ=http://ftp.unicamp.br/pub/apache/lucene/solr/$VERSION/solr-$VERSION.tgz
ARG SOLR=/opt/solr
ARG SOLR_VERSION=$SOLR-$VERSION

RUN apk add --no-cache bash wget && \
    wget -q -O - $TGZ | \
    tar -xzC /opt/ && \
    rm -rf /var/cache/apk/* && \
    ln -s $SOLR_VERSION $SOLR && \
    addgroup -S solr && \
    adduser -S -D solr -G solr -s /bin/sh && \
    chgrp -R solr $SOLR $SOLR_VERSION && \
    chown -R solr:solr $SOLR $SOLR_VERSION

EXPOSE 7574 8983

WORKDIR /opt/solr

RUN chmod -R 770 $SOLR $SOLR_VERSION

#CMD bash -c 'bin/solr -e cloud'
CMD bash -c 'sh'
