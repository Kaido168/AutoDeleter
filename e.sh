#!/bin/bash
day=$2
directory_path=$1
if [[ ! -n $1 ]]
then
echo "не указана директория"
exit 1
fi

if [[ ! -d $1 ]]
then
echo "это не директория"
exit 2
fi

if [[ ! -n $2 ]]
then
echo "не указано количество суток, после которого надо удалять файлы"
exit 3
fi


current_time=$(date +%s)
for file in "$directory_path"/*
do
    creation_time=$(stat -c %Y "$file")
    time_difference=$(( (current_time - creation_time) / (24 * 3600) ))
    if [ "$time_difference" -gt $day ]
    then
        rm "$file"
    fi
done
