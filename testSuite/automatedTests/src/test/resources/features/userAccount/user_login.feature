Feature: user login

  In order for a customer to access a protected resource
  As a product manager
  I want only authenticated users to see the protected content

  Background: User navigating to websit
    Given The user navigates to "website"

  Scenario Outline: User login to com.kosgei.webapp with credentials
    When  The user enters a <username> and <password>
    Then  The user should <status>

    Examples:
      |username|password|status|
      |kosgei  | victor | true |
      |Kosgei   | Victor | false |
      | Victor  | Kosgei  | false |
      | victor  | kosgei  | false|

  Scenario: User should receive a warning message whenever he or she enters an invalid credentials
      Given The user enters an invalid "username"
      When  user clicks login
      Then  user should see an "usernameErrorMessage","passwordMessage" and "errorMessage"

    Scenario: Verify the user is redirected to Signin page if he or she attemps to access any other route except login
      Given the user is not authenticated
      And   the user tries to access any other url which is not the \signin url
      Then  the user should be redirected to signin page


