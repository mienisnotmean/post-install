#!/bin/bash

for f in dot-files/* ; do
    file=$(basename $f)
    if [ ! -f $HOME/.$df ]
    then
        ln -s $f ~/.$file
    else
        rm $HOME/.$file
        ln -s $f ~/.$file
    fi
done
