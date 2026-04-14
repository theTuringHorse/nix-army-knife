# run commands

[ -n "${BASH_VERSION-}" ] && MYSHELL="bash"
[ -n "${ZSH_VERSION-}" ] && MYSHELL="zsh"
[ "$MYSHELL" = "zsh" ] && export RC="$ZDOTDIR/.zshrc"
[ "$MYSHELL" = "bash" ] && export RC=~/.bashrc
alias rc="source $RC"
alias es="$EDITOR $SHELLDOTDIR/auto/rc.sh && source $RC"
alias el="$EDITOR $SHELLDOTDIR/auto/rc.local.sh && source $RC"

# yazi cwd
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp" > /dev/null
}

## optional
[ -x "$(command -v thefuck)" ] && eval $(thefuck --alias fuck)
[ -x "$(command -v eza)" ] && alias ls="eza --icons=auto -1"
[ -x "$(command -v fzf)" ] && source <(fzf --$MYSHELL)
[ -x "$(command -v starship)" ] && eval "$(starship init $MYSHELL)"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init $MYSHELL)" && alias cd=z
[ -x "$(command -v direnv)" ] && eval "$(direnv hook $MYSHELL)"
