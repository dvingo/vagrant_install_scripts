#!/bin/bash -

# Installs a more up-to-date version of nodejs and npm from the chris-lea
# repository.

# Instructions taken from:
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os
nodejs_deps='python-software-properties python g++ make '
apt-get update
apt-get install -y $nodejs_deps
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
