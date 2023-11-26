#!bin/bash

# kenny prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# neofetch on startup
neofetch

# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# aliases
alias ls='ls -a --color=auto'
alias ll='ls -lah --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias trash="trash -v"
alias code="vscodium"
