#!/bin/bash
read str

arr=()
if [[ "$str" == *","* ]]; then
    IFS=',' 
    read -ra arr <<< "$str"
else 
    IFS=' '
    read -ra arr <<< "$str"
fi

echo 
echo -n "Array : "
echo "${arr[*]}"

n=${#arr[@]}

#bubble sort
for (( i=0; i<n-1; i++ ))
do
    for (( j=0; j<n-i-1; j++ ))
    do
        if (( arr[j+1] < arr[j] ))
        then
         temp=${arr[j]}
         arr[j]=${arr[j+1]}
         arr[j+1]=$temp
        fi
    done
done

echo -n "Sorted array : "
echo "${arr[*]}"
