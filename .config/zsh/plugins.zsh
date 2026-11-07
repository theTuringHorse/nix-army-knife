## plugins (installed via pacman)
_plug_dir=/usr/share/zsh/plugins

## autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
_f=$_plug_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -r "$_f" ] && source "$_f"

## syntax highlighting (must be sourced last)
_f=$_plug_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -r "$_f" ] && source "$_f"

unset _f _plug_dir
