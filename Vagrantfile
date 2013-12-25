# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "saucy32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-i386-vagrant-disk1.box"

  # this block of settings are specific to virtualbox,
  # ignored for other providers
  config.vm.provider :virtualbox do |vb|
    # This setting makes it so that network access from the vagrant guest is able to
    # resolve connections using the hosts VPN connection
    # it means we can DNS resolve internal.vpn domains
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # This setting gives the VM 1 GB of MEMORIES. Same size as staging machine.
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # This setting makes it so that network access from the vagrant guest is
  # able to use the SSH private keys that are present on the host without
  # copying them into the VM.
  # it means we can authenticate to internal.vpn
  config.ssh.forward_agent = true
  # We want this VM to be reachable on the private host network as well,
  # so that the other VM's that are running IE can access our dev server
  config.vm.network :private_network, ip: "172.23.255.20"

  config.vm.provision "shell", path: "bootstrap.sh"
end