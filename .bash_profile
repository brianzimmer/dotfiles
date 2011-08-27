# .bash_profile
# Brian Zimmer, bmzimmer@eecs.berkeley.edu

# Instructional machines
[[ -e /share/b/bin/instructional.bashrc ]] && . /share/b/bin/instructional.bash_profile                                                                       


# Paths (not in bashrc, only want to set once)
# -------
export PATH=~/bin:$PATH

# BWRC
# ----
#export PATH=/tools/mathworks/matlab2009b/etc:/tools/mathworks/matlab2009b/bin/:$PATH
#export MOSEKLM_LICENSE_FILE=/tools/designs/Dcdg/users/sengoon/mosek/6/licenses 
# home directory bin


# CS250
# -----
#source ~cs250/tools/cs250.bashrc

#export STOW_ROOT="/home/aa/grad/bmzimmer/install"
#export STOW_PREFIX="${STOW_ROOT}/${STOW_ARCH}"
#export PATH=$STOW_ROOT/riscv/bin:$STOW_PREFIX/bin:$PATH
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH


# Terminal settings
export EDITOR="gvim"
# turn on color
export CLICOLOR=1

# Load bashrc as well to get the rest of my settings
# Must be at the bottom so bash completion loaded after paths
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
