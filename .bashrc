# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#XDG_DESKTOP_ALIASES

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache 

export RUSTUP_HOME="$XDG_CONFIG_HOME/.rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/.cargo"
export EDITOR=nvim

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=100000
export HISTFILE=~/.config/bash/.bash_history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias e='nvim'
alias t=type
alias tf=terraform
alias lg=lazygit
alias lsg="ls -al | grep $1"

# yazi cwd
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bind '"\C-o":"yz\n"'
bind '"\C-b":"cd -\n"'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
export PATH="$PATH:$HOME/.local/bin:$NPM_PATH"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"

            function fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=bash;
                export TF_ALIAS=fuck;
                export TF_SHELL_ALIASES=$(alias);
                export TF_HISTORY=$(fc -ln -10);
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
                ) && eval "$TF_CMD";
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                history -s $TF_CMD;
            }

# # # # # # # # # # # # #
#  __ ___      _____    #
#  / _` \ \ /\ / / __|  #
# | (_| |\ V  V /\__ \  #
#  \__,_| \_/\_/ |___/  #
# # # # # # # # # # # # #

_heyws_completions() {
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    
    opts="$(sed -n 's/.*\[\([^]]*\)\].*/\1/p' ~/.aws/credentials | tr '\n' ' ')" # profiles available
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}

complete -F _heyws_completions heyws    # Register the completion function for heyws

heyws() {
  echo "$1" > ~/.aws/active
  export AWS_PROFILE=$(cat ~/.aws/active)
}  
[ -f ~/.aws/active ] && export AWS_PROFILE=$(cat ~/.aws/active)

#######################################
#######################################

alias copy="xclip -selection clipboard"                    
alias ez="nvim ~/.bashrc"
alias rc="source ~/.bashrc"

# boomv1() {
#   tempfile=$(mktemp)
#   eval "$@" 2>&1 | tee $tempfile
#   if [ "${PIPESTATUS[0]}" -eq 0 ]; then 
#     daboom s $tempfile
#   else 
#     daboom f $tempfile
#   fi
# }

# boom() {
#   tempfile=$(mktemp)
#   eval "$@" 2>&1 | tee $tempfile && daboom "${PIPESTATUS[0]}" $tempfile
# }
