#!/bin/bash

#source script with re-usable functions
. installUtil.sh 
checkIfExecutable installUtil.sh

#getProperty pentaho_home

#### Main Menu ####

#while true; 
#do
echo "**************************************************************************************"
echo
echo "In order to run this script:
echo "- A pentaho user needs to have already been created with sudo access."
echo "- You must know credentials required to download Pentaho 7 Enterprise."
echo "- Must know where your licenses are located." 
echo ""
echo "This script will guide you through and install the following on your server:"
echo
echo "1.  PostgreSQL Database"
echo "2.  Pentaho Database Tables"
echo "3.  JDK 8"
echo "4.  Pentaho 7"
echo "5.  Pentaho server with repository"
echo "6.  Pentaho Plugins"
echo "7.  Pentaho licenses"
echo "8.  Setup and configuration for IA-HCP"
echo
echo "**************************************************************************************"

while true; do
read -p " Ready to porcess?[Yy/Nn]" yn
case $yn in
[Yy]* ) break;;
[Nn]* ) exit;;
* ) echo " Please answer yes or no.";;
esac
done


case $choice in
1) 
echo ">>> Invoke function for db install -Proceeding with PostgreSQL install..."
installPostgres
echo ">>> now on to the next step"
installDBTables
installJDK8
installPentaho7
configurePentaho7WithRepository
installPluings
installLicenses
setupIAHCP
;;
#2)
#echo ">>> Proceeding with Installing databes tables"
#installDBTables
#;;
#3)
#echo ">>> Installing JDK 8"
#installJDK8
#;;
#4)
#echo ">>> Installing Pentaho 7"
#installPentaho7
#;;
#5)
#echo ">>> Configuring Pentaho server with repository"
#configurePentaho7WithRepository
#;;
#6) 
#echo "Installing plugins"
#installPluings
#;;
#7)
#echo "Installing licenses"
#installLicenses
#;;
#8)
#echo "IA-HCP setup and configurations"
#setupIAHCP
#;;
0)
echo "Exiting..."
exit
;;
*) 
echo "Not a valid choice.i try again."
;;
esac
done
done
