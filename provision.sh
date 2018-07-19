#!/bin/bash -e
#Set DT ENV VARS FOR SAAS
DT_DOWNLOAD_URI=""


# Install docker and docker-compose
#echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce python-pip
sudo pip install -q docker-compose

#Install Dynatrace OneAgent
wget -O Dynatrace-OneAgent-Linux.sh -q DT_DOWNLOAD_URI
/bin/sh Dynatrace-OneAgent-Linux.sh  APP_LOG_CONTENT_ACCESS=1

git clone https://github.com/dynatrace-innovationlab/easyTravel-Docker.git
cd easyTravel-Docker
echo ET_APM_SERVER_DEFAULT=APM > .env
sudo docker-compose up -d

