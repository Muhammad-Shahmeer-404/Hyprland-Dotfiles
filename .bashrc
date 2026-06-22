#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ff='fastfetch'


# PS0='\n'
PS1='\[$(tput setaf 2)\][\@]\[$(tput sgr0)\] \[$(tput setaf 10)\][\w]\n -> '
