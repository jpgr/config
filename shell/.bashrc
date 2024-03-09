# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
  source /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi

PROMPT_COMMAND='history -a'
HISTSIZE=2000
HISTFILESIZE=5000
HISTTIMEFORMAT='%F %T - '

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias vim='nvim'

if type -P rustup > /dev/null; then
  source <( rustup completions bash )
  source <( rustup completions bash cargo )
fi

source ~/.local/share/git-prompt.sh
PS1='\[\033[00;37m\][\D{%H:%M}] \[\033[01;32m\]\u\[\033[01;37m\]:\W$(__git_ps1 " \[\033[01;34m\][\[\033[00;37m\]%s\[\033[01;34m\]]") \[\033[01;31m\]|\[\033[00m\] '

