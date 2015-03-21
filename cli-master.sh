#!/bin/bash

source `dirname $0`/set-vars.sh

$REDIS_CLI -p 6379 $@