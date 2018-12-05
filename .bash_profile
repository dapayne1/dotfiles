#--------------------------------------
# Friendly output of filename
#--------------------------------------

echo -e "Loading [$(basename ${BASH_SOURCE})]...\n"

#--------------------------------------
# Sources .bashrc, if present, as some
# environments do not automatically do
# so (Mac OS X, Git Bash for Windows,
# etc.)
#--------------------------------------

source_file="$HOME/.bashrc"
if [ -s ${source_file} ]; then
    echo -n "   > Sourcing [${source_file}]... "
    source ${source_file}
    echo "done."
fi

#--------------------------------------
# Sources git-completion, if present,
# for handy git command auto-completion.
#--------------------------------------

source_file="/usr/local/etc/bash_completion"
if [ -s ${source_file} ]; then
    echo -n "   > Sourcing [${source_file}]... "
    source ${source_file}
    echo "done."
fi

#--------------------------------------
# Detect OS, for OS-specific scripts
# further down.
#
# Populates: ${machine_os}
#--------------------------------------

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine_os=Linux;;
    Darwin*)    machine_os=Mac;;
    CYGWIN*)    machine_os=Cygwin;;
    MINGW*)     machine_os=MinGw;;
    *)          machine_os="UNKNOWN:${unameOut}"
esac
unset unameOut
# echo -e "\n   > OS Detected: [${machine_os}]"

#--------------------------------------
# Iff ${machine_os} is MinGw (like
# Git Bash for Windows would be),
# auto-launches ssh-agent right away.
#--------------------------------------

if [ ${machine_os} = "MinGw" ]; then
    echo "...Loading Windows specific settings..."

    #--------------------------------------
    # Auto-launches ssh-agent right away.
    #--------------------------------------

    echo "...Launching ssh-agent for Git Bash for Windows..."
    env=~/.ssh/agent.env

    agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

    agent_start () {
        (umask 077; ssh-agent >| "$env")
        . "$env" >| /dev/null ; }

    agent_load_env

    # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
    agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        agent_start
        ssh-add
    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        ssh-add
    fi

    unset env

    #--------------------------------------

fi

#--------------------------------------

unset source_file
echo -e "\n...[$(basename ${BASH_SOURCE})] loaded."
