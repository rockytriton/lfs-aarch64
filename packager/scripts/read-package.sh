#!/bin/bash
BUNDLE=$1

set -e

package_list="package-list-$BUNDLE.txt"

if [ ! -f $package_list ]; then
    echo "Bundle not found: $BUNDLE"    
    exit -1
fi

lines=$(cat $package_list)

while read -r line
do
    fields=($line)
    pck=${fields[0]}
    url=${fields[1]}

    if [ "$pck" == "!import" ]; then
        ./read-package.sh $url
        continue
    fi

    echo "$line"

done <<< "$lines"

