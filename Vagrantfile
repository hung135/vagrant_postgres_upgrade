# -*- mode: ruby -*-
# vi: set ft=ruby :




Vagrant.configure("2") do |config|
 
  #config.vm.synced_folder "data/", "/opt/"
	
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

 
    config.vm.network "private_network", ip: "192.168.33.100"

  
  #
   config.vm.provider "virtualbox" do |vb|
 
     vb.memory = "4096"
	config.vbguest.auto_update = false
   end
 # this line below uploads file into VM it uses ssh
 #config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  #config.vm.provision "download", type: "shell", inline: $download ,run: "once"

  #config.vm.provision "download2", type: "shell", inline: $download2, run: "once"
config.vm.provision "file", source: "postgresql-9.5.7-1-linux-x64.run", destination: "postgresql-9.5.7-1-linux-x64.run"
config.vm.provision "file", source: "postgresql-9.6.3-3-linux-x64.run", destination: "postgresql-9.6.3-3-linux-x64.run"
config.vm.provision "download2", type: "shell", inline: $setup, run: "once"
end


 $download = <<-SCRIPT
 	wget https://get.enterprisedb.com/postgresql/postgresql-9.5.7-1-linux-x64.run
 SCRIPT
  $download2 = <<-SCRIPT
 	wget https://get.enterprisedb.com/postgresql/postgresql-9.6.3-3-linux-x64.run
 SCRIPT

$setup = <<-SHELL
  add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
 


     apt-get update
     apt-get upgrade -y
     #apt-get install -y postgresql postgresql-contrib
     apt-get install -y postgresql-client-common postgresql-client-9.6 vim fish samba --allow-unauthenticated

    chmod +x postgresql-9.*
	
#apt-get install postgres-xc-client -y 
mkdir -p /var/lock/subsys
#rm -rf /opt/*
#chown -R vagrant:vagrant /opt/
sudo ./postgresql-9.6.3-3-linux-x64.run --mode unattended --superpassword postgres --serverport 5432
sudo ./postgresql-9.5.7-1-linux-x64.run --mode unattended --superpassword postgres --serverport 5433
chmod 777 /opt/PostgreSQL/9.6/data/pg_hba.conf
chmod 777 /opt/PostgreSQL/9.5/data/pg_hba.conf
echo "host all all 192.168.33.100/24 md5" >>/opt/PostgreSQL/9.5/data/pg_hba.conf
echo "host all all 192.168.33.100/24 md5" >>/opt/PostgreSQL/9.6/data/pg_hba.conf

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

/etc/init.d/postgresql-9.5 start
/etc/init.d/postgresql-9.6 start

  export pw='ubuntu'
    export usr='ubuntu'
    (echo $pw; echo $pw ) | sudo smbpasswd -s -a $usr
    sudo echo "[home]">>/etc/samba/smb.conf
sudo echo "comment = COMMENT">>/etc/samba/smb.conf
sudo echo "path = /opt/">>/etc/samba/smb.conf
sudo echo "writeable = yes">>/etc/samba/smb.conf
sudo echo "create mask = 0770">>/etc/samba/smb.conf
sudo echo "force create mode = 0770">>/etc/samba/smb.conf
sudo echo "locking = yes">>/etc/samba/smb.conf
sudo service smbd restart 
SHELL

 
