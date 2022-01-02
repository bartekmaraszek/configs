# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bart/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777788"

# OH MY POSH
eval "$(oh-my-posh --init --shell zsh --config /home/bart/dev/configs/oh-my-posh/bart-unicorn.omp.json)"

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
)

unsetopt correct_all
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

#Alt-S inserts "sudo" at the strat of the line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

########################################################
#    TOOLS                                             #
########################################################


########################################################
#    ALIASES                                           #
########################################################

alias dev='cd /mnt/c/Users/bartek/dev'
alias wcd='cd /mnt/c/Users/bartek'
alias ls='ls -h -A --color=never'
alias ll='ls -lah -A --color=never'
alias lsa='ls -lah -A --color=never'
alias lsla='ls -lah -A --color=never'
alias rmrf='rm -rf'
alias rimraf='rm -rf'
alias k='kubectl'
alias i='istioctl'
alias d='docker'
alias h='helm'
alias m='mvn'
alias mi='mvn install'
alias mci='mvn clean install'
alias localdocker='eval $(minikube docker-env)'

########################################################
#    HISTORY SEARCH                                    #
########################################################

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

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
  mvn archetype:generate -DgroupId=$1 -DartifactId=$2 -DarchetypeGroupId=pl.bmaraszek -DarchetypeVersion=1.0 -DarchetypeArtifactId=custom-quickstart -DinteractiveMode=false &&
  cd $2 &&
  git init &&
  echo ".DS_Store\ntarget\n*.iml\n.idea\n" >> .gitignore &&
  git add . &&
  git commit -m "Initial commit"
}


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
