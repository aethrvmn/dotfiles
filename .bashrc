# ~/.bashrc

[[ $- != *i* ]] && return

# Function to display a git icon next to the username
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ (\1)/p'
}

# Set the command prompt
PS1='\[\033[01;34m\]\u\[\033[00m\] \w\[\033[01;32m\]$(parse_git_branch)\[\033[00m\] \$ '

# Aliases for color options
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Set colors for ls
eval "$(dircolors -b /etc/DIR_COLORS)"
LS_COLORS="di=01;32:fi=00;37:$LS_COLORS"
export LS_COLORS

# Enable history appending
shopt -s histappend

# Enable checkwinsize
shopt -s checkwinsize

# Function to clear the screen and show fortune and cowsay
custom_clear() {
    clear
    fortune | cowsay
}

alias clear=custom_clear

# Show fortune and cowsay when the terminal is opened
fortune | cowsay
