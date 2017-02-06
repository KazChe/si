#!/bin/bash

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir temp
cd temp

#Download and extract BA Server 5.2.1
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/biserver-ee-5.4.0.1-130-dist.zip

unzip biserver-ee-5.4.0.1-130-dist.zip

cd biserver-ee-5.4.0.1-130
./install.sh
