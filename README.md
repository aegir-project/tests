# Aegir Testing

## Behat tests for Aegir.

This repo contains tools and scripts that are used for testing the Aegir hosting system.

For more information on Aegir, visit [aegirproject.org](http://aegirproject.org)

## Repositories

There are a large number of repositories that make up Aegir.  This repo is an effort to standardize the testing process across all of them.

The test status of each repository is listed below.  <em>This does not reflect the stability of the projects. The tests and testing infrastructure are still in development.</em>


| Project   | Description | Links | Status |
|-----------|------------ |-------------------|--------|
| Provision | Drush commands | [drupal.org/project/provision](https://www.drupal.org/project/provision) <br /> [github.com/aegir-project/provision](https://github.com/aegir-project/provision) <br /> [gitlab.com/aegir/provision](https://gitlab.com/aegir/provision) | [![Build Status](https://travis-ci.org/aegir-project/provision.svg?branch=7.x-3.x)](https://travis-ci.org/aegir-project/provision) <br /> [![build status](https://gitlab.com/aegir/provision/badges/7.x-3.x/build.svg)](https://gitlab.com/aegir/provision/commits/7.x-3.x) |
| Hosting | Drupal Modules| [drupal.org/project/hosting](https://www.drupal.org/project/hosting) <br /> [github.com/aegir-project/hosting](https://github.com/aegir-project/hosting) | [![Build Status](https://travis-ci.org/aegir-project/hosting.svg?branch=7.x-3.x)](https://travis-ci.org/aegir-project/hosting) |
| Hostmaster | Drupal Install Profile |[drupal.org/project/hostmaster](https://www.drupal.org/project/hostmaster) <br /> [github.com/aegir-project/hostmaster](https://github.com/aegir-project/hostmaster) | [![Build Status](https://travis-ci.org/aegir-project/hostmaster.svg?branch=7.x-3.x)](https://travis-ci.org/aegir-project/hostmaster) |
| Dockerfiles | Docker image definitions. Used for all tests. | [github.com/aegir-project/dockerfiles](https://github.com/aegir-project/dockerfiles) | [![Build Status](https://travis-ci.org/aegir-project/dockerfiles.svg?branch=master)](https://travis-ci.org/aegir-project/dockerfiles) |
| Tests | Behat tests and Travis tools | [github.com/aegir-project/tests](https://github.com/aegir-project/tests) | [![Build Status](https://travis-ci.org/aegir-project/tests.svg?branch=master)](https://travis-ci.org/aegir-project/tests) |
| Development Environment | Local docker-based development environment. | [github.com/aegir-project/development](https://github.com/aegir-project/development) | [![Build Status](https://travis-ci.org/aegir-project/development.svg?branch=master)](https://travis-ci.org/aegir-project/development) |


## Travis

Test runs currently happen on Travis-ci.org (custom install and Behat) and GitLab CI (Debian packages).

You can see an overview of all Travis projects at [travis-ci.org/aegir-project](https://travis-ci.org/aegir-project).

An over view of tests on GitLab can be found on [their pipelines page](https://gitlab.com/aegir/provision/pipelines)
