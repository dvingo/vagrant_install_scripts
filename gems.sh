#!/bin/bash -

# Update to include your desired Gems.
gem update --system
gem install bundler
gem install sass
gem install compass
gem install zen-grids

# Alternatively:
# cd /vagrant
# bundle install
