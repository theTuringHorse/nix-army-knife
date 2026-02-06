# Add all directories in `~/.local/bin` to $PATH
export PATH="$HOME/.local/bin:$XDG_DATA_HOME/cargo/bin:$PATH"
# export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="wezterm"
export TERMINAL_PROG="wezterm"
export BROWSER="firefox"
eval "$(dircolors -b)"
