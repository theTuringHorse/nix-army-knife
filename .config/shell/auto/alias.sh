## alias

alias \
	la="ls -A" \
	ll="ls -lA" \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	df="df -h" \
	\
	ip="ip --color=auto" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	\
	e=$EDITOR \
	py="python" \
	x="chmod +x" \
	se="sudo -e" \
	bc="bc -ql" \
	md="mkdir -p" \
	t=type \
	lsg="ls -al | grep -i" \
	\
	gui="gitui" \
	g="git" \
	tf="terraform" \
	k="kubectl" \
	\
	qr="qrencode -t ANSIUTF8" \
	d="delta" \
	c="claude --allow-dangerously-skip-permissions" \
	p="pin"

alias alert='notify-send --urgency=normal -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
