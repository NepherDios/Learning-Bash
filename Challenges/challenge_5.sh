#!/bin/bash

evens=()
odds=()

for number in "$@"; do
    if [[ ${number} =~ ^-?[0-9]+$ ]]; then
        (( ${number} % 2 == 0 )) && { evens+=("${number}"); } || { odds+=("${number}"); }
    fi
done

echo "Even numbers:"
printf "%s\n" "${evens[@]}"

printf "\nOdd numbers:\n"
printf "%s\n" "${odds[@]}"

printf "\nTotal even: ${#evens[@]}\n"
echo "Total odd: ${#odds[@]}"
