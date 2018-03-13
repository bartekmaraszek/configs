# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/bm185154/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`

########################################################
#    COMMON COMMANDS                                   #
########################################################

# some more ls aliases
alias ls='ls -CFG'
alias ll='ls -alFG'
alias lsla='ls -laG'
alias la='ls -laG'
alias lsa='ls -aG'
alias l='ls -CFG'

#rm
alias rmrf='rm -rf'
alias rimraf='rm -rf'

# set by bartek:
alias root='sudo -i'
alias su='sudo -i'

ip() {
  ifconfig | grep inet | grep netmask | grep -v 127.0.0.1 | awk '{print $2}'
}

########################################################
#    MAVEN                                             #
########################################################

alias quickstart='project'
alias qstart='project'

# run a non-interactive custom quickstart archetype
# with Java 8, JUnit 4.12, and AssertJ 3.8.0

project() {
  if (( $# != 2 ))
  then
    echo "Usage: project package.name projectName"
    return
  fi
  mvn archetype:generate -DgroupId=$1 -DartifactId=$2 -DarchetypeGroupId=pl.bmaraszek -DarchetypeVersion=1.0 -DarchetypeArtifactId=custom-quickstart -DinteractiveMode=false
}

########################################################
#    DOCKER                                            #
########################################################

dclean() {
  docker ps -aq --no-trunc | xargs docker rm
}

alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"

drm() {
  docker stop $1 && docker rm $1;
}

drmi() {
  docker rmi $1;
}

########################################################
#    TMUX                                              #
########################################################

session() {
  tmux new -s $1
}

attach() {
  tmux a -t $1
}

sessions() {
  tmux ls
}

kill-session() {
  tmux kill-session -t $1
}

alias tkill='kill-session'
alias tquit='kill-session'
alias tnew='session'
alias tsession='session'
alias tattach='attach'
alias tat='attach'
alias ta='attach'
alias tls='sessions'
alias tlist='sessions'
alias tsessions='sessions'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bm185154/.sdkman"
[[ -s "/Users/bm185154/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bm185154/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
