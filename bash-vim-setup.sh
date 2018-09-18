#!/bin/bash

mkdir ~/.vim/colors -p
wget https://raw.githubusercontent.com/DrSpatula/vim-buddy/master/colors/buddy.vim
mv buddy.vim ~/.vim/colors

echo "-------------------------------------------------------------------"
echo "------------ vim color scheme configured, Next Phase --------------"
echo "-------------------------------------------------------------------"

sudo mv ~/.bashrc ~/.bashrc-copy
sudo cp .bashrc ~
sudo cp .bash_aliases ~

echo "-------------------------------------------------------------------"
echo "------------ .bashrc copied and replaced, Next Phase --------------"
echo "-------------------------------------------------------------------"

