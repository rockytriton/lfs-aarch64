#!/bin/bash
cd packages
for f in $(ls -1)
do
    firstchar=${f:0:1}
    pckname="${f%.*}"
    mkdir -p $firstchar/$pckname/

    mv $f $firstchar/$pckname/build.sh

done;
