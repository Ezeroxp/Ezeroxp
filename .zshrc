alias ll="ls -l"
alias la="ls -la"
alias cdc="cd $HOME/Code"
alias ..="cd .."
alias ...="cd ../.."

alias gaa="git add -A"
alias gc="git commit"
alias gs="git status"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"

function docker_list {
  containers=$(docker ps awk '{if (NR!=1) print $1 ": " $(NF)}')
  echo "CONTENEDORES"
echo $containers
}

function gc {
  git add -A
  if [ -z "$1" ]; then 
    git commit - S
  else
    git commit -S -m "$1"
  fi
}

_reverse_search() {
  local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf)
  LBUFFER=$selected_command
}

zle -N _reverse_search
bindkey '^r' _reverse_search
