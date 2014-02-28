#!/bin/bash -

# Installs ruby gems from a Gemfile located in /vagrant.
# This should be run after the desired ruby version is installed
#   and assumes it was installed with rbenv.

cd /vagrant
# Because the provisioner doesn't have these on the PATH we must use
# absolute paths to the shims.
/home/vagrant/.rbenv/shims/gem update --system
/home/vagrant/.rbenv/shims/gem install bundler
/home/vagrant/.rbenv/bin/rbenv rehash
/home/vagrant/.rbenv/shims/bundle install
/home/vagrant/.rbenv/bin/rbenv rehash
