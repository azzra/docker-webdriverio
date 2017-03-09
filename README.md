# DOCKER WEBDRIVERIO

[![Build Status](https://travis-ci.org/azzra/docker-webdriverio.svg?branch=master)](https://travis-ci.org/azzra/docker-webdriverio)

Execute [WebdriverIO](http://webdriver.io/) in a Docker container.

## Usage

It needs a [Selenium](http://www.seleniumhq.org/) instance running, you could have a look here: [elgalu/docker-selenium](https://github.com/elgalu/docker-selenium/).

### Build

```sh
docker build -t azzra/wdio .
```

### Run

```sh
docker run --rm -it -v $(pwd):/tests --net=host azzra/wdio
```

> Usage of `--net=host` is only required if Selenium is on your localhost. Without, the container will resolve localhost as itself.  
