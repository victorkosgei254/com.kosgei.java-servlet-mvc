package com.kosgei.webapp.pageSteps;

import com.kosgei.webapp.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class LoginPageSteps {

    private LoginPage loginPage;
    @Given("The user navigates to {string}")
    public void userNavigatersToWebsite(String website){
        loginPage.open();
    }
    @When("The user enters a {string} and {string}")
    public void userEntersUsernameAndPassword(String username,String password){
        loginPage.enterUsername(username);
        loginPage.enterPassword(password);
    }

    @Then("The user should be redirected to url {string}")
    public void checkIfUserLoggedIn(String status){
        loginPage.clickLogin();
        String results = loginPage.checkLoginStatus();
        Assert.assertTrue(status.equals(results));
    }

    @Given("The user enters an invalid details {string} and {string}")
    public void the_user_enters_an_invalid_details_and(String username, String password) {
        // Write code here that turns the phrase above into concrete actions
        loginPage.enterUsername(username);
        loginPage.enterPassword(password);
    }
    @When("user clicks login")
    public void user_clicks_login() {
        loginPage.clickLogin();
    }
    @Then("user should see an {string}")
    public void user_should_see_an(String err) {
        String errMsg = loginPage.checkForErrorMsgs();
        Assert.assertTrue(err.equals(errMsg));
    }

    @Given("the user is not authenticated")
    public void the_user_is_not_authenticated() {
        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
    }
    @Given("the user tries to access any  {string} which is not signinurl")
    public void the_user_tries_to_access_any_which_is_not_signinurl(String string) {
        loginPage.navigateToUrl(string);
    }
    @Then("the user should be redirected to {string} page")
    public void the_user_should_be_redirected_to_page(String string) {
        String currentUrl = loginPage.getCurrentUrl();
        System.out.println(currentUrl);
        Assert.assertTrue("Expected "+string+" Current Url "+currentUrl,currentUrl.equals(string));
    }

}
