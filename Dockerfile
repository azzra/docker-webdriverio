FROM alpine:3.5

RUN apk add --no-cache \
    xvfb \
    dbus \
    openjdk8-jre \
    ttf-freefont \    
    nodejs \
    python \
    make \
    g++ 

ENV WDIO_TESTING_FRAMEWORKS wdio-mocha-framework wdio-jasmine-framework
ENV BROWSERS firefox-esr chromium

RUN apk add --no-cache $BROWSERS
RUN npm install -g $WDIO_TESTING_FRAMEWORKS

RUN npm install -g \
    webdriverio \
    selenium-standalone \
    wdio-selenium-standalone-service \
    && selenium-standalone install

COPY ./xvfb-run /usr/bin/xvfb-run

WORKDIR /jstests
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

#ENTRYPOINT ["/docker-entrypoint.sh"]
