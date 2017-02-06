#!/bin/bash

echo
echo
echo ***************************************************************
echo
echo    Installing Pentaho Plugins
echo
echo **************************************************************
echo

## Load install script specific properties into executing shell
source resources/scripts.properties

until [ $loginStatus = 0 ]; do
echo
read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

if [ ! -d temp ]; then
   mkdir temp
fi

read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

#Download, extract, and install all BA Server 6.1.0.1 plugins
wget --user "$boxusername" --password "$boxpassword" $PENTAHO_FTP_SITE/$PAZ_PLUGIN

unzip $PAZ_PLUGIN 

cd paz-plugin-ee-7.0.0.0-25
./install.sh

wget --user "$boxusername" --password "$boxpassword" $PENTAHO_FTP_SITE/$PDD_PLUGIN

unzip $PDD_PLUGIN 

cd pdd-plugin-ee-7.0.0.0-25
./install.sh

wget --user "$boxusername" --password "$boxpassword" $PENTAHO_FTP_SITE/$MOBILE_PLUGIN

unzip $MOBILE_PLUGIN 

cd pentaho-mobile-plugin-7.0.0.0-25
./install.sh

wget --user "$boxusername" --password "$boxpassword" $PENTAHO_FTP_SITE/$PIR_PLUGIN

unzip $PIR_PLUGIN

cd pir-plugin-ee-7.0.0.0-25
./install.sh
