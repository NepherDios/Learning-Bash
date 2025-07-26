#!/bin/bash

num_of_valid_names=0

if [[ ${#} -eq 0 ]]; then
    echo "Please provide at least one name."
    exit 1
fi

while [[ ${#} != 0 ]]; do
    if [[ ${1} =~ ^[a-zA-Z]+$ ]]; then
        echo "Name: ${1} is valid."
        
        ((num_of_valid_names++))
    else
        echo "Name: ${1} is invalid! Only letters are allowed."
    fi

    shift
done

echo "Number of valid names passed as arguments: ${num_of_valid_names}"
