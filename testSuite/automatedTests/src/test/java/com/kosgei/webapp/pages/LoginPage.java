package com.kosgei.webapp.pages;

import net.serenitybdd.core.pages.PageObject;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebDriver;


@DefaultUrl("http://localhost:8080/com.kosgei.webapp/signin")
public class LoginPage extends PageObject {
    WebDriver driver = getDriver();

    public void enterUsername(String username){
        $("//input[@name='username']").sendKeys(username);

    }

    public void enterPassword(String password){
        $("//input[@name='password']").sendKeys(password);

    }

    public void clickLogin(){
        $("//input[@name='submit']").click();

    }

    public String checkLoginStatus(){

        String url = driver.getCurrentUrl();
        return url;
    }
}
