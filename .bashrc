# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '

# General
alias ip="ipconfig getifaddr en0"

# Git
alias gits="git status"
alias gitd="git diff"
alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"

# Kubernetes
alias k="kubectl"
alias km="kubectl delete -f . --recursive && kubectl apply -f . --recursive"
alias ka="kubectl apply -f . --recursive"
alias kd="kubectl delete -f . --recursive"
alias kccc="kubectl config current-context"
alias kcucc="kubectl config unset current-context"
alias kcscc="kubectl config set current-context"
alias kcgx="kubectl config get-contexts"
alias kcgc="kubectl config get-clusters"

# Server
alias home-server="ssh will@home-server"

# Zshrc
alias bashrc="nvim ~/.bashrc"
alias sbashrc="source ~/.bashrc"

