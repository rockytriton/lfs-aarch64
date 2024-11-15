#!/bin/bash

lines=$(cat $1)

while read -r line
do
    fields=($line)
    pck=${fields[0]}
    url=${fields[1]}
    bn=$(basename $url)

    firstchar=${pck:0:1}
    pckname="${pck%.*}"
    pckname2="${bn%.*}"

    if [ ! -f packages/$firstchar/$pckname/info.yml ]; then
        echo "name: \"$pckname\"" >> packages/$firstchar/$pckname/info.yml
        echo "version: \"\"" >> packages/$firstchar/$pckname/info.yml
        echo "source: \"$url\"" >> packages/$firstchar/$pckname/info.yml
        echo "dependencies: []" >> packages/$firstchar/$pckname/info.yml
        echo "extras: []" >> packages/$firstchar/$pckname/info.yml
    fi


done <<< "$lines"
