#!/bin/bash

/usr/local/postgresql-9.4.1/bin/initdb -D /usr/local/postgresql-9.4.1/data --pwprompt -A password --locale=en_US.UTF-8

#Copy the following preconfigured postgres conf files. These have been configured so that
#postgres listens for all incoming addresses and is accessible from all remote locations.
cp -f ./postgres_config_files/pg_hba.conf /usr/local/postgresql-9.4.1/data
cp -f ./postgres_config_files/postgresql.conf /usr/local/postgresql-9.4.1/data

exit