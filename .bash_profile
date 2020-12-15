# .bash_profile

# Ensure .bashrc is properly sourced, thank you Mac OS X
if [ -r ~/.bashrc ]; then . ~/.bashrc; fi

# Add local ~/bin to $PATH, being careful not to prepend
# a leading colon in the case $PATH is empty/ undefined.
PATH="${PATH:+${PATH}:}${HOME}/bin"

# Ensure $PATH only has unique entries in it
if function::exists lspath; then lspath --clean ; fi

# Bind custom key bindings/ readline settings from .inputrc
if [ -s ~/.inputrc ]; then bind -f ~/.inputrc; fi

# $PS1 customization
if [ -s ~/.bash_PS1 ]; then . ~/.bash_PS1; fi

# Helpful self-reload alias, includes a screen clear
alias reload="printf \"\033c\"; . ~/.bash_profile"

# Comment this out to not clear term when sourcing this
printf -- "\033c"

