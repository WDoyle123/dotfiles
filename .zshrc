###############################################################################
#                               OH-MY-ZSH SETUP                                #
###############################################################################

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

###############################################################################
#                                   COLORS                                    #
###############################################################################

export GREP_COLORS='sl=49;39:cx=49;39:mt=49;31;1:fn=49;32:ln=49;33:bn=49;33:se=1;36'
export LS_COLORS='di=1;32:ln=1;30;47:so=30;45:pi=30;45:ex=1;31:bd=30;46:cd=30;46:su=30:sg=30;41:tw=30;41:ow=30;41:*.rpm=1;31:*.deb=1;31'
export lscolors="cxahafafbxagagabababab"

if [[ -z "${LS_COLORS}" ]] && command -v dircolors &>/dev/null; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  elif [[ -r /etc/dir_colors ]]; then
    eval "$(dircolors -b /etc/dir_colors)"
  else
    eval "$(dircolors -b)"
  fi
fi

export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m' 
export LESS_TERMCAP_me=$'\e[0m'         
export LESS_TERMCAP_se=$'\e[0m'        
export LESS_TERMCAP_so=$'\e[38;5;246m'   
export LESS_TERMCAP_ue=$'\e[0m'         
export LESS_TERMCAP_us=$'\e[04;38;5;146m'


###############################################################################
#                              ENVIRONMENT VARS                               #
###############################################################################

# AWS
export AWS_DEFAULT_PROFILE="default"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "

# Brew
export HOMEBREW_AUTO_UPDATE_SECS="86400"

setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups


###############################################################################
#                                   PATH                                      #
###############################################################################

export PATH="/opt/homebrew/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/cellar/postgresql@15/15.6_1/bin:/opt/homebrew/opt/postgresql@15/bin:/opt/homebrew/opt/mongodb-community@6.0/bin:/usr/local/opt/mongodb-community@6.0/bin:/path/to/mongo/bin:/Users/william.d/Documents/code/personal/writeme/scripts:/Users/william.d/infrastructure-tf/terraform/scripts:/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"


###############################################################################
#                                   ALIASES                                   #
###############################################################################

# General
alias ip="ipconfig getifaddr en0"
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias sshhome="cd ~/.ssh"
alias sshconfig="vim ~/.ssh/config"
alias gitconfig="vim ~/.gitconfig"
alias ls="gls --color=auto --classify --group-directories-first"
alias python="python3"

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
alias home-server-local="ssh will@192.168.0.177"
alias home-server="ssh will@ssh.williamdoyle.co.uk"

# Zshrc
alias zshrc="nvim ~/.zshrc"
alias szshrc="source ~/.zshrc"

###############################################################################
#                              AUTOCOMPLETION                                 #
###############################################################################

autoload -U compinit
compinit

###############################################################################
#                       EXTERNAL TOOL CONFIGURATIONS                          #
###############################################################################

export NVM_DIR="$HOME/.nvm"
if command -v brew &>/dev/null; then
  source "$(brew --prefix nvm)/nvm.sh"
fi

# Modules
if [[ -f /opt/homebrew/opt/modules/init/zsh ]]; then
  source /opt/homebrew/opt/modules/init/zsh
fi
module use /Users/william.d/field-activity-planner-modules/active
module use /Users/william.d/field-activity-planner-modules/inactive

# Google Cloud SDK
if [[ -f /opt/homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]]; then
  source /opt/homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi
if [[ -f /opt/homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]]; then
  source /opt/homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

# Starship Prompt
eval "$(starship init zsh)"

# Envman (Environment Manager)
# Generated for envman. Do not edit.
if [[ -s "$HOME/.config/envman/load.sh" ]]; then
  source "$HOME/.config/envman/load.sh"
fi
