# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias steam='flatpak run com.valvesoftware.Steam && exit '
alias steam-link='flatpak run com.valvesoftware.SteamLink'
alias settings='xfce4-settings-manager'
alias bashrc='nvim ~/.bashrc'
alias shortcuts='nvim ~/.config/sxhkd/sxhkdrc'
alias bspwmrc='nvim ~/.config/bspwm/bspwmrc'
alias listen-on='pactl load-module module-loopback latency_msec=0'
alias listen-off='pactl unload-module module-loopback'

#echo -ne "Hello, $USER. today is, "; date
#export PS1="\[\e]2;\u@\H \w\a\e[30;1m\]>\[\e[0m\] "

PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '
