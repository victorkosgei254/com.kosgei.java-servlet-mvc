package com.kosgei.webapp.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthFilter implements Filter {

	public void destroy() {
		System.out.println("Destroy method of filter called");
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFilter method of filter called");
		HttpServletResponse fresponse=((HttpServletResponse) response);
		String path = ((HttpServletRequest) request).getServletPath();
		System.out.println(path);
		if(!(path.startsWith("/signin"))) {
			System.out.println("Redirect to Login");
			Cookie[] me = ((HttpServletRequest) request).getCookies();
			String token = "";
			if (me!= null)
				for (Cookie cookie:me){
					if(cookie.getName().equals("_token")){
						token = cookie.getValue();
						break;
					}
				}
			
			if(token=="") {
				fresponse.sendRedirect("http://localhost:8080/com.kosgei.webapp/signin");
//				request.getRequestDispatcher("WEB-INF/views/signin.jsp").forward(request, response);
				return;
			}
				
			
			
			chain.doFilter(request, response);
			return;
		}
		if(path.startsWith("/resources")) {
			chain.doFilter(request, response);
		}
		
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init method of filter called");
		
	}


}
