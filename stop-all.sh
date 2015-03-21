#!/bin/bash

source `dirname $0`/set-vars.sh

echo "Stopping Redis Master..."
bash $REDIS_TEST_ROOT/init-master.sh stop

echo "Stopping Redis Slave..."
bash $REDIS_TEST_ROOT/init-slave.sh stop
