# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "web1" do |web1|
    # Box Settings
    web1.vm.box = "centos/7"
    web1.vbguest.installer_options = { allow_kernel_upgrade: true }
    web1.vm.hostname = 'web1'
    # Provider Settings
    web1.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      # vb.cpus = 2
    end

    # Network Settings
    # web1.vm.network "forwarded_port", guest: 80, host: 8080
    # web1.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    web1.vm.network "private_network", ip: "192.168.33.10"

    # Folder Settings
    web1.vm.synced_folder "./shared_web1", "/tmp/devops", :smb => { :mount_options => ["dmode=777", "fmode=666"] }
    web1.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "/tmp/devops/web1-pb.yml"
    end
  end

  config.vm.define "web2" do |web2|
    # Box Settings
    web2.vm.box = "centos/7"
    web2.vbguest.installer_options = { allow_kernel_upgrade: true }
    web2.vm.hostname = 'web2'
    # Provider Settings
    web2.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      # vb.cpus = 4
    end

    # Network Settings
    # web2.vm.network "forwarded_port", guest: 80, host: 8080
    # web2.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    web2.vm.network "private_network", ip: "192.168.33.11"

    # Folder Settings
    web2.vm.synced_folder "./shared_web2", "/tmp/devops", :smb => { :mount_options => ["dmode=777", "fmode=666"] }
    
    web2.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "/tmp/devops/web2-pb.yml"
    end
  end
end