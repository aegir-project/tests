#!/bin/bash

set -e

# Returns true once mysql can connect.
# Thanks to http://askubuntu.com/questions/697798/shell-script-how-to-run-script-after-mysql-is-ready
hostmaster_ready() {
    drush @hostmaster vget site_name > /dev/null 2>&1
}

while !(hostmaster_ready)
do
   sleep 3
   echo "waiting for hostmaster ..."
done

echo "Hostmaster Ready!"

# Run some tests.
echo "Preparing tests..."

if [[ -w /var/aegir/tests ]];
  cd /var/aegir/tests
then
  cp -rf /var/aegir/tests /var/aegir/tests-writable
  cd /var/aegir/tests-writable
fi

composer update
composer install
# We save this for .travis.yml so that it will properly fail a CI run.
# bin/behat