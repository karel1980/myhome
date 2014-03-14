export EDITOR=vim
export PRINTER=kyocera
export ACK_OPTIONS="--ignore-dir=target --ignore-dir=eclipebin --ignore-dir=elipebin --ignore-dir=eclipsebin --ignore-dir=eclipse_bin --ignore-dir=.git"
export GRADLE_HOME="$HOME/opt/gradle-1.6"

export CONSUMERDB_SRC=$HOME/work/ngdata/consumerdb
export SCHEMATOOLS_SRC=$HOME/work/ngdata/lily-schematools
export LILY_SRC=$HOME/work/ngdata/lily
export LILY_ETL_SRC=$HOME/work/ngdata/lily-etl
export HBASE_INDEXER_SRC=$HOME/work/ngdata/hbase-indexer
export SOLR_HOME=$HOME/opt/solr-4.6.0
export UTS_SRC=$HOME/work/mix/uts

#CDH stuff
export CDH_DIR=$HOME/opt/cdh4.4.0
export FLUME_HOME=$CDH_DIR/apache-flume-1.4.0-cdh4.4.0-bin
export DATAFU_HOME=$CDH_DIR/datafu-0.0.4-cdh4.4.0
export HADOOP_HOME=$CDH_DIR/hadoop-2.0.0-cdh4.4.0
export HBASE_HOME=$CDH_DIR/hbase-0.94.6-cdh4.4.0
export HCATALOG_HOME=$CDH_DIR/hcatalog-0.5.0-cdh4.4.0
export HIVE_HOME=$CDH_DIR/hive-0.10.0-cdh4.4.0
export MAHOUT_HOME=$CDH_DIR/mahout-0.7-cdh4.4.0
export OOZIE_HOME=$CDH_DIR/oozie-3.3.2-cdh4.4.0
export PIG_HOME=$CDH_DIR/pig-0.11.0-cdh4.4.0
export SENTRY_HOME=$CDH_DIR/sentry-1.1.0-cdh4.4.0
export SQOOP_HOME=$CDH_DIR/sqoop-1.4.3-cdh4.4.0
export SQOOP2_HOME=$CDH_DIR/sqoop2-1.99.2-cdh4.4.0
export ZOOKEEPER_HOME=$CDH_DIR/zookeeper-3.4.5-cdh4.4.0

export STOW_DATA=$HOME/work/personal/myhome/stow
export STOW_DATA_EXTRA=$HOME/"Ubuntu One"/personal/stowhome

export M2_REPO=$HOME/.m2/repository
export M2_HOME=$HOME/opt/apache-maven-3.0.5

export CHROMIUM_ROOT=$HOME/work/persoonlijk/chromium
export GAE_HOME=$HOME/opt/appengine-java-sdk-1.3.4

export CREPO=$HOME/work/misc/crepo/crepo.py
export ROOT=$HOME/work/misc/hue

export DEBEMAIL="karel@ngdata.com"
export DEBFULLNAME="Karel Vervaeke"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export EC2_URL=https://ec2.us-east-1.amazonaws.com
#export EC2_URL=https://ec2.eu-west-1.amazonaws.com

export GRIFFON_HOME=$HOME/opt/griffon-1.1.0
export GRADLE_HOME=$HOME/opt/gradle-1.6

export ANDROID_HOME=$HOME/opt/android-sdk-linux

function awv() {
  export DAISY_HOME=$HOME/work/awv/awv-daisy/runtime/daisy
}

function e() {
  [ -z "$1" ] && nautilus .
  [ ! -z "$1" ] && nautilus "$@"
}

#export ZKCONN=adeo-dev

export VIRSH_DEFAULT_CONNECT_URI=qemu:///system

export IRCNICK="karel_ff"
export IRCNAME="Karel Vervaeke"
export IRCSERVER="irc.freenode.net"

export KETTLE_HOME=$HOME/opt/data-integration
export JMETER_HOME="$HOME/opt/apache-jmeter-2.9"

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH="$PATH:$GRIFFON_HOME/bin"
export PATH="$PATH:$HADOOP_HOME/bin"
export PATH="$PATH:$ZOOKEEPER_HOME/bin"
export PATH="$PATH:$HBASE_HOME/bin"
export PATH="$PATH:$HIVE_HOME/bin"
export PATH="$PATH:$FLUME_HOME/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/opt/eclipse"
export PATH="$PATH:$MAVEN_HOME/bin"
export PATH="$PATH:/var/lib/gems/1.8/bin"
export PATH="$PATH:$PATH"
export PATH="$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:$WHIRR_HOME/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$KETTLE_HOME"
export PATH="$PATH:$JMETER_HOME/bin"
export PATH="$PATH:$HOME/opt/idea/bin"

alias ack=ack-grep
alias addpi='echo `pwd`>>$HOME/.pi'
alias cdp='cd $HOME/Pictures'
alias cdw='cd $HOME/work'
alias crepo=$CREPO
alias curl='curl --cookie ~/tmp/cookies.txt --user-agent Mozilla/4.0'
alias daisy-js='$DAISY_HOME/bin/daisy-js'
alias ducks="du -cks *|sort -rn|head -11"
alias fop="$HOME/opt/fop-0.95/fop"
alias gae=$GAE_HOME/bin/dev_appserver.sh
alias getclip="xclip -o"
alias kauri='$KAURI_HOME/kauri.sh'
alias mkgmap='java -Xmx2048M -jar ~/opt/mkgmap/mkgmap/mkgmap.jar'
alias putclip="xclip -i"
alias sai="sudo apt-get install -y"
alias vi=vim
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias wget='wget -U "firefox"'
alias xo='xdg-open'
alias ymd='exiftool "-Directory<DateTimeOriginal" -d %Y/%m/%d .'

alias sl='ls'
alias LS='ls'

alias mssh='ssh-multi.sh'

manswitch () { man $1 | less -p "^ +$2"; }

each() {
  namearg=$1
  shift
  find . -name "$namearg" -exec $@ {} +
}

alias z='notify-send'
alias e='nautilus .'
alias pw='tail ~/.ng-mix-*'

export KAURI_HOME=$HOME/work/ngdata/kauri
export AWS_DEFAULT_REGION=us-east-1

function ec2sel() {
    if [ -z "$1" ]; then
      1=last
      return
    fi
      
    if [ ! -e "$HOME/.ec2/$1" ]; then
      echo "~/.ec2/$1 does not exist"
      return
    fi

    . "$HOME/.ec2/$1" 
    if [ "$1" != "last" ]; then
      ln -sf "$HOME/.ec2/$1" "$HOME/.ec2/last"
    fi
}
ec2sel last

function fack() {
  local name=$1
  shift
  find . -name "$name" -exec ack-grep "$@" {} +
}

function sandenv() {
  export LILY_CONF_DIR=conf
  export LILY_CLASSPATH=/tmp/lily-sandbox/conf
  export HIVE_CONF_DIR=/tmp/lily-sandbox/conf
  export HADOOP_CONF_DIR=/tmp/lily-sandbox/conf
}
