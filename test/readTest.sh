#!/bin/bash

while true; do
read -p " Ready to porcess?[Yy/Nn]" yn
case $yn in
[Yy]* ) break;;
[Nn]* ) exit;;
* ) echo " Please answer yes or no.";;
esac
done
wait 3
echo `date`
