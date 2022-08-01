# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder ".", "/vagrant", type: "nfs", :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1']
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '..', '/vagrant', type: "nfs"
  config.vm.synced_folder '/etc', '/opt/etc'
  # config.vm.synced_folder '~/.ssh', '/home/vagrant/.ssh', owner: 'vagrant', group: 'vagrant'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        # vb.gui = true

        # Customize the amount of memory on the VM:
        # vb.memory = "1024"
        vb.customize ["modifyvm", :id, "--cableconnected1", "on", "--accelerate3d", "on"]
        vb.memory = "4096"
    end


  # 设置vbguest不自动更新
  config.vbguest.auto_update = false

  # 激活hostmanager插件
  config.hostmanager.enabled = true

  # 在各自虚拟机中添加各虚拟机的主机名解析信息
  config.hostmanager.manage_guest = true

  # 不忽略私有网络的地址
  config.hostmanager.ignore_private_ip = false

  # config.vm.define 'vm1' do |node|
  #   node.vm.hostname = 'vm1'
  #   node.vm.network :private_network, ip: '192.168.42.42'
  # end

  config.ssh.forward_agent = true
  # config.ssh.private_key_path = '~/.ssh/id_rsa'
  private_key_path = File.join(Dir.home, ".ssh", "id_rsa")
  public_key_path = File.join(Dir.home, ".ssh", "id_rsa.pub")
  insecure_key_path = File.join(Dir.home, ".vagrant.d", "insecure_private_key")

  private_key = IO.read(private_key_path)
  public_key = IO.read(public_key_path)
  # config.ssh.insert_key = false
  # config.ssh.private_key_path = [
  #   private_key_path,
  #   insecure_key_path # to provision the first time
  # ]

  # config.vm.provision :shell, :inline => <<-SCRIPT
  #   set -e

  #   # echo '#{private_key}' > /home/vagrant/.ssh/id_rsa
  #   # chmod 600 /home/vagrant/.ssh/id_rsa

  #   echo '#{public_key}' > /home/vagrant/.ssh/authorized_keys
  #   chmod 600 /home/vagrant/.ssh/authorized_keys
  # SCRIPT

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  # config.vm.provision :shell, path: "bootstrap.sh", run: "always"
    config.vm.provision :shell, path: "bin/bootstrap.sh", run: "always"
    # config.vm.provision "file", source: "~/.ssh", destination: "$HOME/.ssh"
end
