#!/bin/bash

#This will install Postgresql 9.4.2 into /usr/local/src/postgresql-9.4.1
#This assumes that you have sudo provileges on the machine installing postgresql

SCRIPT_HOME=$HOME
echo $HOME
#Get requirements
sudo yum update -y
sudo yum groupinstall "Development Tools" -y


#Download and decompress
cd /usr/local/src 
sudo wget ftp://ftp.postgresql.org/pub/source/v9.4.2/postgresql-9.4.2.tar.gz
sudo tar xzvf postgresql-9.4.2.tar.gz

#Configure, compile and check if successful
cd /usr/local/src/postgresql-9.4.2
./configure --without-readline --without-zlib 
gmake

#If successful, install
sudo gmake install

# Create postgres user
sudo adduser postgres
sudo passwd postgres

sudo mkdir -p /var/lib/pgsql/data
sudo chown -R postgres.postgres /var/lib/pgsql/data/

## Initialize the DB
echo " Initializing the DB"
read -s -p " Enter postgres password:" pgPassword

## Saving password to be used in downstream script 
echo $pgPassword > /tmp/pgpwd.txt

echo $pgPassword | su - postgres -c '/usr/local/pgsql/bin/initdb -D /var/lib/pgsql/data/'

# copy start script to init.d
cd /usr/local/src/postgresql-9.4.2/contrib/start-scripts/
sudo cp -av linux /etc/init.d/postgresql

# Update PGDATA
sudo sh -c "sed -i -e '35s/^.*$/PGDATA=\"\/var\/lib\/pgsql\/data\"/g' /etc/init.d/postgresql"

# Make start script executable
sudo chmod +x /etc/init.d/postgresql


SCRIPT_HOME=$HOME/development/sf_pentaho-oem-installer/1_install_database/centos

#Copy the following preconfigured postgres conf files. These have been configured so that
#postgres listens for all incoming addresses and is accessible from all remote locations.
cp -f $SCRIPT_HOME/postgres_config_files/pg_hba.conf /usr/local/src/postgresql-9.4.2/data
cp -f $SCRIPT_HOME/postgres_config_files/postgresql.conf /usr/local/src/postgresql-9.4.2/data

echo "DEBUG: needs postgres password?"
sudo chkconfig postgresql on

#Now create a file in /etc/profile.d that sets the postgres path.

sudo sh -c "echo 'PATH=/usr/local/src/postgresql-9.4.2/bin:\$PATH' > /etc/profile.d/pg.sh"
sudo sh -c "echo 'export PATH' >> /etc/profile.d/pg.sh"

#Configure the libraries to be found by the programs
sudo ldconfig /usr/local/src/postgresql-9.4.2/lib/

#Start the server
echo $pgPassword | exec su - postgres -c '/usr/local/pgsql/bin/postgres -D /var/lib/pgsql/data/ &'
echo ">>>> Postgres Status: " `sudo service postgresql status`

#To check if it is running you can issue `netstat -l` and look for a postgres line, or run: /usr/local/src/postgresql-9.4.2/bin/psql -U postgres
