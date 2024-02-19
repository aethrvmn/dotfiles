#!/bin/bash

[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Desable ctrl+S and ctrl+Q
stty -ixon
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# Function to display a git icon next to the username
parse_git_branch() {
    local branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
    if [ -n "$branch" ]; then
        local git_status=$(git status --porcelain 2> /dev/null)
        if [ -z "$git_status" ]; then
            echo " ($branch)"
        else
            echo " ($branch*)"
        fi
    fi
}

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 

# Set the command prompt
PS1='\[\033[01;34m\]\u\[\033[00m\] \w\[\033[01;32m\]$(parse_git_branch)\[\033[00m\] \$ '

# Enable history appending
shopt -s histappend

# Enable checkwinsize
shopt -s checkwinsize

# Function to clear the screen and show fortune and cowsay
custom_clear() {
    command clear
    fortune | cowsay
}

# Custom aliases
alias clear=custom_clear
alias hx=helix
alias ollama-open='cd ~/Ollama && npm run dev & sleep 1 && firefox localhost:3000'
# alias venv ='source venv/bin/activate'

# Aliases for color options
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Extra aliases
alias cp='cp -i'
alias rm='rm -i'

# Show fortune and cowsay when the terminal is opened
fortune | cowsay

