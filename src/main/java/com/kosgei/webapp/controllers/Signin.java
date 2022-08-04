package com.kosgei.webapp.controllers;

import javax.servlet.http.HttpServletResponse;

import com.kosgei.webapp.services.AuthenticationService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


public class Signin extends HttpServlet{
	AuthenticationService authService = new AuthenticationService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/views/signin.jsp").forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(!(authService.authenticate(username, password))) {
			request.setAttribute("tryAgain", "There were errors in your form please try again");
			request.setAttribute("errUsername", "Invalid password or username");
			request.setAttribute("errPassword", "Invalid password or username");
			request.getRequestDispatcher("WEB-INF/views/signin.jsp").forward(request, response);
		}
		Cookie authCookie = new Cookie("_token", "12345");
		authCookie.setHttpOnly(true);
		response.addCookie(authCookie);
		request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
	}

}
