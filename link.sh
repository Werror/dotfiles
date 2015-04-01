#!/bin/bash

function link {

    source=$1
    target="${HOME}/.$source"

    if [ -f "$target" ]; then
        return
    elif [ -d "$target" ]; then
        return
    else
        echo "Linking $source -> $target"
        ln -s "`pwd`/$source" "$target"
    fi

}

link bash_profile
link bashrc
link gitconfig
link vim
link vimrc
