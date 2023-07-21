@login
Feature: Login
  In order to manage the patient records
  As a user
  I would like access the portal

  Background:
    Given I have browser with OpenEMR application

#  Scenario: Valid Login
#    Given I have browser with OpenEMR application
#    When I enter username as "admin"
#    And I enter password as "pass"
#    And I select language as "English (Indian)"
#    And I click on login
#    Then I should get access to portal with "OpenEMR" title

    @invalid
  Scenario: Invalid Login
    When I enter username as "admin1"
    And I enter password as "pass2"
    And I select language as "English (Indian)"
    And I click on login
    Then I should not get access to portal with "Invalid username or password" error

    @valid  @smoke
  Scenario Outline: Valid Login
    When I enter username as "<username>"
    And I enter password as "<password>"
    And I select language as "<language>"
    And I click on login
    Then I should get access to portal with "OpenEMR" title
    Examples:
      | username  | password  | language         |
      | admin     | pass      | English (Indian) |
      | physician | physician | English (Indian) |
