#!/bin/bash

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir temp
cd temp

#Download and extract BA Server 5.2.1
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_Data_Integration/5.4.0.1-GA/Data-Integration-Server/Archive\ Build/pdi-ee-5.4.0.1-130-dist.zip

unzip pdi-ee-5.4.0.1-130-dist.zip

cd pdi-ee-5.4.0.1-130
./install.sh
