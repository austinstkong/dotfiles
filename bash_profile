# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/local/bin
#export PATH

# Up/down arrow for partial history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#bind '"\e[C": forward-char'
#bind '"\e[D": backward-char'

# Ctrl left/right to skip through words
#bind '"\eOC": forward-word'
#bind '"\eOD": backward-word'
bind '"[1;5C": forward-word'
bind '"[1;5D": backward-word'

# Alt left/right to skip to beginning/end of line
bind '"[1;3C": end-of-line'
bind '"[1;3D": beginning-of-line'
