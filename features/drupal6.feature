Feature: Host Drupal 6


  @api
  Scenario: Create a Drupal 6 Site
    1. Create a drupal6 platform.
    2. Create a drupal6 site.
    3. Create a drupal7 platform.
    4. Migrate the site to the drupal7 platform.

    Given I am logged in as a user with the "administrator" role
    And I click "Platforms"
    Then I click "Add platform"

    Given I fill in "Name" with "drupal6platform"
    And I fill in "Makefile" with "http://cgit.drupalcode.org/provision/plain/provision-tests/makes/drupal6.make"
    And I fill in "Publish path" with "d6"
    When I press "Save"
    Then I should see "Verify task has been queued for platform drupal6platform. It will be available once the task is completed."
    And I should see "Platform drupal6platform has been created."
    And I should see "/var/aegir/platforms/d6"
    And I should see "drupal6platform"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    When I click "Add site"
    Then I should see "Create Site"

    When I fill in "Domain name" with "drupal6.local.computer"
    And I select the radio button "drupal6platform"
    Then I press "Save"
    And I should see "Site drupal6.local.computer has been created."
    And I should see "drupal6.local.computer"
    And I should see "Install"
    And I should see "Queued"
    And I should see the link "drupal6platform"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    And I should see "Enabled"

    Given I click "Log in to drupal6.local.computer"
    Then I should see "You have just used your one-time login link. It is no longer necessary to use this link to login. Please change your password."
    And I should see the link "drupal6.local.computer"

    # Setup Drupal 7 platform
    Given I am on the homepage
    And I click "Platforms"
    Then I click "Add platform"

    Given I fill in "Name" with "drupal7platform"
    And I fill in "Makefile" with "http://cgit.drupalcode.org/provision/plain/provision-tests/makes/drupal7.make"
    And I fill in "Publish path" with "d7"
    When I press "Save"
    Then I should see "Verify task has been queued for platform drupal7platform. It will be available once the task is completed."
    And I should see "Platform drupal7platform has been created."
    And I should see "/var/aegir/platforms/d7"
    And I should see "drupal7platform"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    Then I should see "Enabled"

    Then I click "Sites"
    And I click "drupal6.local.computer"

    # Enable site migration module
    Given I run drush "en hosting_migrate -y"
    Then print last drush output
    Then I reload the page
    Then I click "Move the site to a new platform."
    Then I select the radio button with the label "drupal7platform"

    Then I press "Migrate"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    And I click "drupal7platform"
    Then I should see "Sites installed on this platform"
    And I should see "drupal6.local.computer"

    When I click "drupal6.local.computer"
    When I click "Generate a one-time login reset url for this site."
    And I run drush "hosting-tasks -y"
    Then print last drush output
    Then I reload the page

    Given I click "Log in to drupal6.local.computer"
    # The drupal 7 message!
    Then I should see "You have just used your one-time login link. It is no longer necessary to use this link to log in. Please change your password."

    Given I click "Administration"
    Then I click "Reports"
    Then I click "Status report"
    Then I click "Status report"
    Then I should see "7.51"
