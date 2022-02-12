case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

PS1="\W\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] λ " 

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bind 'TAB:menu-complete'

alias ls='ls --color=auto'
alias fzf='fzf --color=16'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias histmenu='$(cat ~/.bash_history | fzf)'

PATH=$PATH:~/.local/bin/
