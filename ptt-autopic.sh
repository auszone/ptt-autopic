#!/bin/bash
#

PIC_CACHE_DIR="$HOME/.bin/ptt-autopic.cache";
export PIC_CACHE_DIR
init() {
    mkdir -p $PIC_CACHE_DIR;
}

download_show_image() {
    url="http://i.imgur.com/$1";
    wget -nc -P $PIC_CACHE_DIR $url > /dev/null 2>&1;
    imgcat $PIC_CACHE_DIR/$1;
}

export -f download_show_image

find_images() {
    gawk -F '/' '{
        if($3 ~ "imgur.com") {
            printf "\n\nDownload image : %s\n\n", $0;
            gsub(/jpg.*$/,"jpg",$4);
            gsub(/png.*$/,"png",$4);
            print "download_show_image", $4 | "/bin/bash";
            close("/bin/bash")
        } else {
            print;
        }
        fflush();
    }'
}
main() {
    init;
    find_images;
}
main

