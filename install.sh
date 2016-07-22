#!/bin/sh
if [ -d $HOME/.bin  ]; then
    echo "$HOME/.bin already exists";
else
    mkdir $HOME/.bin;
fi
BASE=$(pwd)
export PATH="$PATH:$HOME/.bin"
echo "Downloading imgcat to show image on iTerm2..."
mktemp -d
cd $TMPDIR
git clone https://github.com/auszone/imgcat.git
cd imgcat && make && chmod a+x imgcat && cp imgcat $HOME/.bin 
rm -rf $TMPDIR
echo "Done imagcat..."
echo "Copy ptt-autopic to $HOME/.bin"
cp $BASE/ptt-autopic.sh $HOME/.bin/ptt-autopic
echo "Done. Start with command: [ssh bbsu@ptt.cc | ptt-autopic]"

