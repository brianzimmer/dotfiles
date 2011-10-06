# .bash_profile
# Brian Zimmer, bmzimmer@eecs.berkeley.edu

# Paths (not in bashrc, only want to set once)
# -------
export PATH=~/bin:$PATH

# BWRC
# ----
export PATH=/tools/mathworks/matlab2009b/etc:/tools/mathworks/matlab2009b/bin/:$PATH
export MOSEKLM_LICENSE_FILE=/tools/designs/Dcdg/users/sengoon/mosek/6/licenses 
# home directory bin
export LD_LIBRARY_PATH=/tools/designs/Dcdg/users/bmzimmer/install/mosek/6/tools/platform/linux64x86/bin:$LD_LIBRARY_PATH
#TODO: Need?
export LD_LIBRARY_PATH=/tools/designs/Dcdg/users/sengoon/lib/lib:$LD_LIBRARY_PATH
source /tools/flexlm/flexlm.sh


# Terminal settings
export EDITOR="gvim"
# turn on color
export CLICOLOR=1

# Load bashrc as well to get the rest of my settings
# Must be at the bottom so bash completion loaded after paths
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
