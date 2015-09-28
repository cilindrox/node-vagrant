#!/usr/bin/env bash
# Installs the Node Version Manager (https://github.com/creationix/nvm)

su vagrant -c "wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash"

# Load nvm for the current script
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

export NODE_VERSION='0.12.7'
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

# Install global packages
# npm install -g bower ember-cli nodemon
