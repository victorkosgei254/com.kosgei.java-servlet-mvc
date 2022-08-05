## com.kosgei.java-servlet-mvc requirements

|Role|name|Contact|
|---|---|---|
|QA Lead| Kosgei Victor Kupruto|victorkosgei254@gmail.com|
|Lead Engineer| Kosgei Victor Kipruto|victorkosgei254@gmail.com|
|Product Owner| Kosgei Victor|victorkosgei254@gmail.com|


**Project Timeline** 

* Project launch 4th August 2022 
* Phase One 
  * Scope : 
    * User accounts 
    * Marketplace
* Phase Two 


**Project Vision**
> Increase sales by setting an online store where customers can order products and get them delivered to their locations.



## Business Requirements 
<hr/>

**Table of Contents**

[User Accounts](#User Accounts Managament)



### User Accounts Managament

  For a customer to be notified whenever there is a new product, discounts and offers the 
  the customer needs to have a user account. 
  * Users can create their account online 
  * During account creation the following are required 
    * Username 
    * User email
    * Strong password (check creteria for a strong password)
  *The password field is case sensitive 
  * There should be no duplicate emails 
  * The username is case insensitive 
  * A user can use a username or email to sign in to the account 
  * A user can be able to view marketplace without signin 
  * The user session should be set to time out at 15 minutes 
  * There can be only one session per user. 


**User Journey User account login**

<u>Pre-Conditions</u>

User has already registered account 

Steps 

1. User navigates to website 
2. User clicks on signin button 
3. The user is directed to login page 
4. The user should see a login form with username or email field, password field , a button to sign in  and a link to reset password 
5. User enters username and password, clicks login 
6. For a successful login the user is redirected to Dashboard
7. User should see Market place, user account history,  notifications and messages 

For invalid password or username or email

1. Incase user enters an invalid password,email or username
   1. An error message should appear on top of the form, and all input fields 
   2. Top error message should read `Signin Failed, please try again`
   3. Error message on top of input fields should read `Invalid username or password`

Check to see if user account tab is visible, username is displayed.


**User Edit Profile Journey**

