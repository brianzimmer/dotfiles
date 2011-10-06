# .bash_profile
# Brian Zimmer, bmzimmer@eecs.berkeley.edu

# Paths (not in bashrc, only want to set once)
# -------
export PATH=~/bin:$PATH

# Terminal settings
export EDITOR="gvim"
# turn on color
export CLICOLOR=1

# Load bashrc as well to get the rest of my settings
# Must be at the bottom so bash completion loaded after paths
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Setting PATH for EPD_free-7.1-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH
