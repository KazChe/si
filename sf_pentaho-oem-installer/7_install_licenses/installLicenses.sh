#!/bin/bash

read -p "Enter folder path that contains license installer (do not include install_license.sh in your path): " licenseinstaller
read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

mkdir license_files
cd license_files

#Download all licenses and copy them to the license-installer folder
wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/DEV_LICENSES/*.lic

cp -f *.lic $licenseinstaller
cd $licenseinstaller

#Call license installer and install all downloaded licenses
./install_license.sh install Pentaho\ Analysis\ Enterprise\ Edition.lic
./install_license.sh install Pentaho\ BI\ Platform\ Enterprise\ Edition.lic
./install_license.sh install Pentaho\ Dashboard\ Designer.lic
./install_license.sh install Pentaho\ Hadoop\ Enterprise\ Edition.lic
./install_license.sh install Pentaho\ Mobile.lic
./install_license.sh install Pentaho\ PDI\ Enterprise\ Edition.lic
./install_license.sh install Pentaho\ Reporting\ Enterprise\ Edition.lic
