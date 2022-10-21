#!/bin/bash

index_html=/usr/share/nginx/html/index.html
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y nginx
cat << EOF > $index_html
Hello World!<br />
Environment: ${environment}
EOF
systemctl start nginx
cd /home/ubuntu
curl -L -O https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz
tar xzvf node_exporter-1.4.0.linux-amd64.tar.gz
chown -R ubuntu:ubuntu node_exporter-1.4.0.linux-amd64