#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. $DIR/.env

docker-compose -f ${PROMETHEUS_ROOT}/docker-compose.yml up -d

echo "
#############################################
Grafana       http://${HOST_NAME}:3000
Prometheus    http://${HOST_NAME}:9090
Alertmanager  http://${HOST_NAME}:9093
Node-Exporter http://${HOST_NAME}:9100/metrics
"
