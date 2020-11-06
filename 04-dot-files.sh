#!/bin/bash

for f in dot-files/* ; do
    sudo ln -s $f ~/.$f
done
