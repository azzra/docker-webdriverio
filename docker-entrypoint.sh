#!/bin/sh

until wget "http://localhost:4444/grid/console" -O /dev/null 2>/dev/null; do
    echo "Waiting..."
    sleep 0.5
done

wdio $@
