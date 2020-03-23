#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. $DIR/.env


docker-compose -f ${PROMETHEUS_ROOT}/docker-compose.yml down
