#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable tab cycling completion options with shift+tab
[[ $- = *i* ]] && bind '"\e[Z":menu-complete'

# Don't save commands in history that start with a space
export HISTCONTROL=ignorespace

# Only load liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source liquidprompt

# Load and select liquidprompt theme
source /usr/share/liquidprompt/themes/powerline/powerline.theme
source /usr/share/liquidprompt/themes/alternate_vcs/alternate_vcs.theme
lp_theme default

function nullify() {
	"$@" > /dev/null 2>&1 &
}

source /usr/share/doc/pkgfile/command-not-found.bash

# Make sure QT themes work
export QT_QPA_PLATFORMTHEME=qt5ct

# GPG signing key
export GPG_TTY=$(tty)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

PS1='[\u@\h \W]\$ '
