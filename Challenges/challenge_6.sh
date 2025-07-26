#!/bin/bash

if [[ ! ${1} =~ ^[0-9]{1,3}$ ]]; then
    echo "Please enter a number from 0 to 999"
    exit 1
fi

function is_prime(){
    if [[ ${1} -gt 1 ]]; then
        for ((i = 2; i < ${1}; i++)); do
            if (( ${1} % ${i} == 0 )); then
                return 1
            fi
        done
        return 0
    else
        return 1
    fi
}

if is_prime ${1}; then
    echo "The number ${1} is a prime number."
else
    echo "The number ${1} is not a prime number."
fi
