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
			request.setAttribute("errorMsg", "There were errors in your form please try again,invalid username or password");
			request.getRequestDispatcher("WEB-INF/views/signin.jsp").forward(request, response);
		}
		Cookie authCookie = new Cookie("_token", "12345");
		authCookie.setHttpOnly(true);
		authCookie.setMaxAge(15*60);
		response.addCookie(authCookie);
		response.sendRedirect("http://localhost:8080/com.kosgei.webapp/");
//		p
	}

}
