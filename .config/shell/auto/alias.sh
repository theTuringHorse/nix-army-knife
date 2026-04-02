## alias

alias \
	la="ls -A" \
	ll="ls -lA" \
	df="df -h" \
	e=$EDITOR \
	md=mkdir -p \
	t=type \
	ip="ip --color=auto" \
	py="python" \
	x="chmod +x" \
	se="sudo -e" \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	lsg="ls -al | grep -i" \
	gui="gitui" \
	tf="terraform" \
	k="kubectl" \
	qr="qrencode -t ANSIUTF8" \
	g="git" \
	d="delta" \
	c="claude"

alias alert='notify-send --urgency=normal -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
