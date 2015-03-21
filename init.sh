#!/bin/sh
#
# Simple Redis init.d script conceived to work on Linux systems
# as it does use of the /proc filesystem.

source `dirname $0`/set-vars.sh

REDISREPL=$1
REDISPORT=$2
EXEC=$REDIS_SERVER
CLIEXEC=$REDIS_CLI

PIDFILE="${REDIS_TEST_ROOT}/work/redis-${REDISREPL}-${REDISPORT}/redis_${REDISPORT}.pid"
CONF="${REDIS_TEST_ROOT}/work/redis-${REDISREPL}-${REDISPORT}.conf"

if [ ! -f "$CONF" ];
then
    mkdir -p "${REDIS_TEST_ROOT}/work/redis-${REDISREPL}-${REDISPORT}"
    sed "s,MSREDISPORT,${REDISPORT},g" "${REDIS_TEST_ROOT}/redis-${REDISREPL}.conf" > "$CONF"
    sed -i ".bak" "s,MSREDISWORKDIR,${REDIS_TEST_ROOT}/work,g" "$CONF"
fi

case "$3" in
    start)
        if [ -f $PIDFILE ]
        then
                echo "$PIDFILE exists, process is already running or crashed"
        else
                echo "Starting Redis server..."
                $EXEC $CONF
        fi
        ;;
    stop)
        if [ ! -f $PIDFILE ]
        then
                echo "$PIDFILE does not exist, process is not running"
        else
                PID=$(cat $PIDFILE)
                echo "Stopping ..."
                $CLIEXEC -p $REDISPORT shutdown
                while [ -x /proc/${PID} ]
                do
                    echo "Waiting for Redis to shutdown ..."
                    sleep 1
                done
                echo "Redis stopped"
        fi
        ;;
    *)
        echo "Please use start or stop as first argument"
        ;;
esac
