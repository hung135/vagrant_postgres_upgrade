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
	
  config.vm.synced_folder "data/9.6", "/opt/PostgreSQL/9.6/data"
  config.vm.synced_folder "data/9.5", "/opt/PostgreSQL/9.5/data"
	
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
    config.vm.network "private_network", ip: "192.168.33.100"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "4096"
	config.vbguest.auto_update = false
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
wget https://get.enterprisedb.com/postgresql/postgresql-9.5.7-1-linux-x64.run
wget https://get.enterprisedb.com/postgresql/postgresql-9.6.3-3-linux-x64.run
     apt-get update
     apt-get upgrade -y
     #apt-get install -y postgresql postgresql-contrib
     apt-get install -y postgresql-client-common postgresql-client-9.6 vim fish
     
     
     
    chmod 777 *
	
#apt-get install postgres-xc-client -y 
mkdir /var/lock/subsys
chown -R postgres:postgres /opt/PostgreSQL *
./postgresql-9.6.3-3-linux-x64.run --mode unattended --superpassword postgres --serverport 5432
./postgresql-9.5.7-1-linux-x64.run --mode unattended --superpassword postgres --serverport 5433
/etc/init.d/postgresql-9.5 stop
/etc/init.d/postgresql-9.6 stop
#apt-get install postgres-xc -y
echo export PGUSER=postgres >>.profile
echo export PGPASSWORD=postgres >>.profile
echo export PGDATABASE=postgres >>.profile
echo export PGHOST=192.168.33.100 >>.profile
echo export PGBINNEW=/opt/PostgreSQL/9.6/bin >>.profile
echo export PGBINOLD=/opt/PostgreSQL/9.5/bin >>.profile
echo export PGDATAOLD=/opt/PostgreSQL/9.5/data >>.profile
echo export PGDATANEW=/opt/PostgreSQL/9.6/data >>.profile
echo export PATH=$PATH:/opt/PostgreSQL/9.6/bin >>.profile
chmod 777 /opt/PostgreSQL/9.6/data/pg_hba.conf
chmod 777 /opt/PostgreSQL/9.5/data/pg_hba.conf
echo "host all all 192.168.33.100/24 md5" >>/opt/PostgreSQL/9.5/data/pg_hba.conf
echo "host all all 192.168.33.100/24 md5" >>/opt/PostgreSQL/9.6/data/pg_hba.conf
   SHELL
end
