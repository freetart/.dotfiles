#!bin/bash

# fastfetch on startup
fastfetch

# prompt
TITLE="\[\033]0;\w\007\]"
PROMPT="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# vi mode
set -o vi
bind -m vi-command "Control-l: clear-screen"
bind -m vi-insert "Control-l: clear-screen"

# aliases
alias ls="ls -a --color=auto"
alias ll="ls -lah --color=auto"
alias cp="cp -iv"
alias mv="mv -iv"
alias trash="trash -v"
alias code="vscodium"
alias vi="vim"

man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}

# exports
export PS1=${TITLE}${PROMPT}
export PAGER="less"
export EDITOR="vim"
export VISUAL="vim"
export PATH="$HOME/.cargo/bin:$PATH"
