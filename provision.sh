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
