Feature: user account update
  I want to be able to edit my account details as I please
  as a customer
  I want an option to edit my profile

  Background:
    Given the a user is authenticated
    And   the user is on profile tab

  Scenario: Password update
    When the user clicks on update password
    Then A pop up dialog should appear to ask the user to enter current password,new password and confirm password

  Scenario Outline: Password update, change of password should fail when user does not provide valid current password
    When the user enters an invalid current password
    Then the password update should fail
    And  the user should receive an error <message>

      Examples:
      |message|
      |Invalid password, please try again|


  Scenario Outline: Password update should fail if password1 and password2 doesn't match
    Given the user is on update password
    When  the user enters <password1> and <password2>
    And   the user perform password update
    Then  the password update should give  <status>

    Examples:
    |password1|password2|status|
    |onetwoThree|oneTwoThree|fail|
    |onetwothree|onetwothree|pass|


  Scenario Outline: Verify the user can log in with the updated password, the old password should not work
    Given the user has updated account password
    And   the user has logged out
    When  the user logs in with the <updatedPassword>
    Then  the user should be <status> signed in

    Examples:
    |updatedPassword|status|
    |onetwothree    |success|
    |oneTwoThree    |fail   |

  Scenario: Verify the user can update the username
    Given the user is on account update
    When  the user clicks on update username
    Then  the username input field should become editable

    Scenario Outline: Verify that when the user leaves username blank, the original username is retained
      Given the user is on update username with username <currentUsername>
      When  the username puts <username>
      And   clicks on update username
      Then  then the username should becom <updatedUsername>

      Examples:
      |currentUsername|username|updatedUsername|
      |kosgei         |Kosgei  |Kosgei         |
      |kosgei         |        |kosgei         |
      |kosgei         |Victor  |Victor         |

      Scenario Outline: Verify the user can log in with the updated username
        Given the user has updated the username
        When  the user logs in with the updated <username>
        And   <password>
        Then  the user should <status> signed in

        Examples:
        |username|password|status|
        |Victor  |onetwothree|successfully|
        |kosgei  |onetwothree|unsuccessful|

  @manual
  Scenario: User profile picture update
    Given the user is on profile tab
    And   the user clicks on edit profile picture
    Then  the user is prompted to select a file from the file system

  @manual
  Scenario Outline: Verify the user can only upload *.png,*.jpg and *.jpeg files
    Given the user has selected a <filetype> from the file system
    And   the user clicks update profile picture
    Then  the user profile picture should <profilePictureStatus> and the user should receive <errMsg>

    Examples:
    |filetype|profilePictureStatus|errMsg|
    |profile.jpg|success          |none  |
    |profile.png|success          |none  |
    |profile.jpeg|success         |none  |
    |profile.gif |fail            |*.png,*.jpeg,*.jpg files only|
    |profile.pdf |fail            |*.png,*.jpeg,*.jpg files only|


    @manual
    Scenario: Verify that the profile picture uploaded is the one displayed
      Given the user has successfully uploaded a profile picture
      When  the user views the profile picture
      Then  the latest uploaded profile picture should be displayed



  Scenario Outline: Verify that the user can delete his or her account
    Given the user is on profiles tab
    When  user clicks delete my account
    Then  the user is prompted with a pop up dialog  <prompt> and a reason text area
    Examples:
      | prompt |
      |Enter your password to delete your account|

    Scenario Outline: Verify that once a user has deleted account, he or she cannot login to that account until registration
      Given that a user has deleted <accountUsername> <accountPassword>
      When  the user tries to log in
      Then  the user should receive a <msg>

      Examples:
        |accountUsername|accountPassword|msg|
        |kosgei         |onetwothree    |Username or password does not exist|

      Scenario: Verify that once a user has deleted account he or she is re-directed to signin page
        Given that the user wants to delete an account
        When  the user clicks on delete this account
        Then  the account is deleted and user is re-directed to homepage


      @manual
      Scenario: Verify that once a user has deleted account his or her session is cleared
        Given that the user has successfully deleted an account
        Then  the user session should be cleared simultaneously

