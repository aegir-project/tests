# Using Travis for Aegir Testing

There are many git repositories that make up aegir. In order to implement proper CI, we need all of them to trigger test runs.

Using this repository, http://github.com/aegir-project/tests, each repo can use slightly different `.travis.yml` files to run the same suite of tests.

We are working on making this even more streamlined, but for now, see `example.hostmaster.travis.yml` and `example.hosting.travis.yml` for examples on how to add Travis integration into your aegir module.