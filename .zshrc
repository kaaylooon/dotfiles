#git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions

# Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (SEMPRE por último)
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Default prompt
PS1=" → "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

export PATH="$PATH:/opt/kitty"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/home/kaylon/.spicetify"
export NO_AT_BRIDGE=1

alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias ff='fastfetch'
alias roxterm='roxterm --disable-sm | lolcat'
alias lp='leafpad'
alias ddnet='~/ddnet.sh'
alias aliases='lp .zshrc'
alias ifconfig='curl ifconfig.me'
alias nv='kitty nvim .'

conf() {
  cd ~/.config/"$1"
}

cpp() {
  g++ "$1" -o a.out && ./a.out
}
