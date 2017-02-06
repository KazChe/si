#!/bin/bash

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir temp
cd temp

#Download, extract, and install all BA Server 5.2.1 plugins
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/paz-plugin-ee-5.4.0.1-130-dist.zip

unzip paz-plugin-ee-5.4.0.1-130-dist.zip

cd paz-plugin-ee-5.4.0.1-130
./install.sh

cd ..

wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/pdd-plugin-ee-5.4.0.1-130-dist.zip

unzip pdd-plugin-ee-5.4.0.1-130-dist.zip

cd pdd-plugin-ee-5.4.0.1-130
./install.sh

cd ..

wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/pentaho-mobile-plugin-5.4.0.1-130-dist.zip

unzip pentaho-mobile-plugin-5.4.0.1-130-dist.zip

cd pentaho-mobile-plugin-5.4.0.1-130
./install.sh

cd ..

wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/pir-plugin-ee-5.4.0.1-130-dist.zip

unzip pir-plugin-ee-5.4.0.1-130-dist.zip

cd pir-plugin-ee-5.4.0.1-130
./install.sh

cd ..

wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software\ Releases/Pentaho_BI_Suite/5.4.0.1-GA/BA-Server/Archive\ Build/pentaho-analysis-ee-5.4.0.1-130-dist.zip

unzip pentaho-analysis-ee-5.4.0.1-130-dist.zip

cd pentaho-analysis-ee-5.4.0.1-130
./install.sh
