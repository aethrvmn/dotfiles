# Source the appropriate profile based on the enabled variable
if [[ "$TERM" == "xterm-256color" ]]; then
  source "$HOME/.zsh/profiles/xfce-zshrc"
else
  source "$HOME/.zsh/profiles/labwc-zshrc"
fi

# ZSH autosuggest
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH syntax hghlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history files
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=1000
export HISTFILE

# keybinds because zsh treats keys weirdly
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# misc config
setopt autocd beep
unsetopt extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/aethrvmn/.zshrc'

autoload -Uz compinit
compinit

# aliases
alias ls="eza --icons=always --color=always"
alias ll="eza -a --color=always --long -tree --icons=always --no-time --no-user"
alias cat="bat"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias hx='helix'

# . "$HOME/.atuin/bin/env"

# evals
eval "$(ssh-agent -s)"
eval "$(atuin init zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"

clear
