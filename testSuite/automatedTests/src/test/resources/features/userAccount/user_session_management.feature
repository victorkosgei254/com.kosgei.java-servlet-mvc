Feature: user session management
  In order to provide more security
  As a product manager
  The following should be done
  1. Use session based authentication
  2. The session should be Http Only
  3. The session should expire after 15 minutes
  4. The session id should be set to _token
  5. The session value should be an auth token
  6. The auth token should not contain user password
  7. The auth token should contain user profile metadata that is
      1. Username
      2. URL to profile


  @manual
  Scenario: There should not be a token if the user is not login
    Given the user has not logged into the website
    When  Cookies are checked for _token
    Then  There should be not token available