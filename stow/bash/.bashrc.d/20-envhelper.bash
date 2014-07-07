   
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

function me() {
  [ -z $1 ] && echo "Usage me <config> ... 
Where config is one of:
  s       (silent - suppresses env variable feedback)
  j6      (set JAVA_HOME to java 6 oracle)
  j7      (set JAVA_HOME to java 7 oracle)
  awvd    (awv-daisy env)
  awvp    (awv-app env)
  d23     (daisy 2.3)
  d24rc1  (daisy 2.4-RC1)
  mc      (clear maven opts)
  md      (maven opts for debugging (port 5005))
  mm      (maven opts: 1024m)
  mM      (maven opts: 2048m)
  mp      (maven opts: 1024m permgen)
  show    (show DAISY_HOME and MAVEN_HOME)"

local moc
local mo
local silent
while [ -n "$1" ]; do
  case $1 in
     s)
       silent="1"
       ;;
    j6)
      export JAVA_HOME=/usr/lib/jvm/java-1.6.0-oracle
      [ -z "$silent" ] && echo JAVA_HOME=$JAVA_HOME
      ;;
    j7)
      export JAVA_HOME=/usr/lib/jvm/java-1.7.0-oracle
      [ -z "$silent" ] && echo JAVA_HOME=$JAVA_HOME
      ;;
    j8)
      export JAVA_HOME=/usr/lib/jvm/java-1.8.0-oracle
      [ -z "$silent" ] && echo JAVA_HOME=$JAVA_HOME
      ;;
    awvd)
      export DAISY_HOME=$HOME/work/awv/awv-daisy/runtime/daisy
      [ -z "$silent" ] && echo DAISY_HOME=$DAISY_HOME
      ;;
    awvp)
      export DAISY_HOME=$HOME/work/awv/awv-app/daisy
      [ -z "$silent" ] && echo DAISY_HOME=$DAISY_HOME
      ;;
     m11)
       export MAVEN_HOME=$HOME/opt/maven-1.1
       [ -z "$silent" ] && echo MAVEN_HOME=$MAVEN_HOME
       ;;
     m102)
       export MAVEN_HOME=$HOME/opt/maven-1.0.2
       [ -z "$silent" ] && echo MAVEN_HOME=$MAVEN_HOME
       ;;
     m2)
      export M2_HOME=$HOME/opt/apache-maven-2.2.1
      [ -z "$silent" ] && echo M2_HOME=$M2_HOME
      ;;
     m3)
      export M2_HOME=$HOME/opt/apache-maven-3.0.5
      [ -z "$silent" ] && echo M2_HOME=$M2_HOME
       ;;
     m32)
      export M2_HOME=$HOME/opt/apache-maven-3.2.2
      [ -z "$silent" ] && echo M2_HOME=$M2_HOME
       ;;
     mm)
       mo="$mo -XX:PermSize=512m -XX:MaxPermSize=1024m -Xmx1024m"
       ;;
     mM)
       mo="$mo -Xmx2048m"
       ;;
     mp)
       mo="$mo -XX:PermSize=512m -XX:MaxPermSize=1024m"
       ;;
     md)
       mo="$mo -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=y"
       ;;
     mc)
       moc=1
       mo=""
       ;;
     projx)
      mvn archetype:generate -DarchetypeGroupId=daisy -DarchetypeArtifactId=sample-project -DarchetypeVersion=$2 -DgroupId=com.example -DartifactId=projx -Dversion=1.0-SNAPSHOT -DinteractiveMode=false
      shift
      ;;
     show)
       echo "JAVA_HOME=$JAVA_HOME"
       echo "DAISY_HOME=$DAISY_HOME"
       echo "MAVEN_OPTS=$MAVEN_OPTS"
       ;;
     *)
       echo "ignoring option $1"
    esac
    shift

done;
[ -n "$moc$mo" ] && MAVEN_OPTS="${mo:1}" && export MAVEN_OPTS && [ -z "$silent" ] && echo MAVEN_OPTS=$MAVEN_OPTS

path_remove /usr/lib/jvm/java-6-oracle
path_remove /usr/lib/jvm/java-7-oracle
path_remove /usr/lib/jvm/java-8-oracle
if [ -n "$JAVA_HOME" ]; then
	path_prepend $JAVA_HOME/bin
fi
}

me s m3 mm j7

