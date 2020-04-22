#!/bin/bash
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
alias la='ls -la'
alias gp='git pull'
alias gpo='git push origin'
alias gd='git diff'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias gc='git clone'
alias py='python36'
alias b='bpython'
alias t='exa -T'
alias x='hexyl'
alias serve='py -m http.server'
alias format='black -l 120 --include ".*\.py$" .'
alias diff="git diff -U1 --no-index"
alias venv="py -m virtualenv .venv/"
alias avenv='source .venv/bin/activate'
alias dvenv='deactivate'
if [ -d "$HOME/.local/vim/bin/" ] ; then
  PATH="$HOME/.local/vim/bin/:$PATH"
fi
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[92m\]\u\[\e[m\]@\[\e[92m\]\h\[\e[m\]:\[\e[94m\]\w\[\e[m\]\[\e[96m\]\`parse_git_branch\`\[\e[m\] $ "
# root export PS1="\[\e[91m\]\u\[\e[m\]@\[\e[91m\]\h\[\e[m\]:\[\e[94m\]\w\[\e[m\]\[\e[96m\]\`parse_git_branch\`\[\e[m\] $
