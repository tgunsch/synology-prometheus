## Dependencies
- [Synology Docker](https://www.synology.com/en-global/dsm/packages/Docker) package already installed.
- SSH access to synology.
- Administrator user access.


### Install
```bash
# Download latest version archive
cd /volume1/docker/prometheus
version=$( curl --silent "https://api.github.com/repos/tgunsch/synology-prometheus/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' )
curl -fsSL https://github.com/tgunsch/synology-prometheus/archive/${version}.tar.gz -o archive.tgz
tar  -xz  -C ${PROMETHEUS_ROOT}  --strip-components=1 -f archive.tgz

# install
sudo setup.sh
```

### Start and stop
```bash
# Start
sudo /volume1/docker/prometheus/start.sh

# Stop
sudo /volume1/docker/prometheus/stop.sh
```

#### Endpoints 
- Grafana `http://<synology ip/hostname>:3000` (this may take upto 15 seconds to start up.)
- Prometheus `http://<synology ip/hostname>:9090`
- Alertmanager `http://<synology ip/hostname>:9093`
- Node-Exporter `http://<synology ip/hostname>:9100/metrics`
