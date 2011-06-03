# .bashrc
# Brian Zimmer, bmzimmer@eecs.berkeley.edu
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Include local settings
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi


# Aliases
# -------

# Display the real path for pwd
alias pwd2="cd \`readlink -f .\`"
alias d="ls -h "

if [ $(uname) == "Linux" ]; then
	alias ls="ls -hF --color" # normal color
	alias ll="ls -l -h --color" # put directories first
	alias la="ls -a -h --color" # show hidden files
	alias lal="ls -a -l -h --color"
	alias lrt="ls -lrt --color" # show last recently used
	alias grep="grep --color"
else
	alias ls="ls -hF" # normal color
	alias ll="ls -l -h" # put directories first
	alias la="ls -a -h" # show hidden files
	alias lal="ls -a -l -h"
	alias lrt="ls -lrt" # show last recently used
	alias grep="grep"
fi

alias tree="tree -Csu" # See file tree
alias c="clear"
alias h="history"
alias m="more"
alias mkdir="mkdir -p"
alias home="cd ~"
alias lo="logout"
alias fi="finger"
alias d="dirs"
alias v="gvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias path='echo -e ${PATH//:/\\n}'
alias rgrep="find . -name "*" | xargs grep"
# cd then ls
function cd {
    builtin cd "$@" && ls -F
}


# Functions
# ---------
# Find a file with a pattern in name:
# eg. ff filename
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# List directories
function lsd() {
    ls -F "$@" | grep \/$
}


# See my processes
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

# Set prompt
# -----------------------------
PS1='\[\e]1;`pwdtail`\a\]\n\[\033[0;32m\]\u@\h \[\033[33m\]\w\n\[\033[0m\]> '
pwdtail () { #returns the last 2 fields of the working directory
    pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

export TERM="xterm-256color"

# Bash Options
shopt -s cdspell                    # autocorrects cd misspellings
shopt -s checkwinsize               # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist                    # save multi-line commands in history as single line
shopt -s dotglob                    # include dotfiles in pathname expansion
shopt -s expand_aliases             # expand aliases
shopt -s extglob                    # enable extended pattern-matching features
shopt -s nocaseglob                 # pathname expansion will be treated as case-insensitive
shopt -s no_empty_cmd_completion    # No empty completion

# Keep history in sync across multiple terminals constantly
# Append History instead of overwriting file.
shopt -s histappend
# save lots of history
export HISTSIZE=100000
# erase duplicates
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -r; "


# If start typing a command, then this will
# find all commands that start with this
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Trick: Ctrl-P will go back commands
# Trick: Ctrl-R will search history

# Make completion not be case sensitive
bind 'set completion-ignore-case on'
# Turn off that stupid bell
bind "set bell-style none"
bind "set show-all-if-ambiguous on"
