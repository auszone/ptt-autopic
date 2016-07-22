#!/bin/sh
if [ -d $HOME/.bin  ]; then
    echo "$HOME/.bin already exists";
else
    mkdir $HOME/.bin;
fi
BASE=$(pwd)
export PATH="$PATH:$HOME/.bin"
echo "Downloading imgcat to show image on iTerm2..."
wget -nc -P $HOME/.bin "https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat"
chmod a+x $HOME/.bin/imgcat
echo "Done imagcat..."
echo "Copy ptt-autopic to $HOME/.bin"
cp $BASE/ptt-autopic.sh $HOME/.bin/ptt-autopic
echo "Done. Start with command: [ssh bbsu@ptt.cc | ptt-autopic]"

