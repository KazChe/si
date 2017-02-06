#!/bin/bash

readFromFile() {
while IFS='' read -r line || [[ -n "$line" ]]; do
echo "I read: $line"
done < "$1"
}

readFromFile /tmp/pgpwd.txt
