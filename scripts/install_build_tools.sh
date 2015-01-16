#!/usr/bin/env bash
# Installs build tool essentials

apt-get update
apt-get upgrade -y

# apt-get install -y make g++ libcairo2-dev libav-tools
apt-get install -y build-essential git curl vim nfs-common portmap
