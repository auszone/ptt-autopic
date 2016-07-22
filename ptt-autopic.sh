#!/bin/sh

IMAGE_REGX="http:\/\/i.imgur.com\/"
PIC_CACHE_DIR="`dirname $0`/pic_cache";
init() {
    if [ -d "$PIC_CACHE_DIR" ]; then
        echo "$PIC_CACHE_DIR already exists";
    else
        mkdir $PIC_CACHE_DIR;
    fi
}

download_image() {
    wget -nc -P $PIC_CACHE_DIR $1 > /dev/null 2>&1
}

export PIC_CACHE_DIR
export -f download_image


find_images() {
    awk '
    BEGIN{FS="\/"}
    {
        print
        if($3=="i.imgur.com") {
            gsub(/jpg.*$/,"jpg",$4)
            system("download_image "$3"/"$4)
        }
    }
    '
}

init
find_images

