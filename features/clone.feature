Feature: Clone a website.


  @api
  Scenario: Clone a Drupal site.
    1. Create a drupal7 platform.
    2. Create a second drupal7 platform
    3. Clone the drupal7 site from one platform to another.

    TODO: make a scenario for creating clones able to select from the platform.
    TODO: 4. Clone the drupal7 site to the same platform.
    TODO: 5. Clone the drupal7 site to a newer platform with updates.
    TODO: 6. Attempt to Clone the drupal7 site to an older platform with backwards versions: ensure it's not possible.

    Given I am logged in as a user with the "administrator" role
    And I click "Platforms"
    Then I click "Add platform"

    Given I fill in "Name" with "clonetestplatforma"
    And I fill in "Makefile" with "http://cgit.drupalcode.org/provision/plain/provision-tests/makes/drupal7.make"
    And I fill in "Publish path" with "clonetestplatforma"
    When I press "Save"
    Then I should see "Verify task has been queued for platform clonetestplatforma. It will be available once the task is completed."
    And I should see "Platform clonetestplatforma has been created."
    And I should see "/var/aegir/platforms/clonetestplatforma"
    And I should see "clonetestplatforma"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    When I click "Add site"
    Then I should see "Create Site"

    When I fill in "Domain name" with "clonetestsite.local.computer"
    And I select the radio button "clonetestplatforma"
    Then I press "Save"
    Then print last response
    And I should see "Site clonetestsite.local.computer has been created."
    And I should see "clonetestsite.local.computer"
    And I should see "Install"
    And I should see "Queued"
    And I should see the link "clonetestplatforma"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    And I should see "Enabled"

    Given I click "Log in to clonetestsite.local.computer"
    Then I should see "You have just used your one-time login link. It is no longer necessary to use this link to login. Please change your password."
    And I should see the link "clonetestsite.local.computer"

    # Setup second Drupal 7 platform
    Given I am on the homepage
    And I click "Platforms"
    Then I click "Add platform"

    Given I fill in "Name" with "clonetestplatformb"
    And I fill in "Makefile" with "http://cgit.drupalcode.org/provision/plain/provision-tests/makes/drupal7.make"
    And I fill in "Publish path" with "clonetestplatformb"
    When I press "Save"
    Then I should see "Verify task has been queued for platform clonetestplatformb. It will be available once the task is completed."
    And I should see "Platform clonetestplatformb has been created."
    And I should see "/var/aegir/platforms/d7"
    And I should see "clonetestplatformb"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    Then I should see "Enabled"

    Then I click "Sites"
    And I click "clonetestsite.local.computer"

    # Enable clone module and Clone the site
    Given I run drush "en hosting_clone -y"
    Then print last drush output
    Then I reload the page
    Then I click "Make a copy of the site."
    Then I select the radio button with the label "clonetestplatformb"
    And fill in "clonetestclonedsite.local.computer" for "Domain name"

    Then I press "Clone"

    When I run drush "hosting-tasks -v"
    Then print last drush output
    Then I reload the page
    And I click "clonetestplatformb"
    Then I should see "Sites installed on this platform"
    And I should see "clonetestclonedsite.local.computer"

    When I click "clonetestclonedsite.local.computer"
    When I click "Generate a one-time login reset url for this site."
    And I run drush "hosting-tasks -y"
    Then print last drush output
    Then I reload the page

    Given I click "Log in to clonetestclonedsite.local.computer"
    # The drupal 7 message!
    Then I should see "You have just used your one-time login link. It is no longer necessary to use this link to log in. Please change your password."

    Given I click "Administration"
    Then I click "Reports"
    Then I click "Status report"
    Then I click "Status report"
    Then I should see "7.50"
