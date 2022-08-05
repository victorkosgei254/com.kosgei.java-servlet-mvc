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

    @Then("The user should {string}")
    public void checkIfUserLoggedIn(String status){
        loginPage.clickLogin();
        String results = loginPage.checkLoginStatus();
        Assert.assertTrue(status.equals(results));
    }

}
