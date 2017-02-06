#!/bin/bash

export PATH=/usr/local/postgresql-9.4.1/bin:$PATH

for f in *.sql;
do
psql -d postgres -U postgres -a -f "$f"
done