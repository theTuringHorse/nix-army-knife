# fish config

# Interactive-only settings
if status is-interactive
    # Keep behavior similar to bash/zsh setup in this repo
    set -gx LESS "-FXR"

    # Common aliases
    alias la='ls -A'
    alias ll='ls -lA'
    alias md='mkdir -p'
    alias t='type'
    alias ip='ip --color=auto'
    alias py='python'
    alias x='chmod +x'
    alias se='sudo -e'
    alias cp='cp -iv'
    alias mv='mv -iv'
    alias rm='rm -vI'
    alias bc='bc -ql'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias lsg='ls -al | grep -i'
    alias gui='gitui'
    alias tf='terraform'
    alias k='kubectl'
    alias qr='qrencode -t ANSIUTF8'
    alias g='git'
    alias d='delta'

    # Convenience wrappers (mirror shell/auto/rc.sh intent)
    set -gx RC ~/.config/fish/config.fish
    alias rc='source $RC'

    if set -q EDITOR
        alias e='$EDITOR'
        alias es='$EDITOR ~/.config/fish/config.fish; and source ~/.config/fish/config.fish'
    end

    # Optional integrations (load only when installed)
    if command -q eza
        alias ls='eza --icons=auto -1'
    end

    if command -q thefuck
        thefuck --alias | source
    end

    if command -q starship
        starship init fish | source
    end

    if command -q zoxide
        zoxide init fish | source
        alias cd='z'
    end

    if command -q direnv
        direnv hook fish | source
    end
end
