#!/bin/bash

## Location for install related key/value pair
propertyFile=install.properties

## Load install script specific properties into executing shell
source resources/scripts.properties

installPostgres() {
    checkIfExecutable $POSTGRES_INSTALL_SCRIPT 
    $POSTGRES_INSTALL_SCRIPT
}

createPostgresPentahoTables() {
    checkIfExecutable $POSTGRES_CREATE_PENTAHO_TABLES
    $POSTGRES_CREATE_PENTAHO_TABLES
}

installJDK8() {
    #checkIfExecutable sf_pentaho-oem-installer/3_install_java/installJDK8u101.sh
    checkIfExecutable $JDK8_INSTALL_SCRIPT
#    ./sf_pentaho-oem-installer/3_install_java/DummyinstallJDK8u101.sh
    $JDK8_INSTALL_SCRIPT
}

installPentaho7() {
    #checkIfExecutable sf_pentaho-oem-installer/4_install_pentaho_server/installPentaho7.sh
    checkIfExecutable $PENTAHO7_INSTALL_SCRIPT
    #./sf_pentaho-oem-installer/4_install_pentaho_server/installPentaho7.sh
    $PENTAHO7_INSTALL_SCRIPT
}

configurePentaho7WithRepository() {
    checkIfExecutable sf_pentaho-oem-installer/5_configure_pentaho_server_with_repository/StartRepositoryConfiguration.sh
    ./sf_pentaho-oem-installer/5_configure_pentaho_server_with_repository/DummyStartRepositoryConfiguration.sh
}

installPluings() {
    checkIfExecutable sf_pentaho-oem-installer/6_install_plugins/installPlugins.sh
    ./sf_pentaho-oem-installer/6_install_plugins/installPlugins.sh
}


installLicenses() {
    checkIfExecutable sf_pentaho-oem-installer/7_install_licenses/installLicenses.sh
    ./sf_pentaho-oem-installer/7_install_licenses/DummyinstallLicenses.sh
}

checkIfExecutable() {
 fileName=$1
 [[ -x $fileName ]] && X="Execute = yes" || X="Execute = No"
 if [[ "$X" == "Execute = No" ]]; then 
    chmod +x $fileName
 fi 
}

#### Function to read properties file and return value ####
getProperty() {
   propKey=$1
   propValue=`cat $propertyFile | grep "$propKey" | cut -d'=' -f2`
   echo value is $propValue
}

readFromFile() {
while IFS='' read -r line || [[ -n "$line" ]]; do
echo $line"
done < "$1"
}

postInstallCleanup() {
rm /tmp/ia4hcp_*
}
