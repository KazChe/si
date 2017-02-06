#!/bin/sh

array=( item1 item2 item3 )
for index in ${!array[@]}; do
#echo $((index+1))/${#array[@]} = "${array[index]}"
echo "${array[index]}"
echo  
done
echo "Size of this array is " ${#array[*]}

myArray=()
echo "size of myArray is " ${#myArray[*]}
myArray+=('foo')
echo "size of myArray is " ${#myArray[*]}
myArray+=('bar')
echo "size of myArray is " ${#myArray[*]}

