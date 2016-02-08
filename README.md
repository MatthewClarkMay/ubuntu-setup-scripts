The contents of this repository are meant to ease the task of configuring a fresh Ubuntu installation.

Command Line Installation
-------------------------------------------------------------------
1. **sudo apt-get install git**
2. **git clone https://github.com/MatthewClarkMay/ubuntu-setup-scripts.git**
3. **cd ubuntu-setup-scripts/**
4. **./ubuntu-fresh-setup.sh**

After running the setup script, launch vim and run **:PluginInstall** to install the plugins listed in vimrc.

If you need to access proprietary media content (.WMV files for example), you will need to run **sudo apt-get install ubuntu-restricted-extras**

Other Recommendations
-------------------------------------------------------------------
1. Enable workspaces: **System Settings --> Appearance --> Behavior --> Enable workspaces**
2. Change unity launch bar icon size: **System Settings --> Appearance --> Launcher icon size**
3. Disable online search results when searching in dash: **System Settings --> Security & Privacy --> Search --> OFF**
4. Configure grive: great tutorial **http://dothisbest.com/how-to/install-google-drive-grive2-on-ubuntu/**
5. **Configure Thunderbird email client**
6. Install redis desktop manager: **http://redisdesktop.com/download --> Install package using ubuntu software center**
