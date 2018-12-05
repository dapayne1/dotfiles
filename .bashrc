
#--------------------------------------
# Friendly output of filename
#--------------------------------------

this_filename=$(basename $BASH_SOURCE)
indent_spacing="    "
echo "${indent_spacing}Loading [${this_filename}]..."

#--------------------------------------
# General command aliases
#--------------------------------------

alias ls="ls -la"

#--------------------------------------
# Git-related aliases... preferred here
# rather than at git configure/alias 
# level due to brevity of not typing
# "git" first; to each their own.
#--------------------------------------

alias gf="git fetch"
alias gs="clear; git status"
alias gi="git add -i"
alias gc="git commit"

echo "${indent_spacing}...[${this_filename}] loaded."

unset this_filename
unset indent_spacing

