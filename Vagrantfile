# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  NODES = 4

  config.vm.box = "bento/centos-7.1"
  config.vm.provision "shell", path: "network.sh"

  config.vm.define "node1", primary: true do |node| 
    node.vm.hostname = "node1"
    node.vm.network "private_network", ip: "192.168.33.10"
    node.vm.network :forwarded_port, guest: 4400, host: 14400 # Chronos
    node.vm.network :forwarded_port, guest: 5050, host: 15050 # Mesos master
    node.vm.network :forwarded_port, guest: 8080, host: 18080 # Marathon

    node.vm.provision "shell", path: "software_master.sh"
    node.vm.provision "shell", path: "applications_master.sh"
  end

  (2..NODES).each do |n|
    config.vm.define "node#{n}" do |node| 
      node.vm.hostname = "node#{n}"
      node.vm.network "private_network", ip: "192.168.33.1#{n-1}"

      node.vm.provision "shell", path: "software_slave.sh"
      node.vm.provision "shell", path: "applications_slave.sh"
    end
  end

end
