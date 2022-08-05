@user_account
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

    Scenario: Verify that after successful login the customer authentication is persisted in a session
      Given the user is authenticated and is at Dashboard
      When  the user refreshes the website before elapse of 15 minutes
      Then  the user should be able to see the current page he or she was in. (no-redirects to signin)

    @security @backend
    Scenario: Verify the session cookie is HttpOnly
      Given the user is authenticated
      Then  When using JavaScript to obtain sessions,the cookie _token should not be visible

    @manual @security
    Scenario: Verify the session cookie is HttpOnly-Manual
      Given the user is authenticated
      Then  using Postman, the cookie HttpOnly is to be true

    @manual @security
    Scenario: Verify the session cookie has a max age of 15 minutes
      Given the user is authenticated
      When  the session active time is more than 15 minutes
      And   the user tries to navigate or refreshes
      Then  the user should be redirected to the signin page


    @backend @security
    Scenario Outline: Verify the session contains a authentication token
      Given the user is successfully authenticated
      Then  the backend should set a <cookie name> having a <cookie value>
      Examples:
        |cookie name|cookie value|
        |_token     |encrypted token |

    @backend @security
    Scenario: Verify the authentication token is secure (signed)
      Given the user is successfully authenticated
      And   the backend has set a token
      Then  the set token should have header, payload and signature

    @backend @security
    Scenario: Verify the authentication token does not contain user password
      Given a token is generated
      Then  the payload section should not include user password

    Scenario: Verify that after successful login customer profile information is persisted in a session cookie
        Given the user is successfully authenticated
        When a js query is executed to fetch profile cookie
        Then the results should not be null

    Scenario Outline: Verify that the profile session cookie is not HttpOnly
      Given the user is authenticated
      When  a js query is executed to fetch
      |header|value|
      |cookie name|<cookie_name>|
      |cookie value|<cookie_value>|
      Then the values should not be null

      Examples:
      |cookie_name|cookie_value|
      |usr_profile|{username,victor;profileUrl,/user?eAsdkncdsewds/profile.png;user_email,victorkosgei254@gmail.com} |
      |wish_list  |{itemone,url;item 2;url;item3,url}                                                                |

    Scenario Outline: Verify that profile session contains the required fields
      Given a user is successfully authenticated
      When the backend generates a profile cookie
      Then the cookie should contain
      |header |value|
      |username|<username>|
      |userprofile_url|<profileUrl>|
      |user_email     |<user_email>|

      Examples:
      |username|profileUrl|user_email|
      |kosgei  |/user?eAsdkncdsewds/profile.png|victorkosgei254@gmail.com|



