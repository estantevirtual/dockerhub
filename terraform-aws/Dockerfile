FROM hashicorp/terraform:light

RUN apk add --update python py-pip openssl ca-certificates groff zip curl && \
    pip install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["sh", "-c"]
