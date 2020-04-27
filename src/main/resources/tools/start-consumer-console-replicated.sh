#!/usr/bin/env bash
kafka-console-consumer --bootstrap-server localhost:9094,localhost:9092 \
    --topic my-failsafe-topic \
    --consumer-property group.id=mygroup1