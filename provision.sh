#!/bin/bash -e
#Set DT ENV VARS
DT_TENANT="hfh56977"
DT_TOKEN="W37eOOzbQBG42Hx5X9uC"


# Install docker and docker-compose
#echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce python-pip
sudo pip install docker-compose

#Install Dynatrace OneAgent
wget -O Dynatrace-OneAgent-Linux.sh -q "https://${DT_TENANT}.live.ruxit.com/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=${DT_TOKEN}-&arch=x86&flavor=default"
/bin/sh Dynatrace-OneAgent-Linux.sh  APP_LOG_CONTENT_ACCESS=1

git clone https://github.com/dynatrace-innovationlab/easyTravel-Docker.git
cd easyTravel-Docker
sudo docker-compose up -d

#OS_OSCP="${OS_OSCP:-false}"

#sudo apt-get update
#sudo apt-get -y dist-upgrade
#sudo apt-get install -y apt-transport-https ca-certificates
#sudo apt-key adv \
#           --keyserver hkp://ha.pool.sks-keyservers.net:80 \
#           --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Install tools
#sudo apt-get update
#sudo apt-get install -y socat unzip




# Install docker: prepare for OpenShift
#sudo sed -i 's/ExecStart=\(.*\)/ExecStart=\1 --insecure-registry 172.30.0.0\/16/' /lib/systemd/system/docker.service
#sudo sed -i 's/SocketMode=\(.*\)/SocketMode=0666/' /lib/systemd/system/docker.socket
#sudo systemctl daemon-reload
#sudo systemctl restart docker

# Install oc CLI
#cd ~
#if "${OS_OSCP}" -eq "true"; then
  # OpenShift Container Platform
  #wget -q -O oc-linux.tar.gz https://s3.amazonaws.com/oso-preview-docker-registry/client-tools/3.4/oc-3.4.0.39-1-linux.tar.gz
#  tar xvzf oc-linux.tar.gz
#else
  # OpenShift Origin
#  wget -q -O oc-linux.tar.gz https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz
#  tar xvzf oc-linux.tar.gz
#  mv openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit/oc .
#fi

#sudo chown root:root oc
#sudo mv oc /usr/bin