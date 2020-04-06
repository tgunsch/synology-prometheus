#!/usr/bin/env sh

DOCKER_VOLUME="/volume1/docker"
PROMETHEUS_ROOT="${DOCKER_VOLUME}/prometheus"

mkdir -p ${PROMETHEUS_ROOT}

cat << EOF > ${PROMETHEUS_ROOT}/.env
DOCKER_VOLUME=$DOCKER_VOLUME
PROMETHEUS_ROOT=${PROMETHEUS_ROOT}
HOST_NAME=$(hostname)
EOF

. ${PROMETHEUS_ROOT}/.env

folders=( "configs" "data/alertmanager" "data/grafana" "data/prometheus" )
for i in "${folders[@]}"; do
  [ ! -d ${PROMETHEUS_ROOT}/${i} ] && mkdir -p ${PROMETHEUS_ROOT}/${i} \
  && echo "folder created ${PROMETHEUS_ROOT}/${i}"
done

chown -R 65534:65534 ${PROMETHEUS_ROOT}/data/prometheus #nobody userid
chown -R 472:472 ${PROMETHEUS_ROOT}/data/grafana #grafana userid


find ${PROMETHEUS_ROOT}/ -name "*.yml" -print0 | while read -d $'\0' file
do
  sed -i "s/\${HOST_NAME}/${HOST_NAME//\//\\/}/g" ${file}
  echo "config created ${file}"
done

echo "
#############################################
To start execute
sudo ${PROMETHEUS_ROOT}/start.sh
"
