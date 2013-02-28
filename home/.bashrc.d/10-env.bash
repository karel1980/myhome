export EDITOR=vim
export PRINTER=kyocera
export ACK_OPTIONS="--ignore-dir=target --ignore-dir=eclipebin --ignore-dir=elipebin --ignore-dir=eclipsebin --ignore-dir=eclipse_bin --ignore-dir=.git"

export CONSUMERDB_SRC=$HOME/work/ngdata/consumerdb
export SCHEMATOOLS_SRC=/home/karel/work/ngdata/lily-schematools
export LILY_SRC=$HOME/work/ngdata/lily
export LILY_ETL_SRC=$HOME/work/ngdata/lily-etl
export HADOOP_HOME=$HOME/opt/hadoop-2.0.0-mr1-cdh4.0.0
export HIVE_HOME=$HOME/opt/hive-0.8.1-cdh4.0.1
export PATH=$PATH:$HADOOP_HOME/bin

#export MAVEN_HOME=$HOME/opt/maven-1.0.2
export MAVEN_HOME=$HOME/opt/maven-1.1
export MAVEN_REPO=$HOME/.maven/repository
export M2_HOME=$HOME/opt/apache-maven-3.0.4

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
export PATH="$PATH:$GRIFFON_HOME/bin"

export ANDROID_HOME=$HOME/opt/android-sdk-linux_x86

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

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$HOME/bin:$HOME/opt/eclipse:$MAVEN_HOME/bin:/var/lib/gems/1.8/bin:$PATH:$GRIFFON_HOME/bin:$WHIRR_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export KETTLE_HOME=$HOME/opt/data-integration
export PATH=$PATH:$KETTLE_HOME

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
alias freemind='JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk freemind'
alias kauri='$KAURI_HOME/kauri.sh'
alias curl='curl --cookie ~/tmp/cookies.txt --user-agent Mozilla/4.0'
alias cdp='cd $HOME/Pictures'
alias ducks="du -cks *|sort -rn|head -11"
alias gae=$GAE_HOME/bin/dev_appserver.sh
alias mkgmap='java -Xmx2048M -jar ~/opt/mkgmap/mkgmap/mkgmap.jar'

alias sl='ls'
alias LS='ls'

manswitch () { man $1 | less -p "^ +$2"; }

each() {
  namearg=$1
  shift
  find . -name "$namearg" -exec $@ {} +
}

alias z='notify-send'

export KAURI_HOME=$HOME/work/ngdata/kauri
export PATH=$PATH:$HOME/opt/idea/bin
