# zshrc file

autoload -U colors && colors
PS1='%B%F{green}%n%F{blue}@%F{cyan}%M%F{blue}:%~ %(?.%F{green}.%F{red})%#%f%b '
RPROMPT='%(?..%F{red}[%?]%f)%1(j.%F{green}[%j].)%f '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# _comp_options+=(globdots)

mkdir -p ~/.config/zsh
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history
set -o emacs
setopt correct

# ENV VARS
# export PATH="$HOME/.local/bin:$PATH" # add to profile
[ "$0" = "-zsh" ] && export RC=~/.zshrc
[ "$0" = "bash" ] && export RC=~/.bashrc

source ~/.config/shell/profile.sh

# envs
export BROWSER=librewolf
export TERMINAL=wezterm
export GIT_AUTHOR_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")
export GIT_COMMITTER_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")

# yazi cwd
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


alias es="$EDITOR $RC && source $RC"

## optional
[ -x "$(command -v thefuck)" ] && eval $(thefuck --alias fuck)
[ -x "$(command -v eza)" ] && alias ls="eza --icons=auto -1"
[ -x "$(command -v fzf)" ] && source <(fzf --zsh)
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)" && alias cd=z
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

source ~/.config/shell/alias.sh
source ~/.config/shell/keybinds.zsh
source ~/.config/shell/devops.zsh

#alias save="exec > >(tee -a output.txt) 2>&1" TODO: tweak to find most suitable variant

zsh_hightlight=/opt/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -r "$zsh_hightlight" ] && source $zsh_hightlight

alias a2s="echo a2s not yet defined"
# 👇 added via ☝️

