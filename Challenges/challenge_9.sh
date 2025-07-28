#!/bin/bash
source ./utils.sh

#Challenge: File Checker with Logs

#Objective:
#Write a Bash script that takes any number of filenames as arguments. For each file:

#If it exists and is readable, count its words and display the count.

#If it's missing or unreadable:

#Output an error only to stderr.

#Log the error to a file called error_log.txt.

#Bonus:

#Redirect only successful word counts to output.txt, not the errors.
#Don't let a missing file crash the script — continue processing the others.

function main(){
    local num_of_words=0

    #Checks if the num of args is greater than none
    valid_num_of_args "$@"
    
    for i in "$@"; do
        if ! valid_file_name "$i"; then
            echo -e "File '$i' doesn't comply to the naming standards of a file!\n" | tee -a error_log.txt >&2
        elif ! file_exists "$i"; then
            echo -e "File '$i' not found!\n" | tee -a error_log.txt >&2
        elif ! is_file_readable "$i"; then
            echo -e "File '$i' not readable!\n" | tee -a error_log.txt >&2
        else
            count_words "$i" | tee -a output.txt >&1
        fi
    done
}

main "$@"
