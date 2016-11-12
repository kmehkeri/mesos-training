# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.1"
  config.vm.provision "shell", path: "01_network.sh"

  config.vm.define "node1", primary: true do |node1| 
    node1.vm.network "private_network", ip: "192.168.33.10"
    node1.vm.hostname = "node1"
    node1.vm.network :forwarded_port, guest: 4400, host: 14400 # Chronos
    node1.vm.network :forwarded_port, guest: 5050, host: 15050 # Mesos master
    node1.vm.network :forwarded_port, guest: 8080, host: 18080 # Marathon

    node1.vm.provision "shell", path: "02_system.sh"
    node1.vm.provision "shell", path: "03_mesos_marathon.sh"
    node1.vm.provision "shell", path: "04_zookeeper.sh"
    node1.vm.provision "shell", path: "05_mesos_dns.sh"
    node1.vm.provision "shell", path: "06_apps.sh"
    node1.vm.provision "shell", path: "07_chronos.sh"
  end

  config.vm.define "node2" do |node2| 
    node2.vm.network "private_network", ip: "192.168.33.11"
    node2.vm.hostname = "node2"

    node2.vm.provision "shell", path: "03_slave_mesos.sh"
  end

end
