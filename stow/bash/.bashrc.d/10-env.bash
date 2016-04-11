export EDITOR=vim
export PRINTER=kyocera
export ACK_OPTIONS="--ignore-dir=target --ignore-dir=eclipebin --ignore-dir=elipebin --ignore-dir=eclipsebin --ignore-dir=eclipse_bin --ignore-dir=.git"

export SOLR_HOME=$HOME/opt/solr-4.6.0

export STOW_DATA=$HOME/work/personal/myhome/stow
export STOW_DATA_EXTRA=$HOME/Dropbox/personal/stowhome

export CHROMIUM_ROOT=$HOME/work/persoonlijk/chromium
export GAE_HOME=$HOME/opt/appengine-java-sdk-1.3.4

export ROOT=$HOME/work/misc/hue

export DEBEMAIL="karel.vervaeke@aca-it.be"
export DEBFULLNAME="Karel Vervaeke"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export GRADLE_HOME="$HOME/opt/gradle-2.3"

export ANDROID_HOME=${ENV_ANDROID_HOME:-$HOME/opt/android-sdk-linux}

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
if [ -n "$ENV_EXTRA_PATH" ]; then
	export PATH="$PATH:$ENV_EXTRA_PATH"
fi
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/opt/eclipse"
export PATH="$PATH:/var/lib/gems/1.8/bin"
export PATH="$PATH:$PATH"
export PATH="$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:/opt/Scratch 2/bin"

alias ack=ack-grep
alias addpi='echo `pwd`>>$HOME/.pi'
alias cdp='cd $HOME/Pictures'
alias cdw='cd $HOME/work'
alias crepo=$CREPO
alias curl='curl --cookie ~/tmp/cookies.txt --user-agent Mozilla/4.0'
alias ducks="du -cks *|sort -rn|head -11"
alias fop="$HOME/opt/fop-0.95/fop"
alias gae=$GAE_HOME/bin/dev_appserver.sh
alias getclip="xclip -o"
alias mkgmap='java -Xmx2048M -jar ~/opt/mkgmap/mkgmap/mkgmap.jar'
alias putclip="xclip -i"
alias sai="sudo apt-get install -y"
alias vi=vim
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias wget='wget -U "firefox"'
alias xo='xdg-open'
alias ymd='exiftool "-Directory<DateTimeOriginal" -d %Y/%Y-%m-%d .'

alias sl='ls'
alias LS='ls'

alias mssh='ssh-multi.sh'

manswitch () { man $1 | less -p "^ +$2"; }

each() {
  namearg=$1
  shift
  find . -name "$namearg" -exec $@ {} +
}

alias e='nautilus .'
alias pw='tail ~/.ng-mix-*'

export AWS_DEFAULT_REGION=us-east-1

alias please='sudo $(history -p \!\!)' 

