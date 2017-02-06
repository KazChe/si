#!/bin/bash

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir temp
cd temp

#Download and extract DI Server 6.1.0.1
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software%20Releases/7.0.0.0-GA/Pentaho%20Server/Archive%20Build%20(Suggested%20Installation%20Method)/pentaho-server-ee-7.0.0.0-25-dist.zip

unzip pdi-ee-6.1.0.1-196-dist.zip

cd pdi-ee-6.1.0.1-196
./install.sh
