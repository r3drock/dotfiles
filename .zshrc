setopt no_beep auto_cd complete_in_word correct rm_star_wait
eval `dircolors`

autoload -U compinit && compinit

autoload -U colors && colors
PS1="%{%(?..$fg_bold[red]%? )%}%{%(#.$fg_bold[red][.$fg_bold[green][%n@)%}%m\
%{%(#.$fg[cyan].$fg[white])%} %1~%(#.$fg[red].$fg[green])]%#%{$reset_color%} "

export EDITOR=vim
export PAGER=less

source $HOME/.config/alias/bashalias
source $HOME/.config/alias/zshalias

export GPG_TTY=$(tty)
set -o emacs
source $HOME/.inputrc
