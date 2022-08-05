@user_account
Feature: user login

  In order for a customer to access a protected resource
  As a product manager
  I want only authenticated users to see the protected content

  Background: User navigating to website
    Given The user navigates to "website"

  @issue:KEY-6
  Scenario Outline: User login to com.kosgei.webapp with credentials
    When  The user enters a "<username>" and "<password>"
    Then  The user should be redirected to url "<status>"

    Examples:
      |username|password|status|
      |kosgei  | victor |http://localhost:8080/com.kosgei.webapp/|
      |Kosgei   | Victor |http://localhost:8080/com.kosgei.webapp/signin|
      | Victor  | Kosgei  |http://localhost:8080/com.kosgei.webapp/signin|
      | victor  | kosgei  |http://localhost:8080/com.kosgei.webapp/signin|

  Scenario Outline: User should receive a warning message whenever he or she enters an invalid credentials
      Given The user enters an invalid details "<username>" and "<password>"
      When  user clicks login
      Then  user should see an "<errorMsg>"

    Examples:
      |username|password|errorMsg|
      |victor  | victor |There were errors in your form please try again,invalid username or password|
      |kosgei  | Victor |There were errors in your form please try again,invalid username or password|
      |kosgei  | kosgei |There were errors in your form please try again,invalid username or password|


    Scenario: Verify the user is redirected to signin page if he or she attempts to access any other route except login
      Given the user is not authenticated
      And   the user tries to access any other url which is not the \signin url
      Then  the user should be redirected to signin page


      Scenario: Verify the user is redirected to Dashboard after a successful login
        Given the user has entered a valid <username> and <password>
        And   the user clicks on login button
        Then  the user should be redirected to "dashboard"


    Scenario: Verify the user once on dashboard can see profiles tab
        Given user is on dashboard
        Then  user should be able to see a profile tab
        And   the profile tab should contain notifications, messages and history

    Scenario: Verify the user should see a already sign in message when navigating to signin page
      Given user is already signed in
      When  user navigates to signin page
      Then  user should see already signed in "message"


      Scenario: Verify the user is provided with a create account option
        Given the user does not have an account
        When  the user needs to create account
        Then  the user should see a create account option