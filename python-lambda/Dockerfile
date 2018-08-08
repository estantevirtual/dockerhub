FROM python:3.6.5-alpine3.7

RUN apk upgrade && apk add --no-cache --virtual build-dependencies linux-headers make gcc g++ \
    postgresql-dev mariadb-dev ca-certificates zlib-dev jpeg-dev tiff-dev freetype-dev lcms2-dev libwebp-dev \
    tcl-dev tk-dev libxml2-dev libxslt-dev && rm -rf /var/cache/apk/*
