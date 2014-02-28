#!/bin/bash -

apt-get install -y postgresql postgresql-client libpq-dev

# Create a non-priveleged database user.
user_name=db_user
sudo -u postgres createuser --echo --no-createdb --no-createrole --no-superuser $user_name

# Create a database with UTF8 encoding.
db_name=the_db_name
db_username=$user_name
create_db_string=$(cat <<EOF
CREATE DATABASE "$db_name" WITH
    OWNER = "$db_username"
    ENCODING = 'UTF-8'
    LC_CTYPE = 'en_US.utf8'
    LC_COLLATE = 'en_US.utf8'
    TEMPLATE template0;
EOF
)
sudo -u postgres psql -c "$create_db_string"

config_file=/etc/postgresql/9.1/main/pg_hba.conf

# Allow local login with no password.
sudo sed -i 's/^local\s\+all\s\+all\s\+peer/local    all         all        trust/' $config_file

# Allow connections over TCP/IP sockets
sed -i 's/^host\s\+all\s\+all\s\+127.0.0.1\/32\s\+md5/host    all             all             127.0.0.1\/32            trust/' $config_file
sed -i 's/^host\s\+all\s\+all\s\+::1\/128\s\+md5/host    all             all             ::1\/128                 trust/' $config_file

# Restart the server.
/etc/init.d/postgresql restart
