#!/bin/bash

# Start InfluxDB service in background.
service influxdb start > /dev/null &

# Run a subprocess (not exec) to not kill background processes on CTRL+C
gosu box "$@"
