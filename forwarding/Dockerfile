FROM debian:stable-slim

ADD . /

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential openssh-client && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
