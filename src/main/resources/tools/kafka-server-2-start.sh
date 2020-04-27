#!/usr/bin/env bash
CONFIG=`pwd`/config
## Run Kafka
kafka-server-start "$CONFIG/server-2.properties"