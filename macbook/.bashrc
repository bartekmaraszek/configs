# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -CFG'
alias ll='ls -alFG'
alias lsla='ls -laG'
alias la='ls -laG'
alias lsa='ls -aG'
alias l='ls -CFG'

# set by bartek:
alias root='sudo -i'
alias su='sudo -i'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'

# shortcuts
alias home='cd'
alias jb='cd $JBOSS_HOME'
alias jboss='cd $JBOSS_HOME'
alias dev='cd ~/Development'
alias down='cd ~/Downloads'
alias main='cd ~/Perforce/bartek/depot/development/software/AdminPlatformPortlets/messageAdmin/main'
# print variables
alias path='echo $PATH'
alias echopath='echo $PATH'
alias javahome='echo $JAVA_HOME'
alias echojava='echo $JAVA_HOME'
alias jbosshome='echo $JBOSS_HOME'
alias echojboss='echo $JBOSS_HOME'

# make changes to this file
alias bashrc='vim ~/.bashrc'
alias source='source ~/.bashrc'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git branch in prompt.
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]bartek.localhost \T: \W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] \[\e[31m\]❱\[\e[m\]\[\e[33m\]❱\[\e[m\]\[\e[32m\]❱\[\e[m\] "

export PATH=$PATH:~/bin
export PATH=$PATH:~/bin/kdiff3.app/Contents/MacOS
export PATH=$PATH:~/checkout-fmis/git-p4-bridge
export PATH=$PATH:/usr/local/mysql/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JBOSS_HOME=~/Development/JBoss-fmis

export USP_TOOLS=/Users/bm185154/Perforce/bartek-clean-2015/depot/development/software/usp/migration_tools/navDataMigration
export PATH=$PATH:$USP_TOOLS

#export M2_HOME=/Users/bm185154/Development/apache-maven-2.2.1
#export M2_HOME=/Users/bm185154/Development/apache-maven-3.2.5
export M2_HOME=/Users/bm185154/Development/apache-maven-3.3.9

export M2=$M2_HOME/bin
export PATH=$PATH:$M2

# change this to your workspace:
export MESSAGE_HOME=~/Perforce/bartek/depot/development/software/AdminPlatformPortlets/messageAdmin/main
export FMIS_DEV_HOME=~/Perforce/p4_1790/depot/development/software/fmis
 
#recompile a single project:
alias message='cd $MESSAGE_HOME/message; mvn clean install'
alias calendar='cd $MESSAGE_HOME/message-calendar; mvn clean install'
alias campaign='cd $MESSAGE_HOME/message-campaign; mvn clean install'
alias common='cd $MESSAGE_HOME/message-common; mvn clean install'
alias editor='cd $MESSAGE_HOME/message-editor; mvn clean install'
alias env='cd $MESSAGE_HOME/message-env; mvn clean install'
alias image='cd $MESSAGE_HOME/message-image; mvn clean install'
alias reports='cd $MESSAGE_HOME/message-reports; mvn clean install'
alias rpm='cd $MESSAGE_HOME/message-rpm; mvn clean install'
alias services='cd $MESSAGE_HOME/message-services; mvn clean install'
alias task='cd $MESSAGE_HOME/message-task; mvn clean install'

export P4PORT=tcp:p4.diginsite.com:1790
export P4USER=bkrzysztofmaraszek
export P4PASSWD=bkrzysztofmaraszek12345
export P4CLIENT=bartek-clean-2015 
export P4CONFIG=p4config
export P4_1790=$HOME/Perforce/p4_1790/depot
export P4EDITOR=gvim
export P4IGNORE=.ignore
export M2_REPO="$HOME/.m2/repository"
export MAVEN_OPTS="-Xmx2024m -XX:+CMSClassUnloadingEnabled"
export TMPDIR=$HOME/tmp

# FMIS SCRIPTS:

# location of your source code
export FMIS_BRANCH_NAME=main
export FMIS_BRANCH_MAIN=main
export FMIS_BRANCH_FUTURE=main
# start and stop jboss
alias stop=$JBOSS_HOME'/bin/run.sh -c default stop'
alias start=$JBOSS_HOME'/bin/run.sh -c default start'
# build and deploy
# alias copytestconfigs='cd ${FMIS_DEV_HOME}/config/${FMIS_BRANCH_NAME}; mvn clean install -f test-configs-pom.xml'
#copy configs to jboss
# alias copyconfigs=' cd ${FMIS_DEV_HOME}/build/${FMIS_BRANCH_NAME}; ant -f build.xml'
# alias copyresources='cp ${FMIS_DEV_HOME}/sso/${FMIS_BRANCH_NAME}/src/main/resources/*.html $JBOSS_HOME/server/default/deploy/ROOT.war'
#add deploy--mhb and/or payroll to next one if you work on those
alias buildanddeployall='buildcommon;deploysso;deployttob;deployfw'
alias buildcommon='cd ${FMIS_DEV_HOME}/common/${FMIS_BRANCH_FUTURE};mvn clean install'
alias buildsso='cd ${FMIS_DEV_HOME}/sso/${FMIS_BRANCH_FUTURE};mvn clean install'
alias buildttob='cd ${FMIS_DEV_HOME}/ttob/${FMIS_BRANCH_MAIN};mvn clean install'
alias buildfw='cd ${FMIS_DEV_HOME}/fw/${FMIS_BRANCH_FUTURE};mvn clean install'
alias buildtpv='cd ${FMIS_DEV_HOME}/tpv/{FMIS_BRANCH_FUTURE};mvn clean install'

alias deploysso='buildsso; mvn jboss:hard-undeploy jboss:hard-deploy; copyconfigs;copyresources'
alias deployfw='buildfw; cd fw; mvn jboss:hard-undeploy jboss:hard-deploy; copyconfigs;copyresources'
alias deployttob='buildttob; cd ttob; mvn jboss:hard-undeploy jboss:hard-deploy; copyconfigs;copyresources'
alias deploytpv='buildtpv; cd tpv; mvn jboss:hard-undeploy jboss:hard-deploy'

alias testfw='cd ${FMIS_DEV_HOME}/fw/${FMIS_BRANCH_NAME};mvn -Pdevelopment clean install'
alias testttob='cd ${FMIS_DEV_HOME}/ttob/${FMIS_BRANCH_NAME};mvn -Pdevelopment clean install'

alias go='stop ; build ; start'
alias gosso='stop ; buildsso ; start'
alias prime='stop; build; cd $FMIS_DEV_HOME/common; mvn install; cd -; start'

alias log='tail -f $JBOSS_HOME/server/default/log/server.log'
alias tlog='tail -f $JBOSS_HOME/server/default/log/ttob.log'
alias slog='tail -f $JBOSS_HOME/server/default/log/sso.log'
alias mlog='tail -f $JBOSS_HOME/server/default/log/mhb.log'
alias alog='cd $JBOSS_HOME/server/default/log; tail -f *.log'

# tmux
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

# Run caps tools
alias caps='java -jar fmis-capstool-1.1.0-SNAPSHOT.jar --capsfi -e QAL1 -t specifictpv -a Axis.cfg'

# ssh to DI servers

export me=bkrzysztofmaraszek
export joyce=jsong
export qal1=anqal10fmiwj003.dca.diginsite.net
export qal2=anqal20fmiwj101.dca.diginsite.net

alias encoding="vim -c 'execute \"silent !echo \" . &fileencoding | q'"

remote() {
  case $1 in
    fmis1 | qa1 | qal1 )
      ssh -v -L 8787:127.0.0.1:8787 $me@$qal1;;
    fmis2 | qa2 | qal2 )
      ssh -v -L 8787:127:0.0.1:8787 $me@$qal2;;
  esac
}

alias debug='remote'

goto() {
  case $1 in
    fmis1 | qal1 )
      ssh $me@$qal1;;
    fmis2 | qal2 )
      ssh $me@$qal2;;
    dev1 | dev1dca)
      ssh $me@andev10fmiwj003.dca.diginsite.net;;
    dev2 | dev2dca)
      ssh $me@andev10fmiwj003.dca.diginsite.net;;
    dev1dcb)
      ssh $me@bndev20fmiwj003.dcb.diginsite.net;;
    dev2dcb)
      ssh $me@bndev20fmiwj004.dcb.diginsite.net;;
    pingfed1 | pingfed001)
      ssh $me@apqal10pfdge001.dca.diginsite.net;;
    pingfed2 | pingfed002)
      ssh $me@apqal10pfdge002.dca.diginsite.net;;
    pingfed3 | pingfed003)
      ssh $me@apqal10pfdge003.dca.diginsite.net;;
    pingfed4 | pingfed004)
      ssh $me@apqal10pfdge004.dca.diginsite.net;;
    skynet | skynetqa)
      ssh $joyce@w3qa.web.qa.diginsite.com
  esac
}

alias login='goto'
alias log='goto'

config() {
  user="bkrzysztofmaraszek@"
  path=":/home/bkrzysztofmaraszek"
  scp /Users/bm185154/.ssh/id_rsa.pub $user$1$path/.ssh/authorized_keys
  scp /Users/bm185154/remoteConfigs/.bashrc $user$1$path;
  scp /Users/bm185154/remoteConfigs/.vimrc $user$1$path;
  scp -r /Users/bm185154/remoteConfigs/.vim $user$1$path; 
  scp /Users/bm185154/remoteConfigs/.tmux.conf $user$1$path;
  ssh $user$1 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'
}

f() {
  find . -print | grep -i $1
}

ff() {
  grep -rnwl '.' -e $1
}

fjava() {
  grep --include=\*.java -rnwl '.' -e $1
}

fin() {
  grep --include=\*.$1 -rnwl '.' -e $2
}

title() {
  echo -ne "\033]0;"$*"\007"
}

puts() {
  user="bkrzysztofmaraszek@";
  path=":/home/bkrzysztofmaraszek";
  echo $user$1$path;
}

copy() {
  case $2 in
    fmis1 )
      scp $1 bkrzysztofmaraszek@anqal10fmiwj003.dca.diginsite.net:/home/bkrzysztofmaraszek;;
    fmis2 )
      scp $1 bkrzysztofmaraszek@anqal10fmiwj004.dca.diginsite.net:/home/bkrzysztofmaraszek;;
    newqal2 )
      scp $1 bkrzysztofmaraszek@apqal10fmiwj100.dca.diginsite.net:/home/bkrzysztofmaraszek;;
  esac
}

get() {
  case $1 in
    tpv )
      scp bkrzysztofmaraszek@anqal10fmiwj003.dca.diginsite.net:/app/logs/jboss/tpv.log . && gvim tpv.log;;
    sso ) 
      scp bkrzysztofmaraszek@anqal10fmiwj003.dca.diginsite.net:/app/logs/jboss/sso.log . && gvim sso.log;;
    server ) 
      scp bkrzysztofmaraszek@anqal10fmiwj003.dca.diginsite.net:/app/logs/jboss/server.log . && gvim server.log;;
  esac
}

alias movie='telnet towel.blinkenlights.nl'

# Added by fabric8-maven-plugin at Thu May 11 16:12:37 BST 2017
export PATH=$PATH:/Users/bm185154/.fabric8/bin
