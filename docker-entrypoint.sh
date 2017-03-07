#!/bin/sh

xvfb-run selenium-standalone start 2>/dev/null &

until wget "http://localhost:4444/selenium-server/driver?cmd=getLogMessages" -O /dev/null 2>/dev/null; do
    sleep 0.5
done

wdio $@
