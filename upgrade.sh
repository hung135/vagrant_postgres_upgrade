      sudo /etc/init.d/postgresql-9.6 start
      sudo /etc/init.d/postgresql-9.5 start
      sudo /etc/init.d/postgresql-9.5 stop
     sudo /etc/init.d/postgresql-9.6 stop
      export PGHOST=localhost
     sudo chown -R vagrant:vagrant /opt/PostgresSQL
     sudo chown -R vagrant:vagrant /opt/PostgresSQL/
     sudo chown -R vagrant:vagrant /opt/PostgreSQL/
     pg_upgrade
     sudo chown -R postgres:postgres /opt/PostgreSQL/
   
     sudo /etc/init.d/postgresql-9.6 start