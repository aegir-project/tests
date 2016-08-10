#!/bin/bash

# Run this script in your .travis.yml file to upgrade docker.

DOCKER_VERSION=1.12.0-0~trusty
DOCKER_COMPOSE_VERSION=1.8.0

# Use this to get list of versions
# apt-cache madison docker-engine

apt-get -o Dpkg::Options::="--force-confnew" install -y docker-engine=${DOCKER_VERSION} -qq

# reinstall docker-compose at specific version
rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin
docker --version
docker-compose --version

# Prepare local docker container
# @TODO: This is really a pain. Travis is always 1000, standard for ubuntu.
#   I can build a local container locally with the Dockerfile-local, but it's not working on travis.
#   So instead, I created a docker aegir/hostmaster:local image on docker hub.
#USER_UID=`id -u travis`
#echo "Preparing local aegir container for UID $USER_UID"

# Get Dockerfile
# wget https://raw.githubusercontent.com/aegir-project/dockerfiles/master/Dockerfile-local

# Run Docker build
# docker build --build-arg AEGIR_UID=1000 -t aegir/hostmaster:local -f Dockerfile-local .
