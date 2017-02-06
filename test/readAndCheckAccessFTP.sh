#!/bin/bash
loginStatus=1
until [ $loginStatus = 0 ]; do
echo
read -p "Enter box.com username: " boxusername
read -s -p "Enter box.com password: " boxpassword

if [ ! -d temp ]; then
echo $PWD
echo "Making temp directory"
mkdir temp
fi

#Download and extract DI Server 6.1.0.1
#wget --user "$boxusername" --password "$boxpassword" ftp://ftp.box.com/Software%20Releases/7.0.0.0-GA/Pentaho%20Server/Archive%20Build%20%28Suggested%20Installation%20Method%29/pentaho-server-ee-7.0.0.0-25-dist.zip > temp/ftp_log 

grep "Login incorrect" temp/ftp_log
if [ $? -ne 0 ]; then
 echo "STATUSi WAS: $loginStatus"
 loginStatus=0
 echo " STATUS IS NOW: $loginStatus"
 break
fi
done
echo " MOVING ON...."
