#!/bin/bash

function valid_num_of_arguments(){
    [[ $1 -gt 0 ]] || { echo "Please enter at least one filename as argument." ; exit 1; }
}

function valid_file_name(){
    #Regex arguments validation
    #Checks if the name constains letters, numbers and undercore only before extensions 
    #Letting second extensions as an option for the user
    
    [[ $1 =~ ^[a-zA-Z0-9_]+\.[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)?$ ]] || { printf "\nFile '$1' doesn't comply to the standard file names!\n"; return 1; }

}

function file_exists(){
    [[ -f "$1" ]] || { printf "\nFile '$1' not found.\n"; return 1; }
}

function is_file_readable(){
    #Checks if the file is readable before going into count_words function, else wc will return an error of unreadable file
    [[ -r "$1" ]] || { printf "\nFile '$1' is not readable!\n"; return 1; }
} 

function count_words(){
    #Counts the number of words in the file and assigns it to num_of_words with Here Strings
    local num_of_words
    num_of_words=$(wc -w < "$1")
    
    ((total_words+=${num_of_words}))

    printf "\nNumber of words in '$1' file: ${num_of_words}\n"
}

function main(){
    total_words=0
    
    valid_num_of_arguments "$#"
    
    while [[ $# -gt 0 ]]; do
        valid_file_name "$1" && file_exists "$1" && is_file_readable "$1" && count_words "$1"
        shift
    done

    [[ ${total_words} -gt 0 ]] && printf "Total words counted: %s\n" "$total_words" || {
        echo "There were no words in any of the files or there were no valid files to check!"; 
    }
}

main "$@"
