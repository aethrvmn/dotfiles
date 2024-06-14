# Initialize profile variables
XFCE_RC_ENABLE="false"
LABWC_RC_ENABLE="false"

# Detect the terminal emulator
if [[ "$TERM" == "xterm-256color" ]]; then
  XFCE_RC_ENABLE="true"
elif [[ "$TERM" == "alacritty" ]]; then
  LABWC_RC_ENABLE="true"
fi

# Source the appropriate profile based on the enabled variable
if [[ "$XFCE_RC_ENABLE" == "true" ]]; then
  source "$HOME/.zsh/profiles/xfce-zshrc"
fi

if [[ "$LABWC_RC_ENABLE" == "true" ]]; then
  source "$HOME/.zsh/profiles/labwc-zshrc"
fi

# autosuggestions location
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# history files
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=1000

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
alias sys-update="sudo dnf update && flatpak update"
alias cat="bat"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

. "$HOME/.atuin/bin/env"

# evals
eval "$(atuin init zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"

export HISTFILE
