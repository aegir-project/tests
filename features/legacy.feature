Feature: Legacy Tests
  In order to maintain continuity between legacy tests and behat tests
  As an aegir veteran
  I need to run our legacy tests.

  @api
  Scenario: Run legacy tests.
    Run the command "drush @hostmaster provision-tests-run -y"
    I've commented this out for now because it takes way too long on travis.
    We will remove this legacy file once we have .feature files to replace
    the functionality.

#    Given I run drush "provision-tests-run -y"
#    Then print last drush output
#    Then drush output should contain "success"
