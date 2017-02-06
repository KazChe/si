#!/bin/bash

## Load install script specific properties into executing shell
source resources/scripts.properties

#Download JDK8

cd /opt
sudo curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k $JDK8_BUILD_8u121_DOWNLOAD_URL 
sudo tar xzvf jdk-8u121-linux-x64.tar.gz
cd /opt/jdk1.8.0_121


#Set JRE as system default JVM

sudo update-alternatives --install /usr/bin/java java $JDK8_BUILD_8u121_INSTALLTION_PATH 200
echo
echo
echo "******************************************************************************
echo
echo "     When prompted please select option for $JDK8_BUILD_8u121_INSTALLTION_PATH"
echo
echo "******************************************************************************

sudo update-alternatives --config java

