#!/usr/bin/env bash
cd $(dirname $0)
if [[ -d .git ]]; then
    git submodule update --init --recursive
fi
echo "
set runtimepath+=~/.oh-my-vim
source ~/.oh-my-vim/basic.vim
source ~/.oh-my-vim/keymap.vim
try
    source ~/.oh-my-vim/my_config.vim
catch
endtry
source ~/.oh-my-vim/plugins.vim" > ~/.vimrc


