#!/bin/bash
apt update -y
apt install -y apache2
service apache2 start
echo "Hi Gokul" > /var/www/html/index.html

echo "upgrade total system!..."
sudo apt upgrade -y
echo "system update!..."
sudo apt update -y
echo "Installing Docker Engine on Ubuntu!..."
echo "Uninstalling old versions!.."
sudo apt-get remove docker docker-engine docker.io containerd runc
echo "Install using the repository!..."
echo "Set up the repository!..."
echo "Your System is updating!...."
sudo apt-get update -y
echo "Install packages to allow apt to use a repository over HTTPS"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
echo "Add Docker's official GPG key!..."
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "To set up the stable repository"
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Installling Docker Engine"
echo "Your System is updating!...."
sudo apt-get update -y
echo "Installing the latest version of Docker Engine and containerd!..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "To install a specific version of Docker Engine!..."
echo "List the versions available in your repo!..."
sudo apt-cache madison docker-ce
echo "Install a specific version!..."
sudo apt-get install -y docker-ce=5:20.10.6~3-0~ubuntu-focal docker-ce-cli=5:20.10.6~3-0~ubuntu-focal containerd.io
echo "Check Docker Engine is installed correctly by running the hello-world image!.."
sudo docker run docker/whalesay cowsay Docker!
echo "Docker is Successfull Installed!..."

docker run -d \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host

echo "node exporter running"


 echo "global:
  scrape_interval: 5s
  external_labels:
    monitor: 'node'
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['198.251.64.183:9090'] ## IP Address of the localhost
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['192.168.49.1:9100'] ## IP Address of the localhost" > /opt/prometheus.yml

echo "file-created"

docker run -d \
    -p 9090:9090 \
    -v /opt/prometheus.yml:/opt/prometheus.yml \
    prom/prometheus

echo "prometheus running"

docker run -d --name=grafana -p 3000:3000 grafana/grafana

echo "run garafana"


