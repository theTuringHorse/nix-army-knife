alias mis="udisksctl mount -b /dev/sda1"
alias unmis="udisksctl unmount -b /dev/sda1"
alias md=mkdir
alias t=type

alias lsg="ls -al | grep -i"
alias lg="lazygit"
alias archbtw="distrobox enter archbtw"
alias jammy="distrobox enter jammy"
alias tf="terraform"

alias alert='notify-send --urgency=normal -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias save="exec > >(tee -a output.txt) 2>&1" TODO: tweak to find most suitable variant
