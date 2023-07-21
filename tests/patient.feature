@patient
Feature: Patient
  In order to manage the patient records
  As a user
  I would like add,remove, edit patient details


#  Scenario: Add Valid Patient
#    Given I have browser with OpenEMR application
#    When I enter username as "admin"
#    And I enter password as "pass"
#    And I select language as "English (Indian)"
#    And I click on login
#    And I click on patient menu
#    And I click on New/Search
#    And I fill the patient details form
#      | firstname | lastname | gender | dob        |
#      | john      | wick     | Male   | 2023-07-21 |
#    And I click on create new patient
#    And I click on confirm create new patient
#    And I handle the alert box
#    And I close happy birthday pop if available
#    Then I should get the added patient name as "Medical Record Dashboard - john wick"

    Scenario Outline: Add Valid Patient
    Given I have browser with OpenEMR application
    When I enter username as "<username>"
    And I enter password as "<password>"
    And I select language as "<language>"
    And I click on login
    And I click on patient menu
    And I click on New/Search
    And I fill the patient details form
      | firstname | lastname | gender   | dob   |
      | <fname>   | <lname>  | <gender> | <dob> |
      And I click on create new patient
    And I click on confirm create new patient
    And I handle the alert box
    And I close happy birthday pop if available
    Then I should get the added patient name as "Medical Record Dashboard - john wick"
      Examples:
        | username | password | language         | fname | lname | gender | dob        |
        | admin    | pass     | English (Indian) | jack  | wen   | Male   | 2023-07-21 |
        | admin    | pass     | English (Indian) | peter | wen   | Female | 2023-07-21 |