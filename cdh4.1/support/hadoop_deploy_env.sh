#!/usr/bin/env bash
# coding=utf-8
# Author: zhaigy@ucweb.com
# Data:   2012-09

if [ -z $DP_HOME ]; then
  die "deployer is not installed or install fail"
fi
. $DP_HOME/support/PUB.sh

# Tar包
if IS_32 ; then
  #JAVA_TAR="jdk-7u3-linux-i586.tar.gz"
  JAVA_TAR=`find_tar "jdk.*86"`
else
  #JAVA_TAR="jdk-7u3-linux-x64.tar.gz"
  JAVA_TAR=`find_tar "jdk.*x64"`
fi

#HADOOP_TAR="hadoop-2.0.0-cdh4.0.0.tar.gz"
HADOOP_TAR=`find_tar "hadoop-2\\..*-cdh4\\..*"`
HADOOP_VERSION=${HADOOP_TAR%.tar.gz}

# 配置

# core-site
# HADOOP_TMP_DIR="$HOME/hadoop_data"

# hdfs-site
#DFS_DATANODE_HANDLER_COUNT="3"
#DFS_DATANODE_HANDLER_COUNT=`[ ${#NN} -gt 10 ] && echo 10 || echo ${#NN}`
#DFS_HTTP_ADDRESS="$NN:${HADOOP_PORT_PREFIX}070"
#DFS_REPLICATION=`[ ${#NN} -gt 8 ] && echo 3 || echo 2`
#DFS_NAMENODE_HANDLER_COUNT="10"
#DFS_HTTPS_ADDRESS="0.0.0.0:${HADOOP_PORT_PREFIX}470"
#DFS_THRIFT_PORT="${HADOOP_PORT_PREFIX}903"
#DFS_THRIFT_ADDRESS="0.0.0.0:$DFS_THRIFT_PORT"
#DFS_BLOCK_SIZE="134217728"
#DFS_BALANCE_BANDWIDTHpERsEC="20000000"

# mapred-site
# 未使用
#HADOOP_JOB_HISTORY_LOCATION=""
#HADOOP_JOB_HISTORY_USER_LOCATION=""
#MAPRED_JOB_TRACKER="$NN:${HADOOP_PORT_PREFIX}901"
#MAPRED_MAP_TASKS="2"
#MAPRED_REDUCE_TASKS="1"
#MAPRED_TASKTRACKER_MAP_TASKS_MAXIMUM="6"
#MAPRED_TASKTRACKER_REDUCE_TASKS_MAXIMUM="2"
#MAPRED_JOB_TRACKER_HTTP_ADDRESS="0.0.0.0:${HADOOP_PORT_PREFIX}030"
#MAPRED_TASK_TRACKER_HTTP_ADDRESS="0.0.0.0:${HADOOP_PORT_PREFIX}060"
#JOBTRACKER_THRIFT_PORT="${HADOOP_PORT_PREFIX}904"
#JOBTRACKER_THRIFT_ADDRESS="0.0.0.0:$JOBTRACKER_THRIFT_PORT"

