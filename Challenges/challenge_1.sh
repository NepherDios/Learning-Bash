#!/bin/bash
while true; do
    read -p "Enter your Phone number: " phone_number

    if [[ ${phone_number} =~ ^[0-9]{3}[-]?[0-9]{3}[-]?[0-9]{4}$ ]]; then
        echo "You entered a valid Phone number."
        break
    else
        echo "Invalid Phone number. Please enter it in the format 123-456-7890 or 1234567890 or 123 456 7890."
    fi
done
