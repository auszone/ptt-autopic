#!/bin/sh

path="$HOME/.bin"
install() {
    mkdir -p $path;
    BASE=$(dirname $0);
    export PATH="$PATH:$path"
    echo "Downloading imgcat to show image on iTerm2..."
    wget -nc -P $path "https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat"
    chmod a+x $path/imgcat
    echo "Done imagcat..."
    echo "Copy ptt-autopic to $path"
    cp $BASE/ptt-autopic.sh $HOME/.bin/ptt-autopic
    echo "Done. Start with command: [ssh bbsu@ptt.cc | ptt-autopic]"
}

uninstall() {
    rm -rf $path/ptt-autpic*
    echo "Done uninstallation.";
}

error() {
    echo "Usage:";
    echo "\"$0 install\" to install";
    echo "\"$0 uninstall\" to uninstall.";
}

main () {

    if [ "$#" -ne 1 ]; then
        echo $#
        error;
        exit 1;
    fi

    if [ $1 == "install" ]; then
        install;
        exit 0;
    fi

    if [ $1 == "uninstall" ]; then
        uninstall;
        exit 0;
    fi
    error;
}
main $@
