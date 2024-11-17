#!/bin/bash


while read -r line
do
    fields=($line)
    pck=${fields[0]}
    url=${fields[1]}

    pckpath=packages/${pck:0:1}/$pck
    pckfile=packages/${pck:0:1}/$pck/info.yml

    if [ -f $pckfile ]; then
        echo "already exists: $pckfile"
    else
        echo "name: \"$pck\"" >> $pckfile
        echo "version: \"\"" >> $pckfile
        echo "source: \"$url\"" >> $pckfile
        echo "dependencies: []" >> $pckfile
        echo "extras: []" >> $pckfile
    fi

done < "package-list-gtk4.txt"

