Feature: Legacy Tests
  In order to maintain continuity between legacy tests and behat tests
  As an aegir veteran
  I need to run our legacy tests.

  @api
  Scenario: Run legacy tests.
    Run the command "drush @hostmaster provision-tests-run -y"
    Given I run drush "provision-tests-run -y"
    Then print last drush output
    Then drush output should contain "success"
