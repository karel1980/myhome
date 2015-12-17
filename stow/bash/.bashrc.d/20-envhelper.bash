   
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

function me() {
  [ -z $1 ] && echo "Usage me <config> ... 
Where config is one of:
  s       (silent - suppresses env variable feedback)
  j7      (set JAVA_HOME to java 7 oracle)
  awvd    (awv-daisy env)
  awvp    (awv-app env)
  d23     (daisy 2.3)
  d24rc1  (daisy 2.4-RC1)
  mc      (clear maven opts)
  mcol    (maven syntax coloring)
  md      (maven opts for debugging (port 5005))
  mm      (maven opts: 2048m)
  mM      (maven opts: 2048m)
  mp      (maven opts: 2048m permgen)"

local moc
local mo
local silent
while [ -n "$1" ]; do
  case $1 in
     s)
       silent="1"
       ;;
    j7)
      export JAVA_HOME=$ENV_J7_HOME
      [ -z "$silent" ] && echo JAVA_HOME=$JAVA_HOME
      ;;
    j8)
      export JAVA_HOME=$ENV_J8_HOME
      [ -z "$silent" ] && echo JAVA_HOME=$JAVA_HOME
      ;;
     m3)
      export MAVEN_HOME=$HOME/opt/apache-maven-3.0.5
      path_prepend $MAVEN_HOME/bin
      [ -z "$silent" ] && echo MAVEN_HOME=$MAVEN_HOME
       ;;
     m32)
      export MAVEN_HOME=$HOME/opt/apache-maven-3.2.2
      [ -z "$silent" ] && echo MAVEN_HOME=$MAVEN_HOME
       ;;
     mcol)
       mo="$mo -javaagent:$HOME/.m2/maven-color-agent-1.1.jar"
       ;;
     mm)
       mo="$mo -XX:PermSize=512m -XX:MaxPermSize=3g -Xmx3g -XX:ReservedCodeCacheSize=256m"
       ;;
     mM)
       mo="$mo -Xmx3g"
       ;;
     md)
       mo="$mo -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=y"
       ;;
     mc)
       moc=1
       mo=""
       ;;
     yjp)
       mo="$mo -agentpath:$HOME/opt/yjp-2014-build-14116/bin/linux-x86-64/libyjpagent.so"
       ;;
     projx)
      mvn archetype:generate -DarchetypeGroupId=daisy -DarchetypeArtifactId=sample-project -DarchetypeVersion=$2 -DgroupId=com.example -DartifactId=projx -Dversion=1.0-SNAPSHOT -DinteractiveMode=false
      shift
      ;;
     *)
       echo "ignoring option $1"
    esac
    shift

done;
[ -n "$moc$mo" ] && MAVEN_OPTS="${mo:1}" && export MAVEN_OPTS && [ -z "$silent" ] && echo MAVEN_OPTS=$MAVEN_OPTS

function add_hdfs_to_path() {
  # remove it if it's already in the path
  which hdfs && path_remove $(dirname $(which hdfs))

  # add it
  export PATH="$HADOOP_HOME/bin:$PATH"
}

path_remove /usr/lib/jvm/java-6-oracle
path_remove /usr/lib/jvm/java-7-oracle
path_remove /usr/lib/jvm/java-8-oracle
}

me s mcol m3 mm j7

