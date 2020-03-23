#!/usr/bin/env sh

. .env

docker-compose -f ${PROMETHEUS_ROOT}/docker-compose.yml down
