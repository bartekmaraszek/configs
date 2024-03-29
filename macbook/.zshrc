# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bart.maraszek/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777788"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  history-substring-search
  zsh-autosuggestions
)

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
export SDKMAN_DIR="/Users/bart.maraszek/.sdkman"
[[ -s "/Users/bart.maraszek/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bart.maraszek/.sdkman/bin/sdkman-init.sh"

#Alt-S inserts "sudo" at the strat of the line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

########################################################
#    TOOLS                                             #
########################################################

export PATH=/Users/bart.maraszek/dev/istio/istio-1.9.1/bin:$PATH

########################################################
#    ALIASES                                           #
########################################################

alias ll='ls -la'
alias lsa='ls -la'
alias lsla='ls -la'
alias rmrf='rm -rf'
alias rimraf='rm -rf'
alias k='kubectl'
alias i='istioctl'
alias d='docker'
alias h='helm'
alias localdocker='eval $(minikube docker-env)'

########################################################
#    HISTORY SEARCH                                    #
########################################################

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

########################################################
#    SERVICE NAMES                                     #
########################################################

export cracking="ku-cracking-service"
export dearchive="ku-dearchive-service"
export ocr="ku-ocr-service"
export pdf="ku-pdf-conversion-service"
export taskmanager="ku-taskmanager-service"

########################################################
#    ARTIFACTORY                                       #
########################################################

export ARTIFACTORY_USERNAME="username"
export ARTIFACTORY_PASSPHRASE="placeholder

helmInstallFunc() {
  if (( $# != 2 ))
  then
    echo "helm install usage: helmi [NAME] [CHART]"
    echo "E.g. helmi ku-pdf-conversion-service ./target/helm/ku-pdf-conversion-service"
    return
  fi
  echo "helm install $1 $2 --set registry.username=$ARTIFACTORY_USERNAME --set registry.password=$ARTIFACTORY_PASSPHRASE"
  helm install $1 $2 --set registry.username=$ARTIFACTORY_USERNAME --set registry.password=$ARTIFACTORY_PASSPHRASE
}

helmDeleteFunc() {
  if (( $# != 1 ))
  then
    echo "helm delete usage: helmd [NAME]"
    echo "E.g. helmd ku-pdf-conversion-service"
    return
  fi
  echo "helm delete $1"
  helm delete $1
}

alias helmi='helmInstallFunc'
alias helmd='helmDeleteFunc'

########################################################
#    MONGO                                             #
########################################################

startMongoFunc() {
  mongoCommand='mongod --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --fork'
  printf "%s\n\n" $mongoCommand
  eval "$mongoCommand"
}

checkMongoFunc() {
  checkMongo='ps aux | grep -v grep | grep mongod'
  printf "%s\n\n" $checkMongo
  eval "$checkMongo"
}

startAndCheckMongoFunc() {
  startMongoFunc
  checkMongoFunc
}

alias checkMongo='checkMongoFunc'
alias checkmongo='checkMongoFunc'
alias startmongo='startAndCheckMongoFunc'
alias startMongo='startAndCheckMongoFunc'

########################################################
#    MAVEN                                             #
########################################################

alias mvni='mvn clean install -Dpactbroker.host=imanage.pact.dius.com.au -Dpactbroker.auth.token=placeholder'
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
  mvn archetype:generate -DgroupId=$1 -DartifactId=$2 -DarchetypeGroupId=pl.bmaraszek -DarchetypeVersion=1.0 -DarchetypeArtifactId=custom-quickstart -DinteractiveMode=false &&
  cd $2 &&
  git init &&
  echo ".DS_Store\ntarget\n*.iml\n.idea\n" >> .gitignore &&
  git add . &&
  git commit -m "Initial commit"
}
