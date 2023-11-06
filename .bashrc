# neofetch on startup
neofetch

# prompt
TITLE="\[\033]0;\w\007\]"
PROMPT="\[\e[0;31m\][\[\e[0;33m\]\u\[\e[0;32m\]@\[\e[0;34m\]\h \[\e[0;35m\]\W\[\e[0;31m\]]\\$ \[\e[0m\]"
PS1=${TITLE}${PROMPT}

# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# aliases
alias l="eza --icons -a"
alias ls="eza --icons -lah"
alias cp='cp -iv'
alias mv='mv -iv'
alias vim='nvim'
alias trash="trash -v"
alias code="vscodium"
alias dust="dust -b"
