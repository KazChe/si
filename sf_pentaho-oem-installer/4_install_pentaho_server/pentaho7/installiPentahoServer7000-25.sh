#!/bin/bash

## Load install script specific properties into executing shell
source resources/scripts.properties

until [ $loginStatus = 0 ]; do
echo
read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

if [ ! -d temp ]; then
   mkdir temp
fi

#Download and extract DI Server 6.1.0.1
#wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software%20Releases/7.0.0.0-GA/Pentaho%20Server/Archive%20Build%20%28Suggested%20Installation%20Method%29/pentaho-server-ee-7.0.0.0-25-dist.zip > temp/ftp_log
wget --user "$boxusername" --password "$boxpassword" $PENTAHO_FTP_SITE/$ZIPPED_PENTAHO_VERSION > temp/ftp_log


grep "Login incorrect" temp/ftp_log
if [ $? -ne 0 ]; then
 loginStatus=0
fi
done

unzip pentaho-server-ee-7.0.0.0-25-dist.zip 
cd pentaho-server-ee-7.0.0.0-25

## Execute silent install - bypassing EULA
cp $RESOURCES_DIR/auto-install.xml .

# Replace place-holder with path to Pentaho installtion directory
sed -i "s%REPLACE%$PENTAHO_INSTALL_DIR%" auto-install.xml
java -jar installer.jar auto-install.xml

## Create .kettle directory
echo "Creating .kettle directory"
cd $PENTAHO_INSTALL_DIR
mkdir .kettle

## Copy kettle.properties and repository.xml files from resources dir
cp $KETTLE_PROPERTIES_FILE .kettle/
cp $REPOSITORY_XML_FILE .kettle/
