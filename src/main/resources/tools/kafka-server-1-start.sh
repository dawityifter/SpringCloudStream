#!/usr/bin/env bash
CONFIG=`pwd`/config
## Run Kafka
kafka-server-start "$CONFIG/server-1.properties"