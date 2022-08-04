package com.kosgei.webapp.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Dashboard extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String [] names = {"Kosgei","Victor"};
			request.setAttribute("msg", "Welcome to Higher Life Limited");
			request.setAttribute("names", names);
			request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
			
	}

}
