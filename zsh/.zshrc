export PATH="/opt/homebrew/bin/:$PATH"
export TERM=xterm-256color
export COLORTERM=xterm-256color

# export PATH="/opt/homebrew/opt/binutils/bin/:$PATH"
export AS=/opt/homebrew/opt/binutils/bin/as
export LD=/opt/homebrew/opt/binutils/bin/ld

# Starship
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#9d0006'        # red
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#b57614'        # yellow/orange
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8f3f71'                # purple
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#af3a03'              # orange
ZSH_HIGHLIGHT_STYLES[function]='fg=#427b58'             # green
ZSH_HIGHLIGHT_STYLES[command]='fg=#076678'              # blue
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#af3a03'           # orange
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#928374'     # gray
ZSH_HIGHLIGHT_STYLES[path]='fg=#d65d0e'                 # orange (brighter)
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#928374'          # gray
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#b16286'             # pink/purple
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#689d6a'    # green
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#458588' # teal
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#458588'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#7c6f64' # gray
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#af3a03'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#af3a03'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#928374'              # muted gray
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#928374'  # Medium gray

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# alias
alias c="clear"

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"
alias ai="tgpt"
alias gcc=/opt/homebrew/bin/gcc-15
alias g++=/opt/homebrew/bin/g++-15
alias cc=/opt/homebrew/bin/gcc-15
alias c++=/opt/homebrew/bin/g++-15

export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin

export PATH="/usr/local/arm-gnu-toolchain-14.3.rel1-darwin-arm64-arm-none-eabi/bin:$PATH"
export PATH=$PATH:$HOME/go/bin

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
