# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell" 


plugins=(zsh-autosuggestions git web-search themes fzf fzf-tab fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias mkcd="mkdir $1; cd $1"

cpp() {
    g++ -o "$1" "$1.cpp" && ./"$1"
}



cpp() {
    clang++ "$1.cpp" -o "$1" && ./"$1"
}

export EDITOR=nvim

alias vim=nvim
alias v=nvim
alias n=nvim
alias nv=nvim


alias cl="clear"
alias c="clear"
alias ls="lsd -X"

export TERM="xterm-256color"

alias most="history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10"

alias ip="echo '\n' && fastfetch --logo none --structure LocalIP | sed 's/.*: //'"

# git
alias gp="git push"
alias gc="git commit"
alias ga="git add"
clear
echo '\e[5 q'
