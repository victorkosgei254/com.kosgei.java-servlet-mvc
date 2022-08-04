package com.kosgei.webapp.services;

public class AuthenticationService {

	private String username = "kosgei";
	private String password = "victor";
	
	public boolean authenticate(String client_username, String client_password) {
		
		if(!(client_username.equals(username) && client_password.equals(password)))
			return false;
		return true;
	}
}
