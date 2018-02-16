#!/bin/bash

# Run this script in your .travis.yml file to upgrade docker.
# Docker is now 1.12.0 by default on Travis.
# DOCKER_VERSION=1.12.0-0~trusty
DOCKER_COMPOSE_VERSION=1.16.1

# Use this to get list of versions
# apt-cache madison docker-engine
#
#apt-get -o Dpkg::Options::="--force-confnew" install -y docker-engine=${DOCKER_VERSION} -qq

# reinstall docker-compose at specific version
rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin

# Output versions
docker --version
docker-compose --version
