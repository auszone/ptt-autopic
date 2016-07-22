#!/bin/sh

IMAGE_REGX="http:\/\/i.imgur.com\/"
DIR="`dirname $0`/pic_cache";
init() {
    if [ -d "$DIR" ]; then
        echo "$DIR already exists";
    else
        mkdir $DIR;
    fi
}

find_images() {
    IMAGE_URLS=$(awk '
    {
        if($0 ~ "http:\/\/i.imgur.com\/") {
            print

        }
    else {
    }
}')
}

download_images() {
    for i in "${IMAGE_URLS[@]}"
    do
        wget -nc -P $DIR $i > /dev/null 2>&1 &
    done
}

init
find_images
download_images


