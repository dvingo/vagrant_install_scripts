#!/bin/bash -

# Installs the Oracle Java JDK.
# This requires that you obtain the tar.gz file from their site:
# http://www.oracle.com/technetwork/java/javase/downloads/index.html
# and then rename it to jdk-7-linux-x64.tar.gz
# this way this script will work for any Java update releases.

# Steps to install gathered from:
# https://help.ubuntu.com/community/Java
# http://askubuntu.com/questions/56104/how-can-i-install-sun-oracles-proprietary-java-6-7-jre-or-jdk
# http://askubuntu.com/questions/56104/how-can-i-install-sun-oracles-proprietary-java-6-7-jre-or-jdk/68227#68227

tarball=/vagrant/jdk-7-linux-x64.tar.gz
extract_name=jdk1.7.0_
tar -xzf "$tarball" --directory /vagrant
mkdir -p /usr/lib/jvm
mv "/vagrant/$extract_name*" /usr/lib/jvm/jdk1.7.0
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0/bin/javaws" 1
chmod a+x /usr/bin/java
chmod a+x /usr/bin/javac
chmod a+x /usr/bin/javaws
chown -R root:root /usr/lib/jvm/jdk1.7.0
update-alternatives --set java /usr/lib/jvm/jdk1.7.0/bin/java
