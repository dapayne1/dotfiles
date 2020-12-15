# .bashrc

# Source global .bashrc file
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi

# Set vim as default editor
export EDITOR="/usr/bin/vim"

# Source various sub-dotfiles
if [ -s ~/.bash_env_functions ]; then . ~/.bash_env_functions; fi
if [ -s ~/.bash_aliases ];       then . ~/.bash_aliases; fi
if [ -s ~/.devenv ];             then . ~/.devenv; fi

# Improve terminal history (dev/tested with iTerm2)
#-----------------------------------------------------------

# Keep histories for different tabs/ panes separate
MYTTY=$(tty)
tty_basename=$(basename "${MYTTY}")
HISTFILE="${HOME}/.bash_history_${tty_basename}"
unset tty_basename

# Rename iTerm2 tab titles
renametab () {
    echo -ne "\033]0;"$@"\007"
}
renametab "${MYTTY##*/}"
unset MYTTY

