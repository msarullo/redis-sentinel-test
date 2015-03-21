# Introduction

This project experiments with Redis (http://www.redis.io).

# Prerequisites

1.  Download Redis 2.8.19 and compile it.

2.  Set the REDIS_HOME environment variable to point at the root directory for Redis.

# Usage

The scripts in the home directory kick everything off.  The key scripts you'll want to use are:

1.  start-all.sh - brings up all servers

2.  stop-all.sh - brings down all servers

3.  cli-master.sh and cli-slave.sh - for the redis cli interface to the servers