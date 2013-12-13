export EDITOR=vim
export PRINTER=kyocera
export ACK_OPTIONS="--ignore-dir=target --ignore-dir=eclipebin --ignore-dir=elipebin --ignore-dir=eclipsebin --ignore-dir=eclipse_bin --ignore-dir=.git"
export GRADLE_HOME="$HOME/opt/gradle-1.6"

export CONSUMERDB_SRC=$HOME/work/ngdata/consumerdb
export SCHEMATOOLS_SRC=$HOME/work/ngdata/lily-schematools
export LILY_SRC=$HOME/work/ngdata/lily
export LILY_ETL_SRC=$HOME/work/ngdata/lily-etl
export HADOOP_HOME=$HOME/opt/hadoop-2.0.0-mr1-cdh4.2.0
export HBASE_HOME=$HOME/opt/hbase-0.94.2-cdh4.2.0
export HIVE_HOME=$HOME/opt/hive-0.10.0-cdh4.2.0
export SOLR_HOME=$HOME/opt/solr-4.6.0
export ZOOKEEPER_HOME=$HOME/opt/zookeeper-3.4.5-cdh4.2.0
export FLUME_HOME=$HOME/opt/apache-flume-1.3.0-cdh4.2.1-bin
export UTS_SRC=$HOME/work/mix/uts
export STOW_DATA=$HOME/work/personal/myhome/stow
export STOW_DATA_EXTRA=$HOME/"Ubuntu One"/personal/stowhome

#export MAVEN_HOME=$HOME/opt/maven-1.0.2
export MAVEN_HOME=$HOME/opt/maven-1.1
export MAVEN_REPO=$HOME/.maven/repository
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

alias crepo=$CREPO
alias ack=ack-grep
alias cdw='cd $HOME/work'
alias getclip="xclip -o"
alias putclip="xclip -i"
alias vi=vim
alias daisy-js='$DAISY_HOME/bin/daisy-js'
alias ymd='exiftool "-Directory<DateTimeOriginal" -d %Y/%m/%d .'
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias addpi='echo `pwd`>>$HOME/.pi'
alias wget='wget -U "firefox"'
alias fop="$HOME/opt/fop-0.95/fop"
alias kauri='$KAURI_HOME/kauri.sh'
alias curl='curl --cookie ~/tmp/cookies.txt --user-agent Mozilla/4.0'
alias cdp='cd $HOME/Pictures'
alias ducks="du -cks *|sort -rn|head -11"
alias gae=$GAE_HOME/bin/dev_appserver.sh
alias mkgmap='java -Xmx2048M -jar ~/opt/mkgmap/mkgmap/mkgmap.jar'
alias xo='xdg-open'

alias sl='ls'
alias LS='ls'

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
