FROM alpine:3.19

ARG VERSION=latest
LABEL version=${VERSION}

RUN apk add --no-cache openjdk17 maven && \
    rm -rf /var/cache/apk/*

WORKDIR /app
