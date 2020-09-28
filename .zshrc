## specify the file to save history
HISTFILE=~/.zsh_history
## history size on memory
HISTSIZE=100000
## history size to be saved
SAVEHIST=$HISTSIZE
## save start and end time into history file
setopt extended_history
## gnore command to be saved if it is as same as the last one
setopt hist_ignore_dups
## ignore command started with space
setopt hist_ignore_space
## append history
setopt inc_append_history
## share history with other zsh
setopt share_history

## use emacs keybind
bindkey -e

alias ls='ls -G'
#alias rm="rm -i"
#alias cp="cp -i"
#alias mv="mv -i"


## show the execution time (more than 3[sec])after the command
REPORTTIME=3
## use color
autoload -Uz colors
colors
## color prompt
setopt prompt_subst
## format of prompt
PROMPT="%{${fg[green]}%}%n@%m %# %{$reset_color%}"
## format of rear prompt
RPROMPT=" %{${fg[magenta]}%}%~%{$reset_color%}"

## use complement function
zstyle :compinstall filename '~/.zshrc'
## color complements
zstyle ':completion:*' list-colors ''
## allow to choose word from complement list
zstyle ':completion:*:default' menu select=1
## add colors for complements
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## enable case insensitive match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit

## move directory without cd
setopt auto_cd
## remember directory visited before //usage: cd -[tab]
setopt auto_pushd
## ignore the same directory to be remembered
setopt pushd_ignore_dups
## check spelling
setopt correct
setopt cdable_vars
## show line feed code if it is not
unsetopt promptcr
## show complement list
setopt auto_list
## complement word with complement key
setopt auto_menu
## show mark for each file type in complement list
setopt list_types
## show packed list
setopt list_packed
## forbid overwrite file with redirect
setopt no_clobber
## not to use beep
setopt no_beep
## to resume suspended process when the same command is hit
setopt auto_resume
## complement parenthesis
setopt auto_param_keys
## complement slash after directory name
setopt auto_param_slash
## add aliases to complements
setopt complete_aliases
## complement arguments like "--prefix="
setopt magic_equal_subst
## ignore "Ctrl+d" to be used for terminating shell
setopt ignore_eof
## show files named written using 8 bits characters
setopt print_eight_bit
## not to send HUP signal when shell is terminated
#setopt no_hup


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### for rust projects
export PATH="$HOME/.cargo/bin:$PATH"

### for haskell projects
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
