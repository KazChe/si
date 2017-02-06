#!/bin/sh

PENTAHO_HOME=$HOME/Pentaho
SEARCH=IA4HCP

echo "$PENTAHO_HOME"
#sh -c  "sed -i -e 's/IA4HCP/\"\/home\/pentaho\/Pentaho\"/g' auto-install.xml"
sed -i  "s%REPLACE%$PENTAHO_HOME%" auto-install.xml
#sh -c "sed -i -e '35s/^.*$/PGDATA=\"\/var\/lib\/pgsql\/data\"/g' /etc/init.d/postgresql"
