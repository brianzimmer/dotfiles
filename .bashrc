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

vman() { /usr/bin/man $* | col -b | vim -c 'set ft=man nomod nolist' -; }
alias man='vman'

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
alias g=git 
complete -o default -o nospace -F _git g
alias tree="tree -Csu" # See file tree
alias c="clear"
alias h="history"
alias m="more"
alias mkdir="mkdir -p"
alias home="cd ~"
alias lo="logout"
alias d="dirs"
alias v="gvim"
alias vim="vim -X"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias path='echo -e ${PATH//:/\\n}'
alias rgrep="find . -name "*" | xargs grep"
alias ltspice="wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceIV/scad3.exe"
alias cs250="ssh -i .ssh/bmzimmer_inst -X cs250@icluster17.eecs.berkeley.edu"
alias cs250bz="ssh -X icluster17.eecs.berkeley.edu"
alias ta="cd /Users/bmzimmer/Documents/School/EE/ta_cs250/cs250-2011-fall"
alias i16="ssh -X icluster16.eecs.berkeley.edu"                                                               
alias i17="ssh -X icluster17.eecs.berkeley.edu"
alias i18="ssh -X icluster18.eecs.berkeley.edu"
alias i19="ssh -X icluster19.eecs.berkeley.edu"
alias i20="ssh -X icluster20.eecs.berkeley.edu"
alias i21="ssh -X icluster21.eecs.berkeley.edu"
alias i22="ssh -X icluster22.eecs.berkeley.edu"
alias getnx="echo \"export DISPLAY=$DISPLAY\" > ~/.nxdisplay"
alias setnx="source ~/.nxdisplay"
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

function sar() {
	ack $1
	echo -e "\n"
	read -p "Replace \"$1\" with \"$2?\" (y or n) " -n 1
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then 
		echo -e"\nNevermind...\n"
	else
		echo -e "\n"
		ack -l $1 | xargs perl -pi -e "s/$1/$2/g"
		ack $2
		echo -e "\n"
	fi
}


# See my processes
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

# Set prompt
# -----------------------------
PS1='\[\e]1;`pwdtail`\a\]\n\[\033[0;32m\]\u@\h$(__git_ps1 " (%s)") \[\033[33m\]\w\n\[\033[0m\]> '
#PS1='\[\e]1;`pwdtail`\a\]\n\[\033[0;32m\]\u@\h \[\033[33m\]\w\n\[\033[0m\]> '
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
unset HISTFILESIZE
export HISTSIZE=100000
# save history whenever new prompt spit out
export PROMPT_COMMAND="history -n; history -a"
# erase duplicates
#export HISTCONTROL=ignoredups:erasedups


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

if [ -f ~/dotfiles/bashcompletion/bash_completion ]; then
			. ~/dotfiles/bashcompletion/bash_completion
fi
