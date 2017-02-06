#!/bin/bash

## Load install script specific properties into executing shell
source resources/scripts.properties

export PATH=/usr/local/pgsql/bin:$PATH
for f in $CREATE_PENTAHO_DATABASES_SQL_FILES/*.sql;
do
psql -d postgres -U postgres -a -f "$f"
done
