#!/usr/bin/env bash
# Taken from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

MONGO_VERSION='2.6.6'

# Import the public key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Create a list file
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update

# Install release described in MONGO_VERSION of MongoDB
apt-get install -y mongodb-org=$MONGO_VERSION \
  mongodb-org-server=$MONGO_VERSION \
  mongodb-org-shell=$MONGO_VERSION \
  mongodb-org-mongos=$MONGO_VERSION \
  mongodb-org-tools=$MONGO_VERSION

# Pin the installed packages to prevent apt-get from upgrading them
echo "mongodb-org hold" | dpkg --set-selections
echo "mongodb-org-server hold" | dpkg --set-selections
echo "mongodb-org-shell hold" | dpkg --set-selections
echo "mongodb-org-mongos hold" | dpkg --set-selections
echo "mongodb-org-tools hold" | dpkg --set-selections

exit 0
