# zshrc file

autoload -U colors && colors
PS1='%B%F{green}%n%F{blue}@%F{cyan}%M%F{blue}:%~ %(?.%F{green}.%F{red})%#%f%b '
RPROMPT='%(?..%F{red}[%?]%f)%1(j.%F{green}[%j].)%f '
mkdir -p ~/.config/zsh
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history
set -o emacs
setopt correct

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# _comp_options+=(globdots)

SHELLDOTDIR=~/.config/shell
for i in $SHELLDOTDIR/*; do
  [ -r $i ] && source $i
done

zsh_hightlight=/opt/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -r "$zsh_hightlight" ] && source $zsh_hightlight

alias a2s="echo a2s not yet defined"
# 👇 added via ☝️
