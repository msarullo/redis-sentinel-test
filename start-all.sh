#!/bin/bash

source `dirname $0`/set-vars.sh

echo "Starting Redis Master..."
bash $REDIS_TEST_ROOT/init-master.sh start
echo "Master status:"
bash $REDIS_TEST_ROOT/cli-master.sh info replication

echo "---"

echo "Starting Redis Slave..."
bash $REDIS_TEST_ROOT/init-slave.sh start
echo "Slave status:"
bash $REDIS_TEST_ROOT/cli-slave.sh info replication
