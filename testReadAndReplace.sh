#!/bin/bash

## Load install script specific properties into executing shell
echo
echo
source resources/scripts.properties
echo "variable for pentho home: $PENTAHO_INSTALL_DIR"
INSTALL_DIR=$PENTAHO_INSTALL_DIR

cp $RESOURCES_DIR/auto-install.xml .

## Replace place-holder with Pentaho installtion directory variable
sed -ie "s%REPLACE%"$PENTAHO_INSTALL_DIR"%" ./auto-install.xml

echo $PWD
cat auto-install.xml

