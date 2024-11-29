# ENV VARS
# export PATH="$HOME/.local/bin:$HOME/.config/.cargo/bin:$PATH" # add to profile
export RUSTUP_HOME="$XDG_CONFIG_HOME/.rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/.cargo"

[ "$SHELL" = "/usr/bin/zsh" ] && export RC=~/.zshrc
[ "$SHELL" = "/usr/bin/bash" ] && export RC=~/.bashrc

# envs
export BROWSER=librewolf
export TERMINAL=wezterm
# export GIT_AUTHOR_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")
# export GIT_COMMITTER_DATE=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")

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
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)" && alias cd=z
