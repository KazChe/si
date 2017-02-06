#!/bin/bash

#source script with re-usable functions
. installUtil.sh 
checkIfExecutable installUtil.sh

#getProperty pentaho_home

#### Main Menu ####
echo
echo
echo "**********************************************************************************************"
echo
echo "In order to run this script:"
echo "- A pentaho user needs to have already been created with sudo access."
echo "- You must know credentials required to download Pentaho 7 Enterprise."
echo "- Must know where your licenses are located." 
echo ""
echo "This script will guide you through and install and or create the following on your server:"
echo
echo "1.  PostgreSQL Database"
echo "2.  Pentaho Database Tables"
echo "3.  JDK 8"
echo "4.  Pentaho 7"
echo "5.  Pentaho Plugins"
echo "6.  Pentaho licenses"
echo "7.  Setup and configuration of IA-HCP"
echo
echo "******************************i***************************************************************"

while true; do
read -p " Ready to porcess?[Yy/Nn]" yn
case $yn in
[Yy]* ) break;;
[Nn]* ) exit;;
* ) echo " Please answer yes or no.";;
esac
done

echo ">>> Starting PostgresSQL 9.4.2 download and install..."
#installPostgres 
echo ">>> Creating Pentaho DBs..."
#createPostgresPentahoTables
echo ">>> Installing JDK 8"
#installJDK8
echo ">>> Installing Pentaho7..."
#installPentaho7
installPluings
installLicenses
#setupIAHCP
