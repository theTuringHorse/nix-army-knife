# Add all directories in `~/.local/bin` to $PATH
export PATH="$HOME/.local/bin:$XDG_DATA_HOME/cargo/bin:$PATH"
# export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="wezterm"
export TERMINAL_PROG="wezterm"
export OPENER="xdg-open"
export DIFFTOOL="$EDITOR -d"
export PAGER="less"
export BROWSER="firefox"
export AURHELPER="paru"
export DO_NOT_TRACK=1 # respected by docker and other apps
eval "$(dircolors -b)"


# Mpv
	export MPV_OPTS="--really-quiet" # This is here because it's really only needed for interactive shell usage, rather than mpv scripts.


# A few AMAZING fzf options
	# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
	# export FZF_DEFAULT_OPTS="--cycle --layout=reverse --height 60% --border --color fg:15,hl:3,fg+:12,bg+:0,hl+:11,info:13,prompt:6,spinner:14,pointer:12,marker:2,header:7"
	export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
	# export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
	export FZF_ALT_C_OPTS="--exact --select-1 --exit-0 --preview 'tree -C {} | head -200'" # this is almost a file manager
	# export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
	export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'F1:toggle-preview'"


## Appearance
	export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
	[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/dircolors/dircolors.dark ] && eval `dircolors -b ${XDG_CONFIG_HOME:-$HOME/.config}/dircolors/dircolors.dark`
	export GREP_COLORS='mt=1;92;40'



# LESS (and man) colors
	export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"     # begin blinking
	export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"     # begin bold
	export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"     # begin underline
	export LESS_TERMCAP_so="$(printf '%b' '[01;34;40m')" # begin standout-mode - info box
	export LESS_TERMCAP_me="$(printf '%b' '[0m')"        # end mode
	export LESS_TERMCAP_ue="$(printf '%b' '[0m')"        # end underline
	export LESS_TERMCAP_se="$(printf '%b' '[0m')"        # end standout-mode
	export LESSOPEN='| LESSQUIET=1 lesspipe.sh %s'
	export LESSCOLORIZER='pygmentize'
	export LESS='-iRX --use-color -Dd+r$Du+b$ --mouse --wheel-lines 2 --jump-target=.5 --status-column --LONG-PROMPT --quit-on-intr --no-histdups'
	export MANROFFOPT="-c"
	# export MANPAGER="sh -c 'col -bx | bat -l man -p '"

if [ "$TERM" = "linux" ]; then
	# gruvbox in TTY ;)
	echo -en "\e]P0282828"
	echo -en "\e]P1CC241D"
	echo -en "\e]P298971A"
	echo -en "\e]P3D79921"
	echo -en "\e]P4458588"
	echo -en "\e]P5B16286"
	echo -en "\e]P6689D6A"
	echo -en "\e]P7A89984"
	echo -en "\e]P8928374"
	echo -en "\e]P9FB4934"
	echo -en "\e]PAB8BB26"
	echo -en "\e]PBFABD2F"
	echo -en "\e]PC83A598"
	echo -en "\e]PDD3869B"
	echo -en "\e]PE8EC07C"
	echo -en "\e]PFEBDBB2"
	clear # fix some weird artifacting
fi
