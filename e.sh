#!/bin/bash

directory_path="путь к папке с файлами"
current_time=$(date +%s)
for file in "directory_path"/*
do
    current_time=$(stat -c %Y "$file")
    time_difference=$(( (current_time - creation_time) / (24 * 3600) ))
    if [ "$time_difference" -gt 365 ]
    then
        rm "file"
    fi
done