#!/bin/bash -

# Installs Neo4j from the Neo Techonlogy's repository.

# It is recommended to run the Java 7 install before install Neo4j.

wget -O - http://debian.neo4j.org/neotechnology.gpg.key| apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
apt-get update
apt-get install -y neo4j

# Allow connections to the server admin from the host OS.
sed -i 's/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j/neo4j-server.properties

# Increase concurrent open file limit for neo4j user.
# This will only take effect after an OS reboot.
# Not sure if this worked as the Neo4j daemon was still reporting that the
# max open file connections was still 1024 (the Ubuntu default).
# See:
# http://docs.neo4j.org/chunked/milestone/linux-performance-guide.html#_setting_the_number_of_open_files
echo "neo4j  soft  nofile  40000" >> /etc/security/limits.conf
echo "neo4j  hard  nofile  40000" >> /etc/security/limits.conf
sed -i 's/# session    required   pam_limits.so/session    required   pam_limits.so/' /etc/pam.d/su

service neo4j-service restart
