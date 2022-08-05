Feature: user registration
  In order for Users to checkout, get notifications and to manage their subscription
  as a product manager
  I want users to have their own account

  Background: User navigating to sign up url
    Given the user is on the signup page

  Scenario Outline: Verify the data collected for a user account
    Then the user should be prompted to enter <field> of <type> with <validation> <isOptional>

    Examples:
      |field|type|validation|isOptional|
      |username|text|none   |true      |
      |email   |email|required|false|
      |password1|password|required|false|
      |password2|password|required|false|
      |terms and conditions | checkbox|none|false|



  Scenario Outline: Email verification for existing email
    Given user provides an email addressed used by already existing account
    When  user performs sign up
    Then  user should receive a <msgType> with <msgInfo>
    Examples:
      |msgType|msgInfo|
      |warning|The email is already registered|
      |info   |Seems you already have an account, sign in instead,signin link|


  Scenario: Verify the user cannot signup when the required fields are not filled
    Given the user has skipped any required field
    When  the users performs a signup
    Then  the signup should fail, an error message should be displayed on top of the skipped required field

  Scenario Outline: Verify user email validation checks
    Given the user has entered an <invalidEmail>
    When the user performs sign up
    Then the sign up should fail
    And  the user should receive an error message
    Examples:
    |invalidEmail|
    |someone     |
    |someone@    |
    |someone@example|
    |@example       |
    |@example.com   |
    |.com           |
    |someone.com    |


    Scenario: Verify when the user should see terms and conditions
      When the user clicks on read terms and conditions
      Then a pop up dialog should appear with the terms and conditions statement
