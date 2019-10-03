export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0 
export QT_SCALE_FACTOR=1 
export EDITOR=/usr/bin/nvim
#export your preferred browser from here
export XDG_CONFIG_HOME="$HOME/.config"	  #Reasoning behind these XDG_DIRS
export XDG_DATA_HOME="$HOME/.local/share" #https://0x46.net/thoughts/2019/02/01/dotfile-madness
export XDG_CACHE_HOME="$HOME/.cache"	  #https://wiki.archlinux.org/index.php/XDG_Base_Directory
# GTK+ 3 dark theme
export GTK_THEME=Adwaita:dark

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/nextcloud/scripts:$PATH"
export PATH="$HOME/.local/share/OpenPuff_release:/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export PATH="/opt/rocm/bin/:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1
export BROWSER=firefox
