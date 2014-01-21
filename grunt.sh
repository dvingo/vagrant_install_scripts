#!/bin/bash -

# Update to include your Grunt packages.

cd /vagrant
npm install -g grunt-cli
npm install grunt-contrib-compass --save-dev
npm install grunt-contrib-concat --save-dev
npm install grunt-contrib-jshint --save-dev
npm install grunt-contrib-uglify --save-dev
npm install grunt-contrib-watch --save-dev
npm install grunt-ember-templates --save-dev
