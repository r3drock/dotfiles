# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/r3drock/.oh-my-zsh"

ZSH_THEME="trapd00r"
#ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

ENABLE_CORRECTION="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fzf)

source $ZSH/oh-my-zsh.sh

# User configuration


setopt no_beep auto_cd correct no_clobber hist_allow_clobber
setopt rm_star_wait extended_glob auto_pushd interactivecomments
eval `dircolors`

export PAGER=less
export MANPATH="/usr/share/man:$MANPATH"

bindkey -e
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^XE' edit-command-line
bindkey '^X^E' edit-command-line
bindkey '\e[3~' delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# prompt

autoload -U colors && colors
autoload -U promptinit && promptinit
#prompt bart
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
zstyle ':completion:vim:(all-|)files' ignored-patterns '(*.BAK|*.bak|*.o|*.aux|*.log|*.pdf|*.out|*.toc|*.swp|*~)'
zstyle ':completion:rm:(all-|)files' ignored-patterns
zstyle ':completion:*:default' list-colors  ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*:_approximate:*' max_errors \
	'reply=( $(( ($#PREFIX+$#SUFFIX(/3 )) numeric )'


source $HOME/.config/alias/bashalias
source $HOME/.config/alias/zshalias
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.inputrc


# history settings
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=12000
setopt hist_no_store hist_reduce_blanks hist_ignore_all_dups hist_ignore_space share_history append_history

lsp() { ls --color=always -l "$@" | less -r }

eval $(thefuck --alias)
