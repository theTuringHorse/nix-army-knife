# zshrc file

export MPV_OPTS="--really-quiet"

PS1='%B%F{green}%n%F{blue}@%F{cyan}%M%F{blue}:%~ %(?.%F{green}.%F{red})%#%f%b '
RPROMPT='%(?..%F{red}[%?]%f)%1(j.%F{green}[%j].)%f '
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
export HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
# setopt inc_append_history
setopt share_history
setopt hist_ignore_dups       # Ignore consecutive duplicates
setopt hist_ignore_space      # Ignore commands starting with space
setopt hist_find_no_dups      # Don't show duplicates when searching
setopt hist_expire_dups_first # Expire duplicates first when trimming history
setopt hist_reduce_blanks     # Remove superfluous blanks from history entries
setopt hist_verify            # Show expanded history before executing
setopt long_list_jobs         # Show PID in job list

setopt interactive_comments   # Allow comments in interactive shell
setopt no_beep
setopt auto_cd                # cd into directory just by typing its name
setopt auto_pushd             # Push directories onto the stack on cd
setopt pushd_ignore_dups      # Don't push duplicate directories
setopt pushd_minus            # Swap +/- so `cd -N` feels natural
setopt complete_in_word       # Complete from cursor position, not end of word
setopt always_to_end          # Move cursor to end after completing mid-word
# setopt prompt_subst         # Enable prompt substitution

set -o emacs
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt correct
# unsetopt PROMPT_SP 2>/dev/null

# Better word boundaries: treat / . - _ as word separators for Ctrl+W, Alt+B, etc.
WORDCHARS='${WORDCHARS:s#/#}'
# WORDCHARS='${WORDCHARS:s#.#}'

autoload -U colors && colors

# Completion system
autoload -Uz compinit
_comp_dump="$XDG_CACHE_HOME/zsh/zcompdump"
# Regenerate compdump only once a day for fast startup
if [[ -n "$_comp_dump"(#qN.mh+24) ]]; then
  compinit -d "$_comp_dump"
else
  compinit -C -d "$_comp_dump"
fi
unset _comp_dump

zmodload zsh/complist
zmodload zsh/computil

# Complete dotfiles without explicitly typing the dot
_comp_options+=(globdots)

# --- Completion styles ---

# Enable menu selection (arrow keys to navigate)
zstyle ':completion:*' menu select

# Case-insensitive, partial-word, and then substring matching
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Group completions by type with headers
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages'     format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings'     format '%F{red}-- no matches found --%f'

# Use LS_COLORS for file completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Separate directories from files in completion lists
zstyle ':completion:*' list-dirs-first true

# Enable completion caching (for slow completers like apt, dpkg, etc.)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Kill/process completions
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# SSH/SCP/rsync completions from known_hosts and config
zstyle ':completion:*:ssh:*' hosts off
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'

for i in $SHELLDOTDIR/auto/*sh; do
  [ -f $i ] && . $i
done

source $ZDOTDIR/keybinds.zsh
source $ZDOTDIR/utils/pin.zsh
# source $ZDOTDIR/plugins.zsh
