# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.network "private_network", "ip": "192.168.77.77"
  
  config.vm.synced_folder "../projects", "/home/vagrant/projects"

  config.vm.provision "shell" do |s|
      s.path = "./provision.sh"
      s.privileged = false
  end

end
