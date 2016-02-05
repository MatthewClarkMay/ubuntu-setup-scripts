#!/bin/bash

sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list

echo "-------------------------------------------------------------------"
echo "------------- Sources have been edited, Next Phase ----------------"
echo "-------------------------------------------------------------------"

echo "Downloading GetDeb and PlayDeb" &&
    wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb &&
    echo "Installing GetDeb" &&
    sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb &&
    echo "Installing PlayDeb" &&
    sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb &&
    echo "Deleting Downloads" &&
    rm -f getdeb-repository_0.1-1~getdeb1_all.deb &&
    rm -f playdeb_0.3-1~getdeb1_all.deb

echo "-------------------------------------------------------------------"
echo "----------- GetDeb and PlayDeb Installed, Next Phase --------------"
echo "-------------------------------------------------------------------"

sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable

echo "-------------------------------------------------------------------"
echo "------------------- PPA's added, Next Phase -----------------------"
echo "-------------------------------------------------------------------"

echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
    echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
    wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -

echo "-------------------------------------------------------------------"
echo "------------------- VLC PPA Added, Next Phase ---------------------"
echo "-------------------------------------------------------------------"

sudo apt-get update
sudo apt-get install libgdk-pixbuf2.0 -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

echo "-------------------------------------------------------------------"
echo "----- update, upgrade, and dist-upgrade complete, Next Phase ------"
echo "-------------------------------------------------------------------"

sudo apt-get install synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager bleachbit openjdk-7-jre oracle-java8-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libswscale-extra-2 ubuntu-wallpapers* htop hexedit exiftool exif nmap vim volatility qbittorrent chromium-browser gufw speedcrunch gparted git wireshark -y

echo "-------------------------------------------------------------------"
echo "---------- Lots of cool software installed, Next Phase ------------"
echo "-------------------------------------------------------------------"

sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark $USER

echo "-------------------------------------------------------------------"
echo "---------------- Wireshark configured, Next Phase -----------------"
echo "-------------------------------------------------------------------"

if [[ $(getconf LONG_BIT) = "64" ]]
then
    echo "64bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    sudo dpkg -i google-chrome-stable_current_amd64.deb &&
    rm -f google-chrome-stable_current_amd64.deb
else
    echo "32bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
    sudo dpkg -i google-chrome-stable_current_i386.deb &&
    rm -f google-chrome-stable_current_i386.deb
fi

echo "-------------------------------------------------------------------"
echo "----------------- Chrome Installed, Next Phase --------------------"
echo "-------------------------------------------------------------------"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo mv /etc/vim/vimrc /etc/vim/vimrc-backup
sudo mv vimrc /etc/vim/

echo "-------------------------------------------------------------------"
echo "------------- Vundle and vimrc configured, Next Phase -------------"
echo "-------------------------------------------------------------------"

mkdir ~/.vim/colors
wget https://raw.githubusercontent.com/DrSpatula/vim-buddy/master/colors/buddy.vim
mv buddy.vim ~/.vim/colors

echo "-------------------------------------------------------------------"
echo "------------ vim color scheme configured, Next Phase --------------"
echo "-------------------------------------------------------------------"

sudo mv ~/.bashrc ~/.bashrc-copy
sudo mv .bashrc ~
sudo mv .bash_aliases ~

echo "-------------------------------------------------------------------"
echo "------------ .bashrc copied and replaced, Next Phase --------------"
echo "-------------------------------------------------------------------"

sudo dpkg-reconfigure tzdata

echo "-------------------------------------------------------------------"
echo "--------------- Time Zone reconfigured, Next Phase ----------------"
echo "-------------------------------------------------------------------"

echo "Cleaning Up" &&
    sudo apt-get -f install &&
    sudo apt-get autoremove &&
    sudo apt-get -y autoclean &&
    sudo apt-get -y clean

echo "-------------------------------------------------------------------"
echo "-------------------- System Clean, Rebooting ----------------------"
echo "-------------------------------------------------------------------"

sudo reboot
