# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
#LANG=ja_JP.UTF-8

export JAVA_HOME=/usr/java/jdk1.7.0_09
export PATH=/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/mysql/bin:/usr/java/jdk1.7.0_09/bin:/usr/bin:$PATH
export ULIMIT=`ulimit`
export NLS_LANG=Japanese_Japan.JA16EUC
export VISUAL=vim

export SCALA_HOME=/usr/local/lib/scala
export CLASSPATH=$CLASSPATH:.:/usr/java:/usr/local/lib/scala/lib/scala-library.jar

source ~/.git-completion.bash


#-----------------------
# BASH Prompt setting.
#-----------------------
if [ "$PS1" ]; then

  setenv () {
    export $1="$2"
  }

  unsetenv() {
    unset $*
  }

  ignoreeof=2
  notify=

  no_exit_on_failed_exec=

  if [ ! "$LOGIN_SHELL" ]; then
    PS1='\033[33m\]\n\H - \u: \033[0m\][\w]\] \033[1m\]\033[31m\]$(  __git_ps1 "%s") \033[0m\]\n>> '
  fi

  HISTFILESIZE=1024
  HISTSIZE=128
  MAILCHECK=30

  if [ -f /usr/local/bin/setcts ]; then
    /usr/local/bin/setcts
  fi

  if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
  fi

fi

export PERL_BADLANG=0

alias ll='ls -la'
alias my_ctags='ctags -R --languages=PHP --langmap=PHP:.php.inc --php-types=c+f+d+v'
