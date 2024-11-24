# zshrc file

PS1='%B%F{green}%n%F{blue}@%F{cyan}%M%F{blue}:%~ %(?.%F{green}.%F{red})%#%f%b '
RPROMPT='%(?..%F{red}[%?]%f)%1(j.%F{green}[%j].)%f '

#compinit ; TODO: wtf is compinit
mkdir -p ~/.config/zsh
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
set -o emacs
setopt correct

# ENV VARS
export PATH="$HOME/.local/bin:$PATH" # add to profile
[ "$0" = "-zsh" ] && export RC=~/.zshrc
[ "$0" = "bash" ] && export RC=~/.bashrc

# XDG_DIRS
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache

# envs
export BROWSER=librewolf
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=wezterm
export GIT_AUTHOR_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")
export GIT_COMMITTER_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")

# lf = lfcd
lf() {
	cd "$(command lf -print-last-dir "$@")"
}

# yazi cwd
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#bindkeys
bindkey -s '^h' 'cd ~\n'
bindkey -s '^b' 'cd -\n'
bindkey -s '^o' 'yz\n'

[ -x "$(command -v thefuck)" ] && eval $(thefuck --alias fuck)

#alias for tools
[ -x "$(command -v eza)" ] && alias ls="eza --icons=auto -1"
alias la="ls -A"
alias ll="ls -l"
alias lal="ls -lA"

# personal aliases
alias e=$EDITOR
alias es="$EDITOR $RC && source $RC"
alias mis="udisksctl mount -b /dev/sda1"
alias unmis="udisksctl unmount -b /dev/sda1"
alias md=mkdir
alias t=type

alias lsg="ls -al | grep -i"
alias lg=lazygit
alias archbtw="distrobox enter archbtw"
alias jammy="distrobox enter jammy"
alias tf="terraform"

alias alert='notify-send --urgency=normal -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias save="exec > >(tee -a output.txt) 2>&1" TODO: tweak to find most suitable variant

# Set up fzf zoxide and syntax highlighting
zsh_hightlight=/opt/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -r "$zsh_hightlight" ] && source $zsh_hightlight

[ -x "$(command -v fzf)" ] && source <(fzf --zsh)
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)" && alias cd=z

alias a2s="echo a2s not yet defined"
# 👇 added via ☝️

