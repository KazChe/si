#!/bin/bash

#This will install Postgresql 9.4.1 into /usr/local/postgresql-9.4.1
#This assumes that you have sudo provileges on the machine installing postgresql

DIR=`pwd`

#Get requirements
sudo apt-get update
sudo apt-get install build-essential libreadline6-dev zlib1g-dev 

#Download and decompress
cd
mkdir temp
cd temp
wget ftp://ftp.postgresql.org/pub/source/v9.4.1/postgresql-9.4.1.tar.gz
tar xzvf postgresql-9.4.1.tar.gz

#Configure, compile and check if successful
cd postgresql-9.4.1
./configure --prefix=/usr/local/postgresql-9.4.1
make
make check

#If successful, install

sudo make install

#Now, we'll install the init.d script that will start postgresql on start

sudo cp contrib/start-scripts/linux /etc/init.d/postgresql
sudo chmod +x /etc/init.d/postgresql

sudo sh -c "sed -i -e '32s/^.*$/prefix=\/usr\/local\/postgresql-9.4.1/g' /etc/init.d/postgresql"
sudo sh -c "sed -i -e '35s/^.*$/PGDATA=\"\/usr\/local\/postgresql-9.4.1\/data\"/g' /etc/init.d/postgresql"

#And save. Issue an update-rc.d to make it start on boot

sudo update-rc.d postgresql defaults

#Now create a file in /etc/profile.d that sets the postgres path.

sudo sh -c "echo 'PATH=/usr/local/postgresql-9.4.1/bin:\$PATH' > /etc/profile.d/pg.sh"
sudo sh -c "echo 'export PATH' >> /etc/profile.d/pg.sh"

#Configure the libraries to be found by the programs

sudo ldconfig /usr/local/postgresql-9.4.1/lib/

#Postgres uses a data folder to store the databases, which needs to be owned by the postgres user, so
#create the user for postgresql to run on
 
sudo useradd --shell /bin/bash postgres
sudo passwd postgres

#Create the folder and set permissions

sudo mkdir /usr/local/postgresql-9.4.1/data
sudo chown -R postgres /usr/local/postgresql-9.4.1/data

#Postgresql needs the data folder to be initialized, using the postgres user. The script being called
#also sets the superuser password for the database and configures locales

cd $DIR
sudo su -c ./postgres_config_files/createPGinit.sh postgres

#Start the server

sudo /etc/init.d/postgresql start

#To check if it is running you can issue `netstat -l` and look for a postgres line, or run: /usr/local/postgresql-9.4.1/bin/psql -U postgres

