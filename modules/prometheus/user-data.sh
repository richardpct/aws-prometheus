#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
apt-get update -y
apt-get upgrade -y
cd /home/ubuntu
curl -L -O https://github.com/prometheus/prometheus/releases/download/v2.39.1/prometheus-2.39.1.linux-amd64.tar.gz
tar xzvf prometheus-2.39.1.linux-amd64.tar.gz
chown -R ubuntu:ubuntu prometheus-2.39.1.linux-amd64
curl -L -O https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz
tar xzvf node_exporter-1.4.0.linux-amd64.tar.gz
chown -R ubuntu:ubuntu node_exporter-1.4.0.linux-amd64
