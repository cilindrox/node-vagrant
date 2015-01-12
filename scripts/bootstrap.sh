#!/usr/bin/env bash

if [ -e "/etc/vagrant-provisioned" ]; then
    echo "Vagrant provisioning already completed. Skipping..."
    exit 0
fi

echo "Starting Vagrant provisioning process..."

BOX_NAME='node-vagrant'
# Change the hostname so we can easily identify what environment we're on:
echo "$BOX_NAME" > /etc/hostname
# Prevent hostname resolution issues
echo "127.0.0.1 $BOX_NAME" >> /etc/hosts
# Use new hostname immediately (skip restart)
hostname $BOX_NAME

# Install core components
/vagrant/scripts/pre_install.sh

# Install MongoDB
/vagrant/scripts/install_mongodb.sh

# Install node
/vagrant/scripts/install_nvm.sh

touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant instance is ready"
