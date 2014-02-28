#!/bin/bash -

# Installs ruby gems listed. 
# This should be run after the desired ruby version is installed.

# Update to include your desired Gems.
gem update --system
gem install bundler
gem install sass
gem install compass
gem install zen-grids

# Alternatively:
# cd /vagrant
# bundle install
