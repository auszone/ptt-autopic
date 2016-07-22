#!/bin/bash

PIC_CACHE_DIR="$HOME/.bin/ptt-autopic.cache";
init() {
    if [ -d "$PIC_CACHE_DIR" ]; then
        echo "$PIC_CACHE_DIR already exists";
    else
        mkdir $PIC_CACHE_DIR;
    fi
}

download_show_image() {
    url="http://i.imgur.com/$1"
    wget -nc -P $PIC_CACHE_DIR $url > /dev/null 2>&1
    imgcat $PIC_CACHE_DIR/$1
}

export PIC_CACHE_DIR
export -f download_show_image


find_images() {
    awk '
    BEGIN{FS="\/"}
    {
        print
        if($3=="i.imgur.com") {
            gsub(/jpg.*$/,"jpg",$4)
            gsub(/png.*$/,"png",$4)
            system("download_show_image "$4)
        }
    }
    ' 2> /dev/null
}

init
find_images

