#!/usr/bin/env bash
cd $(dirname $0)
git submodule update --init --recursive
echo '
set runtimepath+=~/.vim
source ~/.vim/basic.vim
source ~/.vim/keymap.vim
try
    source ~/.vim/my_config.vim
catch
endtry
' > ~/.vimrc

if [[ $1 == 'minimal' ]]; then
    echo 'source ~/.vim/minimal.vim' > ~/.vimrc
elif [[ $1 == 'minimal' ]]
    echo 'source ~/.vim/plugins.vim' > ~/.vimrc
fi
