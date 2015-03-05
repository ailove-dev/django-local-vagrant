# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.hostname = "dev-server"

  config.vm.network :private_network, ip: "192.168.33.101"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :forwarded_port, guest: 8000, host: 8000

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "salt/roots/", "/srv/", type: "nfs"
  # config.vm.synced_folder ".", "/home/vagrant", type: "nfs"
  config.vm.synced_folder "data/", "/home/vagrant/data/", type: "nfs"
  config.vm.synced_folder "conf/", "/home/vagrant/conf/", type: "nfs"
  config.vm.synced_folder "repo/", "/home/vagrant/repo/", type: "nfs"
  config.vm.synced_folder "logs/", "/home/vagrant/logs/", type: "nfs"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.colorize = true

    salt.pillar({
      "django" => {
        "project_name" => "project-name",
        "path" => "/home/vagrant",
        "virtualenv" => "/home/vagrant/python",
        "user" => "vagrant",
        "group" => "vagrant"
      },
      "mysql" => {
        "db" => "test_db",
        "user" => "vagrant",
        "password" => "vagrant",
        "root_password" => "vagrant"
      },
      "postgresql" => {
        "db" => "test_db",
        "user" => "vagrant",
        "password" => "vagrant",
        "createdb" => true
      },
      "uwsgi" => {
        "reload" => false,
        "user" => "vagrant",
        "password" => "vagrant",
        "processes" => 1
      },
      "supervisor" => {
        "user" => "vagrant",
        "password" => "vagrant"
      }
    })
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 512]
  end
end
