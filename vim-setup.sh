#!/bin/bash

mkdir ~/.vim/colors -p
wget https://raw.githubusercontent.com/DrSpatula/vim-buddy/master/colors/buddy.vim
mv buddy.vim ~/.vim/colors

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp /etc/vim/vimrc /etc/vim/vimrc.bak
cp ./vimrc /etc/vim/vimrc
