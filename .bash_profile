# .bash_profile
# Brian Zimmer, bmzimmer@eecs.berkeley.edu


# Load bashrc as well to get the rest of my settings
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


# Paths (not in bashrc, only want to set once)
# -------
# matlab
export PATH=/tools/mathworks/matlab2009b/etc:/tools/mathworks/matlab2009b/bin/:$PATH
export MOSEKLM_LICENSE_FILE=/tools/designs/Dcdg/users/sengoon/mosek/6/licenses 
# home directory bin
export PATH=~/bin:$PATH
export PATH=~/install/git/bin:$PATH

# terminal settings
export EDITOR="gvim"
# turn on color
export CLICOLOR=1


#Old stuf from CS250
#export STOW_ROOT="/home/aa/grad/bmzimmer/install"
#export STOW_PREFIX="${STOW_ROOT}/${STOW_ARCH}"
#export PATH=$STOW_ROOT/riscv/bin:$STOW_PREFIX/bin:$PATH
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
	      . /opt/local/etc/bash_completion
fi
