#export PATH=/usr/local/bin:$PATH

##### (History){
# file to save history
HISTFILE=~/.zsh_history
# history size on memory
HISTSIZE=100000
## history size to be saved
SAVEHIST=$HISTSIZE
## to save start and end time into history file
setopt extended_history
## to ignore command to be saved if it is as same as the last one
setopt hist_ignore_dups
## to ignore command started with space
setopt hist_ignore_space
## to append history
setopt inc_append_history
## to share history with other zsh
setopt share_history
##### }(History)

##### (Keybind){
# to use emacs keybind
bindkey -e
##### }(Keybind)

##### (Alias){
alias ls='ls -G'
#alias rm="rm -i"
#alias cp="cp -i"
#alias mv="mv -i"
# for local machine
#alias screen='/usr/local/bin/screen'
alias emacs='TERM=xterm-256color /usr/local/Cellar/emacs/24.2/bin/emacs -nw'
#alias git='/usr/local/git/bin/git'
##### }(Alias)

##### (Basics){
# to show the execution time (more than 3[sec])after the command
REPORTTIME=3
# to use color
autoload -Uz colors
colors
# to color prompt
setopt prompt_subst
# format of prompt
PROMPT="%{${fg[green]}%}%n@%m %# %{$reset_color%}"
# format of rear prompt
RPROMPT=" %{${fg[magenta]}%}%~%{$reset_color%}"

# to use complement function
zstyle :compinstall filename '~/.zshrc'
# to color complements
zstyle ':completion:*' list-colors ''
# to allow user to choose word from complement list
zstyle ':completion:*:default' menu select=1
# to add colors for complements
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# to be case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit

# to move directory without cd
setopt auto_cd
# to remember directory visited before //usage: cd -[tab]
setopt auto_pushd
# to ignore the same directory to be remembered
setopt pushd_ignore_dups
# to check spelling
setopt correct
setopt cdable_vars
# to show line feed code if it is not
unsetopt promptcr
# to show complement list
setopt auto_list
# to complement word with complement key
setopt auto_menu
# to show mark for each file type in complement list
setopt list_types
# to show packed list
setopt list_packed
# to forbid overwrite file with redirect
setopt no_clobber
# not to use  beep
setopt no_beep
# to resume suspended process when the same command is hit
setopt auto_resume
# to complement parenthesis
setopt auto_param_keys
# to complement slash after directory name
setopt auto_param_slash
# to add aliases to complements
setopt complete_aliases
# to complement arguments like "--prefix="
setopt magic_equal_subst
# to ignore "Ctrl+d" to be used for terminating shell
setopt ignore_eof
# to show files named written in Japanese character
setopt print_eightbit
# not to send HUP signal when shell is terminated
#setopt no_hup
##### }(Basics)
