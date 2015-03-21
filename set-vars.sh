#!/bin/sh

if [ -z "$REDIS_HOME" ]
then
	echo "PLEASE SET REDIS_HOME to the redis application directory!"
	exit 1
fi

export REDIS_SERVER=$REDIS_HOME/src/redis-server
export REDIS_CLI=$REDIS_HOME/src/redis-cli

REDIS_TEST_ROOT_REL=`dirname $0`
cd $REDIS_TEST_ROOT_REL
export REDIS_TEST_ROOT=`pwd`
cd - > /dev/null

#echo "Using REDIS_HOME = $REDIS_HOME"
#echo "Using REDIS_TEST_ROOT = $REDIS_TEST_ROOT"
