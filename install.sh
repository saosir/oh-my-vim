#!/usr/bin/env bash
cd $(dirname $0)
if [[ -d .git ]]; then
    git submodule update --init --recursive
fi
echo "
set runtimepath+=~/.vim
source ~/.vim/basic.vim
source ~/.vim/keymap.vim
try
    source ~/.vim/my_config.vim
catch
endtry
source ~/.vim/plugins.vim" > ~/.vimrc


