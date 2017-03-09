#!/bin/sh

until wget "http://$SELENIUM_HOST:$SELENIUM_PORT/grid/console" -O /dev/null 2>/dev/null; do
    echo "Waiting for Selenium to be available..."
    sleep 0.5
done

wdio $@
