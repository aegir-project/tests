Feature: Aegir UI
  In order to easily manage my server
  As an aegir user
  I need an awesome web UI

  @api
  Scenario: Log in and poke around.
    Given I am on the homepage
    Then I should see "Access denied. You must log in to view this page."
    # When I run drush "@hostmaster hosting-tasks"
    Then I am logged in as a user with the "administrator" role
    And I am on the homepage
    And I should see "aegir.local.computer"
    Then I should see "Sites"
    When I click "aegir.local.computer"
    Then I should see "Enabled"

    # Confirm all tasks verified.
    When I click "Tasks"
    Then I should not see a ".hosting-error" element
# @TODO: We are throwing warnings on migrate to 7.50 because we
#    Then I should not see a ".hosting-warning" element

    # Platforms Page
    When I click "Platforms"
    Then I should see "hostmaster"
    Then I should see "drupal"
    Then I should see "aegir.local.computer"

    # Platforms table
    Then I should see "Platform"
    Then I should see "Release"
    Then I should see "Server"
    Then I should see "Verified"
    Then I should see "Sites"

