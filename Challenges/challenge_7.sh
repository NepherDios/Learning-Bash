#!/bin/bash

line_num=0
total_words_count=0

[[ "$#" != 1 ]] && { echo "Please enter only the filename as argument."; exit 1; }

[[ $1 =~ ^[a-zA-Z0-9_]+[.]{1}[a-z]+$ ]]|| { echo "Invalid file name!" ; exit 1; }

[[ -f "$1" ]] && filename="$1" || { echo "File not found!"; exit 1; }

[[ -r "$filename" ]] || { echo "File is not readable!"; exit 1; }

while IFS= read -r line; do
    ((line_num++))
    word_count=$(wc -w <<< "$line")
    ((total_words_count+=word_count))

    echo "Line ${line_num} with ${word_count} words: '${line}'"
done < "$filename"

echo "Total number of lines: ${line_num}"
echo "Total number of words: ${total_words_count}"
