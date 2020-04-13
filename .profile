export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0 
export QT_SCALE_FACTOR=1 
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=$HOME/.firefox/firefox
export XDG_CONFIG_HOME="$HOME/.config"	  #Reasoning behind these XDG_DIRS
export XDG_DATA_HOME="$HOME/.local/share" #https://0x46.net/thoughts/2019/02/01/dotfile-madness
export XDG_CACHE_HOME="$HOME/.cache"	  #https://wiki.archlinux.org/index.php/XDG_Base_Directory

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/OpenPuff_release:/usr/local/texlive/2018/bin/x86_64-linux"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/bin:$PATH"
export PATH="$PATH:/usr/local/texlive/2018/bin/x86_64-linux"
export PATH="$PATH:/opt/rocm/bin/"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export QEMU_IRIX="/usr/bin/qemu-irix"

export FZF_DEFAULT_OPTS='--height 40% --border'

if [ -f ~/.switchcapslockandescape ] || [ "$DESKTOP_SESSION" = "/usr/share/xsessions/gnome-xorg" ] ; then
	setxkbmap -option caps:swapescape
fi
export ANSIBLE_COW_SELECTION=elephant
export GPG_TTY=$(tty)
export TERM=xterm-256color
export RUST_SRC_PATH="/home/r3drock/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

export PATH="$HOME/.cargo/bin:$PATH"
