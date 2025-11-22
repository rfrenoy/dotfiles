export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias n=nvim
alias g=git
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gch="git checkout"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gm="git checkout master"
alias gp="git pull -r"
alias gP="git push"
alias t="tmux"

alias re="cd ${HOME}/Dev/re_crm"
alias r="rails"
alias be="bundle exec"
alias dc="docker-compose"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
eval "$(starship init zsh)"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi
