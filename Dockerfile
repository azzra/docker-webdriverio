FROM alpine:3.5
MAINTAINER Azzra <azzra@users.noreply.github.com>

RUN apk add --no-cache \
    python \
    make \
    g++ \ 
    nodejs

RUN npm install -g \
    webdriverio 


ENV WDIO_TESTING_FRAMEWORKS wdio-mocha-framework wdio-jasmine-framework
RUN npm install -g $WDIO_TESTING_FRAMEWORKS

WORKDIR /tests

COPY ./docker-entrypoint.sh /root/scripts/docker-entrypoint.sh
ENTRYPOINT ["/root/scripts/docker-entrypoint.sh"]
