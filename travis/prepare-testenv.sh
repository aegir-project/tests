#!/bin/sh

# This file is called from the .travis.yml file in the provision, hosting and hostmaster projects.

sudo mkdir ../vendor
sudo chmod 777 ../vendor

sudo mkdir ../bin
sudo chmod 777 ../bin

# Get aegir/hostmaster and database images.
sudo docker pull aegir/hostmaster
sudo docker pull mariadb
