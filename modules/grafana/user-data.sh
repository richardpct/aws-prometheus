#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt-get update -y
sudo apt-get upgrade -y
cd /home/ubuntu
curl -L -O https://dl.grafana.com/enterprise/release/grafana-enterprise-9.2.1.linux-amd64.tar.gz
tar xzvf grafana-enterprise-9.2.1.linux-amd64.tar.gz
chown -R ubuntu:ubuntu grafana-9.2.1
curl -L -O https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz
tar xzvf node_exporter-1.4.0.linux-amd64.tar.gz
chown -R ubuntu:ubuntu node_exporter-1.4.0.linux-amd64
node_exporter-1.4.0.linux-amd64/node_exporter &
cd grafana-9.2.1
bin/grafana-server &
