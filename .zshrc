# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# Turn off all beeps
unsetopt BEEP

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [ ! -d "${ZSH}/custom/plugins/zsh-autosuggestions" ]; then git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions; fi

plugins=(git z macos zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sa="source activate"
alias jn="jupyter notebook"
alias dc="docker-compose"

# autoload -U +X bashcompinit && bashcompinit

export PATH="$HOME/.poetry/bin:$PATH"
