# .bashrc
# Brian Zimmer, bmzimmer@eecs.berkeley.edu
#

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return


# Include local settings
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi


# Aliases
# -------
# Display the real path for pwd
alias sram="cd /scratch/bmzimmer/raven3_sram"
alias sramsim="cd /scratch/bmzimmer/raven3_sram/simulation"
alias diskspace="du -ch --max-depth=1 ."
alias ee241ta="ssh -X ee241-ta@icluster9.eecs.berkeley.edu"
alias ee241="ssh -X ee241@icluster9.eecs.berkeley.edu"
alias pwd2="cd \`readlink -f .\`"
alias viewgds="calibredrv -dl $DKITROOT/DATA/CALIBRE/calibre_tools/CalibreDrv.layerprops -s /users/bmzimmer/.calibrewb_workspace/wbinit.tcl -m "
#alias d="ls -h "
alias tpwd="pwd > ~/.tpwd"
alias tcd="cd `cat ~/.tpwd`"
alias raven3="source ~/raven3/st28nm_tech_include/sourceme.sh"
alias r7201="ssh -X bwrcr720-1.eecs.berkeley.edu"
alias r7202="ssh -X bwrcr720-2.eecs.berkeley.edu"
alias r7203="ssh -X bwrcr720-3.eecs.berkeley.edu"
alias r7204="ssh -X bwrcr720-4.eecs.berkeley.edu"
alias r7205="ssh -X bwrcr720-5.eecs.berkeley.edu"
alias r7206="ssh -X bwrcr720-6.eecs.berkeley.edu"
vman() { /usr/bin/man $* | col -b | vim -c 'set ft=man nomod nolist' -; }
alias man='vman'

alias dc='dc_shell-xg-t -64bit -topographical_mode -x "source dc_setup.tcl" '
alias dcg='dc_shell-xg-t -64bit -topographical_mode -gui -x "source dc_setup.tcl" '
alias icc='icc_shell -64bit'
alias iccg='icc_shell -64bit -gui'

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
#alias d="dirs"
alias v="gvim"
#alias vim="vim -X"
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
alias en="mailx brianzimmer.120ad@m.evernote.com < "
alias raven1="cd ~/designs/raven1_sram_defect_testing/opal_kelly/matlab"





# Display the stack of directories and prompt
    # the user for an entry.
    #
    # If the user enters 'p', pop the stack.
    # If the user enters a number, move that
    # directory to the top of the stack
    # If the user enters 'q', don't do anything.
    #
    function display_stack
    {
        dirs -v
        echo -n "#: "
        read dir
        if [[ $dir = 'p' ]]; then
            pushd > /dev/null
        elif [[ $dir != 'q' ]]; then
            d=$(dirs -l +$dir);
            popd +$dir > /dev/null
            pushd "$d" > /dev/null
        fi
    }
    alias d=display_stack

    function stack_cd {
        if [ $1 ]; then
            # use the pushd bash command to push the directory
            # to the top of the stack, and enter that directory
            pushd "$1" > /dev/null
            ls -F
        else
            # the normal cd behavior is to enter $HOME if no
            # arguments are specified
            pushd $HOME > /dev/null
        fi
    }
    # the cd command is now an alias to the stack_cd function
    #
    alias cd=stack_cd

# cd then ls
#function cd {
#    builtin cd "$@" && ls -F
#}

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

alias hs='history | grep -i' 

# See my processes
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

#export ztmux_pane=$(tmux show-messages | tail -1 | grep -o 'current pane [0-9]' | sed -e 's/current pane \([0-9]\)/\1/')
#export ztmux_window=$(tmux show-messages | tail -1 | grep -o '\[[0-9]\] \([0-9]\)' | grep -o '[0-9]$')
# Set prompt
# -----------------------------
PS1='\[\e]1;`pwdtail`\a\]\n\[\033[0;32m\]\u@\h$(__git_ps1 " (%s)") W$(echo $ztmux_window),P$(echo $ztmux_pane) \[\033[33m\]\w\n\[\033[0m\]> '
#PS1='\[\e]1;`pwdtail`\a\]\n\[\033[0;32m\]\u@\h \[\033[33m\]\w\n\[\033[0m\]> '
pwdtail () { #returns the last 2 fields of the working directory
    pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

export TERM="xterm-256color"
#export TERM="konsole-256color"

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
#export PROMPT_COMMAND="history -n; history -a"
export PROMPT_COMMAND="history -a"
# erase duplicates
#export HISTCONTROL=ignoredups:erasedups


# If start typing a command, then this will
# find all commands that start with this
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-backward'
# Trick: Ctrl-P will go back commands
# Trick: Ctrl-R will search history

bind '"\C-l":history-search-backward'
# Ctrl-p: search in previous history
bind 'Control-l: history-search-backward'
bind -m vi-insert 'Control-l: history-search-backward'
bind -m vi-command 'Control-l: history-search-backward'
bind -m vi-command ".":insert-last-argument
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word

# Make completion not be case sensitive
bind 'set completion-ignore-case on'
# Turn off that stupid bell
bind "set bell-style none"
bind "set show-all-if-ambiguous on"

if [ -f ~/dotfiles/bashcompletion/bash_completion ]; then
			. ~/dotfiles/bashcompletion/bash_completion
fi

set -o vi

# Added by Canopy installer on 2013-11-26
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /users/bmzimmer/designs/install/Enthought/Canopy/User/bin/activate
