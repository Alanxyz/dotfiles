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

FZF_DEFAULT_COMMAND='rg'

alias ls='ls --color=auto'
alias fzf='fzf --color=16'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias histmenu='$(cat ~/.bash_history | fzf)'
alias ff='xdg-open "`fzf --color=bw`"'
alias share="curl -F 'f:1=<-' ix.io"
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gC="git checkout -b"
alias gp="git push"
alias gP="git pull"
alias gg="git log --graph --abbrev-commit --decorate --date=relative --all"
alias week="rem -c+1n"
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"
alias tmux-new="tmux new -s"
alias tmux-load="tmux attach -t"

DOCKERHOME="$HOME/cetera/docker/" 
ALANHOME="$HOME/OMNIA/" 
alias docker-anaconda="sudo docker run -it continuumio/anaconda3 /bin/bash"
alias docker-julia="sudo docker run -it -v $DOCKERHOME:/root/ -v $ALANHOME:/root/OMNIA/ -p 1234:1234 julia bash"
alias docker-wolfram="sudo docker run -it wolframresearch/wolframengine"

dots="$HOME/.dotfiles" 

PATH=$PATH:~/.local/bin/
PATH=$PATH:~/cetera/apps/node/bin/
PATH=$PATH:~/.yarn/bin/

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/alan/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/alan/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
XDG_RUNTIME_DIR=/run/user/$(id -u)
