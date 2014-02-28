#!/bin/bash -

# Installs the Ruby version set below using rbenv and ruby-build into the
# home directory specified.
# If this fails you may need to install these dependencies via apt-get:
# 'libxslt-dev libxml2-dev'
home_dir=/home/vagrant
ruby_version=2.1.0

git clone https://github.com/sstephenson/rbenv.git "$home_dir/.rbenv"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> "$home_dir/.bashrc"
echo 'eval "$(rbenv init -)"' >> "$home_dir/.bashrc"

# Install ruby-build.
git clone https://github.com/sstephenson/ruby-build.git "$home_dir/.rbenv/plugins/ruby-build"
$home_dir/.rbenv/bin/rbenv install "$ruby_version"
$home_dir/.rbenv/bin/rbenv global "$ruby_version"
rbenv rehash
