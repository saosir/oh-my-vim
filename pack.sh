#!/usr/bin/env sh
cd $(dirname $0)
tar --exclude=*.pyc --exclude=*.git --exclude=.cache -czvf ./oh-my-vim.tar.gz ./ 
