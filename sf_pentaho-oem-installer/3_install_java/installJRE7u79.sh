#!/bin/bash

#Create directory where jre will be installed
sudo mkdir /usr/lib/jvm

#Create temp folder in current directory for jre download and change context to this folder
mkdir temp_java_install_file
cd temp_java_install_file

#Download jre 7 update 79 to temp folder and extract to /usr/lib/jvm
curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jre-7u79-linux-x64.tar.gz"
sudo tar xzvf jre-7u79-linux-x64.tar.gz -C /usr/lib/jvm

#Set JRE as system default JVM
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jre1.7.0_79/bin/java 100

