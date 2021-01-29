# .bash_aliases

# Make info command use vim-like key navigation
alias info="info --vi-keys"

# ls Aliases
#-----------------------------------------------------------
declare ls_options="lah" ls_command="ls"
if [ -z "${OS}" ]; then export OS="$(uname -s)"; fi && case "${OS}" in
    Linux*)     ls_options="AlhFG --color";;
    Darwin*)    ls_options="lhFGT";;
    CYGWIN*)    ;;
    MINGW*)     ;;
    *)          ;;
esac
if cmd::exists lsd; then
    ls_command="lsd"
    ls_options="${ls_options%GT} --almost-all"
fi
alias ll="${ls_command} -${ls_options}"
alias ls="${ls_command} -${ls_options}"
export LSCOLORS=GxFxCxDxBxegedabagaced
unset ls_options ls_command

# cd Aliases
#-----------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."

# lsVars: Output current session / environment variables
#-----------------------------------------------------------
#   (Replaced by lsvars(), see .bash_env_functions)
#   alias lsvars="( set -o posix ; set ) | less -R"

# '?' aliases for 'halp' cmd; probably a bad idea,
# but these work well on Darwin so far...
#-----------------------------------------------------------
if cmd::exists halp; then
    alias ?="halp"
    alias ??="halp -v"
    alias ???="halp -vv"
fi

# Other Command Aliases
#-----------------------------------------------------------

# http://mama.indstate.edu/users/ice/tree
if cmd::exists tree; then
    alias lst="tree -aCF --dirsfirst"
    alias lstree="tree -aCF --dirsfirst"
else
    lst="ll"
    lstree="ll"
fi

# https://dystroy.org/broot/
if cmd::exists br; then alias lsbr="br"; fi

# https://maven.apache.org/
if cmd::exists maven; then alias mvn="br"; fi

# https://www.vanheusden.com/multitail/
if cmd::exists multitail; then
    alias multitail="multitail -n 1000 -f --no-repeat -c -du -T --mark-interval 15 --config /usr/local/etc/multitail.conf -cS log4jnew "
fi

# Git Aliases
#-----------------------------------------------------------
# Preference is to have these aliases here instead of within
# .gitconfig alias block or other git-related dotfile, due
# to brevity of not having to type "git " before each.

# example usage: gshow 9ef3b649
alias gshow="clear && git show -p --stat --word-diff=color"

# May need to run 'git config --global diff.tool vimdiff' first, for gd aliases:
alias gd="git difftool"
alias gdy="git difftool -y"

alias gf="git fetch"
alias gs="clear; git status"
alias gss="clear; git-quick-stats"
alias gi="git add -i"
alias gc="git commit"
alias gcp="git cherry-pick"
if cmd::exists git-log-compact; then
    alias gl0="git-log-compact --decorate --merges --author-date"
    alias gl="git-log-compact --no-decorate --no-times --no-merges --author-date"
    alias gla="git-log-compact --no-decorate --no-times --no-merges --author-date --all"
    alias glg="git-log-compact --no-decorate --no-times --no-merges --author-date --graph"
    alias glag="git-log-compact --no-decorate --no-times --no-merges --author-date --all --graph"
    alias gl15="gl | nl -bp'^[^=]' -v0 | less -R"
else
    alias gl0="git log"
    alias gl="git log"
    alias gla="git log --all"
    alias glg="git log --graph"
    alias glag="git log --all --graph"
    alias gl15="git log"
fi
alias gl1="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
alias gl1a="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gl1g="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
alias gl1ag="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all --graph"
alias gl2="git log --shortstat --oneline"
alias gl2a="git log --shortstat --oneline --all"
alias gl2g="git log --shortstat --oneline --graph"
alias gl2ag="git log --shortstat --oneline --all --graph"
alias gl3="git log --pretty='%x09%C(Yellow)%h%C(reset) by %C(Cyan)%an%C(reset) on %C(dim white)%ad (%cr)%C(reset)%n%x09%C(green)%B%n' --date=short"
alias gl3a="git log --pretty='%x09%C(Yellow)%h%C(reset) by %C(Cyan)%an%C(reset) on %C(dim white)%ad (%cr)%C(reset)%n%x09%C(green)%B%n' --date=short --all"
alias gl3g="git log --pretty='%x09%C(Yellow)%h%C(reset) by %C(Cyan)%an%C(reset) on %C(dim white)%ad (%cr)%C(reset)%n%x09%C(green)%B%n' --date=short --graph"
alias gl3ag="git log --pretty='%x09%C(Yellow)%h%C(reset) by %C(Cyan)%an%C(reset) on %C(dim white)%ad (%cr)%C(reset)%n%x09%C(green)%B%n' --date=short --all --graph"
alias gl4="git log --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gl4a="git log --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl4g="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gl4ag="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl5="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl6="git log --abbrev-commit --stat --graph -p --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(reverse cyan)(%ar, %ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --date=short"
alias gl7="git log --pretty=format:'%w(79, 0, 34)%h %<(20,trunc)%an %s' -10"
alias gl8="git log --name-status --pretty=format:'%C(#cd9a00)%h%C(#0080ff) <%an> %C(#17b062)(%cr) %d%C(#c0d6de) %s'"
#alias gl9="git log --pretty=format:'%C(Yellow)%h%C(reset)    %C(dim white)%ad%C(reset)    %C(dim red)%<(5,trunc)%aN%C(reset)    %<($(($(tput cols)-33)),trunc)%s' --date=format:'%m/%d/%y' --reverse"
alias gl10="git log --pretty=format:'%C(Yellow)%h%C(reset)' --reverse"
#alias gl9="git log --graph --pretty=format:'%C(magenta)%D%Creset%n%C(green)%h %C(dim yellow)(%cr, %ad)%Creset %C(yellow)<%an>%n%C(bold blue)         %w($(($(tput cols)-12)), 9, 9)%s%n' --stat --date=short"
#alias gl10="git log --graph --abbrev-commit --decorate=no --date=short --format=format:'%C(03)%>|(22)%h%C(reset)  %C(04)%ad%C(reset)  %C(green)%<(14,trunc)%an%C(reset)  %C(bold 1)%d%C(reset)  %n%C(bold 7)%>|($(($(tput cols) - 9)))%w($(($(tput cols) -9)), 9, 9)%s%C(reset)%n' --all"
alias gl11="git log --oneline --all --graph --simplify-by-decoration"
alias gl12="git log --abbrev-commit --stat -p --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(reverse cyan)(%ar, %ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --date=short"

alias gl13="git log --abbrev-commit --stat -p --decorate --format=format:'%C(reverse cyan)  * %ar, on %ad > %C(reset)    %C(bold blue)%h%C(reset)   %C(bold yellow)%d%C(reset)%n %C(dim white)%an > %C(reset)\"%s\"%n ' --date=short"

# Redundant aliases, simply for remembering these commands are around
if cmd::exists ghist; then alias ghist="ghist"; fi
if cmd::exists gdiff; then alias gdiff="gdiff"; fi

