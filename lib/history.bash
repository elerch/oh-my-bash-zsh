# Taken from https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist
# PROMPT_COMMAND='history -a' # cool but we don't mess with prompts
