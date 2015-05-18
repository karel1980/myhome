   
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
  mm      (maven opts: 2048m)
  mM      (maven opts: 2048m)
  mp      (maven opts: 2048m permgen)
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

function add_hdfs_to_path() {
  # remove it if it's already in the path
  which hdfs && path_remove $(dirname $(which hdfs))

  # add it
  export PATH="$HADOOP_HOME/bin:$PATH"
}

function cdh460() {
    #remove_cdh_from_path
    export CDH_VER=4.6.0
    export CDH_HOME=$HOME/opt/cdh$CDH_VER
    export DATAFU_HOME=$CDH_HOME/datafu-0.0.4-cdh${CDH_VER}
    export FLUME_HOME=$CDH_HOME/flume-ng-1.4.0-cdh${CDH_VER}
    export HADOOP_HOME=$CDH_HOME/hadoop-2.0.0-cdh${CDH_VER}
    export HBASE_HOME=$CDH_HOME/hbase-0.94.15-cdh${CDH_VER}
    export HCATALOG_HOME=$CDH_HOME/hcatalog-0.5.0-cdh${CDH_VER}
    export HIVE_HOME=$CDH_HOME/hive-0.10.0-cdh${CDH_VER}
    export HUE_HOME=$CDH_HOME/hue-2.5.0-cdh${CDH_VER}
    export MAHOUT_HOME=$CDH_HOME/mahout-0.7-cdh${CDH_VER}
    export PARQUET_HOME=$CDH_HOME/parquet-1.2.5-cdh${CDH_VER}
    export PIG_HOME=$CDH_HOME/pig-0.11.0-cdh${CDH_VER}
    export SENTRY_HOME=$CDH_HOME/sentry-1.1.0-cdh${CDH_VER}
    export SQOOP_HOME=$CDH_HOME/sqoop-1.4.3-cdh${CDH_VER}
    export SQOOP2_HOME=$CDH_HOME/sqoop2-1.99.2-cdh${CDH_VER}
    export WHIRR_HOME=$CDH_HOME/whirr-0.8.2-cdh${CDH_VER}
    export ZOOKEEPER_HOME=$CDH_HOME/zookeeper-3.4.5-cdh${CDH_VER}

    add_hdfs_to_path
}

function cdh510() {
    #remove_cdh_from_path
    export CDH_VER=5.1.0
    export CDH_HOME=$HOME/opt/cdh$CDH_VER
    export FLUME_HOME=$CDH_HOME/apache-flume-1.4.0-cdh${CDH_VER}-bin
    export DATAFU_HOME=$CDH_HOME/datafu-0.0.4-cdh${CDH_VER}
    export HADOOP_HOME=$CDH_HOME/hadoop-2.0.0-cdh${CDH_VER}
    export HBASE_HOME=$CDH_HOME/base-0.98.1-cdh${CDH_VER}
    export HCATALOG_HOME=$CDH_HOME/hcatalog-0.5.0-cdh${CDH_VER}
    export HIVE_HOME=$CDH_HOME/hive-0.10.0-cdh${CDH_VER}
    export MAHOUT_HOME=$CDH_HOME/mahout-0.7-cdh${CDH_VER}
    export OOZIE_HOME=$CDH_HOME/oozie-3.3.2-cdh${CDH_VER}
    export PIG_HOME=$CDH_HOME/pig-0.11.0-cdh${CDH_VER}
    export SENTRY_HOME=$CDH_HOME/sentry-1.1.0-cdh${CDH_VER}
    export SQOOP_HOME=$CDH_HOME/sqoop-1.4.3-cdh${CDH_VER}
    export SQOOP2_HOME=$CDH_HOME/sqoop2-1.99.2-cdh${CDH_VER}
    export ZOOKEEPER_HOME=$CDH_HOME/zookeeper-3.4.5-cdh${CDH_VER}

    add_hdfs_to_path
}

function cdh512() {
    #remove_cdh_from_path
    export CDH_VER=5.1.2
    export CDH_HOME=$HOME/opt/cdh$CDH_VER
    export AVRO_HOME=$CDH_HOME/avro-1.7.5-cdh${CDH_VER}
    export CRUNCH_HOME=$CDH_HOME/crunch-0.10.0-cdh${CDH_VER}
    export DATAFU_HOME=$CDH_HOME/datafu-1.1.0-cdh${CDH_VER}
    export FLUME_HOME=$CDH_HOME/flume-ng-1.5.0-cdh${CDH_VER}
    export HADOOP_HOME=$CDH_HOME/hadoop-2.3.0-cdh${CDH_VER}
    export HBASE_HOME=$CDH_HOME/hbase-0.98.1-cdh${CDH_VER}
    export HBASE_HOME=$CDH_HOME/hbase-solr-1.5-cdh${CDH_VER}
    export HIVE_HOME=$CDH_HOME/hive-0.12.0-cdh${CDH_VER}
    export HUE_HOME=$CDH_HOME/hue-3.6.0-cdh${CDH_VER}
    export KITE_HOME=$CDH_HOME/kite-0.10.0-cdh${CDH_VER}
    export LLAMA_HOME=$CDH_HOME/llama-1.0.0-cdh${CDH_VER}
    export MAHOUT_HOME=$CDH_HOME/mahout-0.9-cdh${CDH_VER}
    export PARQUET_HOME=$CDH_HOME/parquet-1.2.5-cdh${CDH_VER}
    export PARQUET_HOME=$CDH_HOME/parquet-format-1.0.0-cdh${CDH_VER}
    export PIG_HOME=$CDH_HOME/pig-0.12.0-cdh${CDH_VER}
    export SEARCH_HOME=$CDH_HOME/search-1.0.0-cdh${CDH_VER}
    export SENTRY_HOME=$CDH_HOME/sentry-1.3.0-cdh${CDH_VER}
    export SOLR_HOME=$CDH_HOME/solr-4.4.0-cdh${CDH_VER}
    export SPARK_HOME=$CDH_HOME/spark-1.0.0-cdh${CDH_VER}
    export SQOOP_HOME=$CDH_HOME/sqoop-1.4.4-cdh${CDH_VER}
    export SQOOP2_HOME=$CDH_HOME/sqoop2-1.99.3-cdh${CDH_VER}
    export WHIRR_HOME=$CDH_HOME/whirr-0.9.0-cdh${CDH_VER}
    export ZOOKEEPER_HOME=$CDH_HOME/zookeeper-3.4.5-cdh${CDH_VER}

    add_hdfs_to_path
}

path_remove /usr/lib/jvm/java-6-oracle
path_remove /usr/lib/jvm/java-7-oracle
path_remove /usr/lib/jvm/java-8-oracle
}

me s m3 mm j7

