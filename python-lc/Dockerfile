FROM python:3.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk add --update --no-cache \
     alpine-sdk \
     mariadb-connector-c-dev \
     libc-dev \
     unixodbc-dev \
     freetds-dev \
     && rm -rf /var/cache/apk/*

ADD odbcinst.ini /etc/odbcinst.ini

RUN pip install --upgrade pipenv pyodbc gunicorn eventlet gevent
