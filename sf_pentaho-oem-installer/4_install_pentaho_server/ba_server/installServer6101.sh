#!/bin/bash

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir temp
cd temp

#Download and extract BA Server 6.1.0.1
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/6.1-Releases/6.1.0.1/ee/biserver-ee-6.1.0.1-196-dist.zip

unzip biserver-ee-6.1.0.1-196-dist.zip

cd biserver-ee-6.1.0.1-196
./install.sh
