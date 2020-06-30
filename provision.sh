#!/bin/sh
UBUNTU_VERSION=`lsb_release -cs`
NODEJS_VERSION=node_10.x
#DISTRO=linux-x64
MONGO_VER=4.0.5

# Adding Repo of MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $UBUNTU_VERSION/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Adding Repo of NodeJS
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
echo "deb https://deb.nodesource.com/$NODEJS_VERSION $UBUNTU_VERSION main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$NODEJS_VERSION $UBUNTU_VERSION main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list


# Installing everything
apt-get update
apt-get install -y git
apt-get install -y build-essential
apt-get install -y nodejs
apt-get install -y mongodb-org=$MONGO_VER mongodb-org-server=$MONGO_VER mongodb-org-shell=$MONGO_VER mongodb-org-mongos=$MONGO_VER mongodb-org-tools=$MONGO_VER
apt-get install -y mysql-server

# Securing MySQL
apt-get install -y expect
// Not required in actual script
MYSQL_ROOT_PASSWORD=abcd1234

SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

apt-get remove -y expect

