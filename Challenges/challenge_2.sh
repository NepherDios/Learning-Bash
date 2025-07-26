#!/bin/bash

if [[ ${#} != 2 || !(${1} =~ ^[a-zA-Z]{4,25}$ && ${2} =~ ^[0-9]{1,3}$) ]]; then
    echo "Please enter exactly 2 arguments."
    echo "Name(25 máx. characters) and age(0-120 years) respectively." 

    exit 1
fi

name=${1}
age=${2}

if [[ ${age} -lt 0 || ${age} -gt 120 ]]; then
    echo "You entered an invalid age!"
    echo "Please enter an age from 0 to 120 years"

    exit 1

elif [[ ${age} -ge 18 ]]; then
    echo "You're old enough. Welcome, ${name}!"
else
    echo "You're not old enough ${name}!"
fi


printf "\nUser Data:"
for i in ${@}; do
    if [[ ${i} == ${name} ]]; then
        printf "\n\tUser's Name: ${i}"
    else
        printf "\n\tUser's Age: ${i}"
    fi
done
