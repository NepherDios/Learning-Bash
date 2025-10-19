#!/bin/bash

function valid_num_of_args(){
    [[ $# -gt 0 ]] || { echo "Please enter at least one filename as argument." ; exit 1; }
}

function valid_file_name(){
    #Regex arguments validation
    #Checks if the name contains letters, numbers and underscore only before extensions
    #Letting second extensions as an option for the user

    [[ $1 =~ ^[a-zA-Z0-9_]+\.[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)?$ ]] || return 1

}

function file_exists(){
    [[ -f "$1" ]] || return 1
}

function is_file_readable(){
    #Checks if the file is readable before going into count_words function, else wc will return an error of unreadable file
    [[ -r "$1" ]] || return 1
}

function count_words(){
    #Counts the number of words in the file and assigns it to num_of_words with Here Strings
    
    local num_of_words
    num_of_words=$(wc -w < "$1")

    echo "Number of words in '$1' file: ${num_of_words}"
}
