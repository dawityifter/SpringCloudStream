#!/usr/bin/env bash
kafka-console-producer --broker-list localhost:9092,localhost:9093 \
--topic my-failsafe-topic