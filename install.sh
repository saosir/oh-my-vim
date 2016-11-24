#!/usr/bin/env bash
cd $(dirname $0)
git submodule update --init --recursive
cp _vimrc ~/.vimrc