FROM alpine:edge AS sentry-build

RUN apk add --no-cache \
    cargo \
    cmake \
    curl-dev \
    g++ \
    make \
    openssl-dev \
    rust

WORKDIR /work

ENV OPENSSL_LIB_DIR=/usr/lib/ OPENSSL_INCLUDE_DIR=/usr/include OPENSSL_STATIC=1
ADD Cargo.toml Cargo.lock build.rs ./
RUN mkdir -p src && echo "fn main() {}" > src/main.rs && cargo build --release

ADD src src/
RUN touch src/main.rs && cargo build --release && mv target/release/sentry-cli /usr/local/bin

FROM alpine

RUN apk add --no-cache curl llvm-libunwind libstdc++ libgcc

FROM python:3.6.5-alpine3.7

RUN apk upgrade && apk add --no-cache --virtual build-dependencies llvm-libunwind libstdc++ libgcc linux-headers make gcc g++ curl \
    postgresql-dev mariadb-dev unixodbc-dev ca-certificates zlib-dev jpeg-dev tiff-dev freetype-dev libc-dev lcms2-dev libwebp-dev \
    tcl-dev tk-dev libxml2-dev libxslt-dev && rm -rf /var/cache/apk/*

COPY --from=sentry-build /usr/local/bin/sentry-cli /bin
