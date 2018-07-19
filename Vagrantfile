# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "dynatrace-easytravel-docker-bootcamp"
  
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "10.10.10.10"
  config.vm.network "public_network"

  
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.name = "dynatrace-easytravel-docker"
     vb.gui = false
  
     vb.memory = "2048"
     vb.cpus = 1
  end
  
  config.vm.provision "shell", path: "provision.sh"
  
end