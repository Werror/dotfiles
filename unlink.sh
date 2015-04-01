#!/bin/bash

function unlink {

    source=$1
    target="${HOME}/.$source"

    if [ -L "$target" ]; then
        echo "Unlinking $source -> $target"
        rm "$target"
    fi

}

unlink bash_profile
unlink bashrc
unlink gitconfig
unlink vim
unlink vimrc
