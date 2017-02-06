#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

echo "-------------------------------------------------------------------"
echo "----- update, upgrade, and dist-upgrade complete, Next Phase ------"
echo "-------------------------------------------------------------------"


sudo apt install vlc eopenjdk-8-jdk ubuntu-wallpapers* htop hexedit exiftool exif nmap vim gparted python-pip python3-pip google-chrome-stable

echo "-------------------------------------------------------------------"
echo "---------- Lots of cool software installed, Next Phase ------------"
echo "-------------------------------------------------------------------"

echo "Cleaning Up" &&
    sudo apt -f install &&
    sudo apt autoremove &&
    sudo apt -y autoclean &&
    sudo apt -y clean

echo "-------------------------------------------------------------------"
echo "-------------------- System Clean, Rebooting ----------------------"
echo "-------------------------------------------------------------------"
