#!/bin/bash

#/usr/local/postgresql-9.4.1/bin/initdb -D /usr/local/postgresql-9.4.1/data --pwprompt -A password --locale=en_US.UTF-8
SCRIPT_HOME=$HOME/development/sf_pentaho-oem-installer/1_install_database/centos
echo "Enter postgres user password:"
sudo -u postgres <<'EOF'
/usr/local/pgsql/bin/initdb -D /var/lib/pgsql/data/
#Copy the following preconfigured postgres conf files. These have been configured so that
#postgres listens for all incoming addresses and is accessible from all remote locations.
cp -f $SCRIPT_HOME/postgres_config_files/pg_hba.conf /usr/local/src/postgresql-9.4.2/data
cp -f $SCRIPT_HOME/postgres_config_files/postgresql.conf /usr/local/src/postgresql-9.4.2/data
EOF
