# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Ignore duplicates (ignoredups)  or commands with leading whitespace (ignorespace) in history or both (ignoreboth)
HISTCONTROL=ignoredups

shopt -s expand_aliases

shopt -s histappend

if [ "$PS1" ]; then
    export IGNOREEOF=5				# Disallow accidental Ctrl-D
fi

#PS1="\[\e[42;30m\]\u@\h\[\e[37m\]:\[\e[30m\]\w\[\e[0;33m\]\$\[\e[0m\] "

alias ls="ls -hF --color=auto"
alias ll="ls -hlF --color=auto"
alias la="ls -ahlF --color=auto"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias grep='grep -En --color=auto'
alias egrep='egrep -n --color=auto'
alias du='du -ch'
alias df='df -h'
alias zsh='~/bin/bin/zsh'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#http://thelucid.com/2008/12/02/git-setting-up-a-remote-repository-and-doing-an-initial-push/
function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

. ~/git-completion.bash
. ~/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1

#PS1="\[\e[42;30m\]\u@\h\[\e[37m\]:\[\e[30m\]\w\[\e[0;33m\]\$(git-branch-prompt)\$\[\e[0m\] "

# http://bashrcgenerator.com/
PS1='\[\e[42;30m\]\u@\h\[\e[37m\]:\[\e[30m\]\w\[\e[0;33m\] $(__git_ps1 "(%s)")\[\e[0m\]\$ '

# u=rwx,g=rwx,o=
umask 0007
