setopt no_beep auto_cd correct no_clobber hist_allow_clobber
setopt rm_star_wait extended_glob auto_pushd interactivecomments
eval `dircolors`

export PAGER=less


bindkey -e
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^XE' edit-command-line
bindkey '^X^E' edit-command-line
bindkey '\e[3~' delete-char

# prompt

autoload -U colors && colors
autoload -U promptinit && promptinit
prompt bart
#PS1="%{%(?..$fg_bold[red]%? )%}%{%(#.$fg_bold[red][.$fg_bold[green][%n@)%}%m\
#%{%(#.$fg[cyan].$fg[white])%} %1~%(#.$fg[red].$fg[green])]%#%{$reset_color%} "


# Completion settings
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%S%d%s'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d${\e[0m%}'
zstyle ':completion:*:messages' format '%S%d%s'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}%d${\e[0m%}'
zstyle ':completion:*:(all-|)files' ignored-patterns  '(*.BAK|*.bak|*.o|*.aux|*.toc|*.swp|*~)'
zstyle ':completion:rm:(all-|)files' ignored-patterns
zstyle ':completion:*:default' list-colors  ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*:_approximate:*' max_errors \
	'reply=( $(( ($#PREFIX+$#SUFFIX(/3 )) numeric )'


source $HOME/.config/alias/bashalias
source $HOME/.config/alias/zshalias
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export GPG_TTY=$(tty)
export TERM=xterm-256color
source $HOME/.inputrc

# history settings
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=12000
setopt hist_no_store hist_reduce_blanks hist_ignore_all_dups hist_ignore_space share_history append_history

lsp() { ls --color=always -l "$@" | less -r }
