# ~/.zshrc

# Function to display a git icon next to the username
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ (\1)/p'
}

# Set the command prompt
PROMPT='%F{blue}%B%n%b%f %~%F{green}$(parse_git_branch)%f %# '
setopt PROMPT_SUBST

# Enable ls colors
export LSCOLORS="GxFxCxDxBxegedabagaced"

# Aliases for color options
alias ls='ls -G'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Fortune and cowsay on terminal start
fortune | cowsay

# Function to clear the screen and show fortune and cowsay
custom_clear() {
    clear
    fortune | cowsay
}

alias clear=custom_clear