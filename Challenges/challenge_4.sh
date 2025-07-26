#!/bin/bash

[[ $# -eq 1 ]] || { echo "Please enter the filename as argument!"; exit 1; }
[[ $1 =~ ^[a-zA-Z0-9_]+$ ]] || { echo "Invalid file name!"; exit 1; }

[[ -f "$1" ]] && filename=$1 || { echo "File not found!"; exit 1; }

[[ -d "./Backup" ]] && cp "$filename" ./Backup || { mkdir ./Backup; mv "$filename" ./Backup; }
[[ $? -eq 0 ]] && echo "Backup succeeded!" || { echo "Backup failed!"; }

