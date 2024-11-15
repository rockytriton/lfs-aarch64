#!/bin/bash
# Downloads and extracts tar file then changes directory into subfolder.
# If file already exists, will skip download.
# source this file to stay in the directory:
# . ./extract.sh <URL>
set -e

mkdir -p ./tmp

url=$1
src_filename=/sources/$(basename $url)
filename=./tmp/$(basename $url)
work_dir=$filename-ext
downloaded=0

if [ "$url" == "none" ]; then
    echo "No url, using tmp-work-dir"
    work_dir=./tmp/tmp-work-dir

    if [ -d $work_dir ]; then
        echo "Cleaning up work dir..."
        rm -rf $work_dir
    fi

    mkdir -p $work_dir
    cd $work_dir

else

if [ -f $src_filename ]; then
    #found in /sources use that instead...
    filename=$src_filename
fi

if [ ! -f $filename ]; then 
    echo "Downloading $url..."
    if ! wget -q $url -O $filename; then
        echo "Failed to download $url to $filename"
        rm -f $filename
        exit -1
    fi
    downloaded=1
else
    echo "Using pre-downloaded file $filename..."
fi

if [ -d $work_dir ]; then
    echo "Cleaning up work dir..."
    rm -rf $work_dir
fi

mkdir -p $work_dir

ext_dir=$(tar -tf $filename | head -1 | cut -f1 -d"/")

echo "Extracting..."
tar -xf $filename -C $work_dir

if [ "$downloaded" == "1" ]; then
    rm -f $filename
fi

cd $work_dir
cd $ext_dir

fi
