case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

PS1="\W\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[\033[35m\]λ\[\033[00m\] " 

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bind 'TAB:menu-complete'
set -o vi

alias ls='ls --color=auto'
alias fzf='fzf --color=16'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias histmenu='$(cat ~/.bash_history | fzf)'
alias files='xdg-open "`fzf --color=bw`"'
alias share="curl -F 'f:1=<-' ix.io"
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gC="git checkout -b"
alias gp="git push"
alias gP="git pull"
alias week="rem -c+1n"
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"


PATH=$PATH:~/.local/bin/
PATH=$PATH:~/.dev/node/bin/
PATH=$PATH:~/.yarn/bin/
