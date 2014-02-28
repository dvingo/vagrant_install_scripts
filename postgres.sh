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

# Allow local login with no password.
sudo sed -i 's/^local\s\+all\s\+all\s\+peer/local    all         all        trust/' $config_file

# Restart the server.
sudo /etc/init.d/postgresql restart
