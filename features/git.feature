Feature: Hosting Git
  In order to easily deploy sites from git repos
  As an aegir user
  I need to enable and configure the hosting git module.

  @api
  Scenario: Enable and configure Hosting Git module.
    Given I am logged in as a user with the "administrator" role
#    And I am at "admin/hosting"
#    Then I check the box "Git integration"
#    And I press "Save configuration"
#    Then I should see "The configuration options have been saved."
#
#    Then I run drush "hosting-tasks --force --fork=0 --strict=0"

    Given I am at "admin/hosting/git"
    Then I should see "Git Hooks"
    And I should see "Allow deploying sites from git repositories."
    And I should see "Allow deploying platforms from git repositories."

    When I uncheck the box "Allow deploying sites from git repositories."
    When I uncheck the box "Allow deploying platforms from git repositories."

    When I uncheck the box "Allow platforms to have configurable git hooks."
    When I uncheck the box "Allow sites to have configurable git hooks."

    And I check the box "Run database updates"
    And I check the box "Flush all caches"
    And I check the box "Rebuild Registry"

    Then I press "Save configuration"
    Then I should see "The configuration options have been saved."

    Given I am on "node/add/platform"
    Then I should not see "Deploy from Git"
    Then I should not see "Git Hooks"
    And I should not see "Git Pull Method"

    Given I am on "node/add/site"
    Then I should not see "Deploy from Git"
    Then I should not see "Git Hooks"
    And I should not see "Git Pull Method"

    Given I am at "admin/hosting/git"
    Then I should see "Git Hooks"
    And I should see "Allow deploying sites from git repositories."
    And I should see "Allow deploying platforms from git repositories."

    When I check the box "Allow deploying sites from git repositories."
    When I check the box "Allow deploying platforms from git repositories."

    When I check the box "Allow platforms to have configurable git hooks."
    When I check the box "Allow sites to have configurable git hooks."
    Then I press "Save configuration"
    Then I should see "The configuration options have been saved."

    # CREATE PLATFORM
    Given I am on "node/add/platform"
    Then I should see "Deploy from Git"
    Then I should see "Git Hooks"

    And the "Run database updates" checkbox should be checked
    And the "Flush all caches" checkbox should be checked
    And the "Rebuild Registry" checkbox should be checked

    And I should see "Git Pull Method"

    When I fill in "Repository URL" with "https://github.com/aegir-project/example-drupal.git"
    And I fill in "Name" with "example-drupal"
    And I fill in "edit-publish-path" with "example-drupal"
    And I select the radio button with the label "Automatic Git Pull"

    Then I press "Save"
    And print current URL
    Then I should see "Verified never"
    Then I run drush "hosting-tasks --force --fork=0 --strict=0"
    Then I reload the page
    Then I should not see "Verified never"
    And I should see "Verify Platform" in the ".hosting-success" element
    And I should see "Git reference master"
    And I should see "Git URL https://github.com/aegir-project/example-drupal.git"
    And I should see "Git repository path /var/aegir/platforms/example-drupal"
    And I should not see "Git repository docroot"

    # EDIT PLATFORM
    When I click "Edit"
    And I uncheck the box "Run database updates"
    And I uncheck the box "Flush all caches"
    And I uncheck the box "Rebuild Registry"
    And I press "Save"
    Then I run drush "hosting-tasks --force --fork=0 --strict=0"
    Then I reload the page
    And I should see "Git reference master"
    And I should see "Git URL https://github.com/aegir-project/example-drupal.git"
    And I should see "Git repository path /var/aegir/platforms/example-drupal"
    And I should not see "Git repository docroot"

    # CREATE composer PLATFORM
    Given I am on "node/add/platform"
    Then I should see "Deploy from Git"
    Then I should see "Git Hooks"

    When I fill in "Repository URL" with "https://github.com/aegir-project/example-drupal-composer.git"
    And I fill in "Name" with "drupalcomposer"
    And I fill in "Repository docroot" with "web"
    And I fill in "edit-publish-path" with "drupalcomposer"

    Then I press "Save"
    And print current URL
    Then I run drush "hosting-tasks --force --fork=0 --strict=0"
    Then I reload the page
    Then break
    Then I should not see "Verified never"
    And I should see "Verify Platform" in the ".hosting-success" element
    And I should see "Git reference master"
    And I should see "Git URL https://github.com/aegir-project/example-drupal-composer.git"
    And I should see "Git repository path /var/aegir/platforms/drupalcomposer"
    And I should see "Git repository docroot web"

    # EDIT composer PLATFORM
    When I click "Edit"
    And I press "Save"
    Then I should not see "Git repository path /var/aegir/platforms/drupalcomposer/web"
    Then I run drush "hosting-tasks --force --fork=0 --strict=0"
    Then I reload the page
    And I should see "Git reference master"
    And I should see "Git URL https://github.com/aegir-project/example-drupal-composer.git"
    And I should see "Git repository docroot web"

    # Add site
    Given I am on "node/add/site"
    Then I should see "Deploy from Git"
    Then I should see "Git Hooks"

    And the "Run database updates" checkbox should be checked
    And the "Flush all caches" checkbox should be checked
    And the "Rebuild Registry" checkbox should be checked
