export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=$HOME/.firefox/firefox
export XDG_CONFIG_HOME="$HOME/.config"	  #Reasoning behind these XDG_DIRS
export XDG_DATA_HOME="$HOME/.local/share" #https://0x46.net/thoughts/2019/02/01/dotfile-madness
export XDG_CACHE_HOME="$HOME/.cache"	  #https://wiki.archlinux.org/index.php/XDG_Base_Directory

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/nextcloud/scripts:$PATH"
export PATH="$HOME/.local/share/OpenPuff_release:/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export QEMU_IRIX="/usr/bin/qemu-irix"


if [ -f ~/.switchcapslockandescape ]; then
	setxkbmap -option caps:swapescape
fi
export GPG_TTY=$(tty)
