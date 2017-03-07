FROM alpine:3.5

ENV SELENIUM_STANDALONE_VERSION latest

RUN apk add --no-cache \
    xvfb \
    dbus \
    openjdk8-jre \
    ttf-freefont \    
    firefox-esr \
    nodejs \
    python \
    make \
    g++

RUN npm install -g \
    selenium-standalone@$SELENIUM_STANDALONE_VERSION \
    webdriverio \
    wdio-mocha-framework \
    && selenium-standalone install

COPY ./xvfb-run /usr/bin/xvfb-run

WORKDIR /jstests
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
