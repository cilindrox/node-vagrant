#!/usr/bin/env bash
# Downloads and installs the latest Redis server.

add-apt-repository -y ppa:chris-lea/redis-server
apt-get install -y redis-server

exit 0
