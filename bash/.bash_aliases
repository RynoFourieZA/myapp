#! /usr/bin/bash

# Home Directory
alias h='cd ~'

# Directory navigation to relative path
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


alias reload='. .bashrc'

echo ".bash_aliases loaded"

# Run .git_aliases script

if [ -f ~/.git_aliases ]; then
	. ~/.git_aliases
fi

# Run .bash_profile script

if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi