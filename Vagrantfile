# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.cpus = 1
  end

  config.vm.provision "bootstrap", type: "shell", path: "provision.sh"
  config.vm.provision "test", type: "shell", run: "always", path: "test.sh"
end
