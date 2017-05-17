# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/home/vagrant/.dotfiles"

  config.vm.provider "virtualbox" do |vm|
    vm.name = "dotfiles-playground"
    vm.memory = '500'
  end

  script = <<SCRIPT
    sudo apt-get install -y git vim-gnome vim
    ln -sf /vagrant ~/.dotfiles
    cd ~/.dotfiles
    ./vagrant/setup.sh
SCRIPT

  config.vm.provision :shell, inline: script
end
