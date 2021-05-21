package com.sa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sa.entity.User;


/**
 * @date 2021-05-11
 * @author Eelin
 * filter, to verify user login
 * pass the direct of img
 * 
 *
 */
public class LoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest servletRequest = (HttpServletRequest)request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		
		String path = servletRequest.getRequestURI();
		
		System.out.println(path);
		User currentUser = (User)session.getAttribute("currentUser");
		if (path.indexOf("index.jsp") > -1 || path.indexOf("teacherLogin.jsp") > -1
				|| path.indexOf("studentLogin.jsp") > -1 || path.indexOf("adminLogin.jsp") > -1
				|| path.indexOf("login") > -1 || path.indexOf("adminLogin.jsp") > -1 || path.indexOf(".jpg") > -1
				|| path.indexOf(".html") > -1 || path.indexOf(".png") > -1 || path.indexOf(".css") > -1
				|| path.indexOf(".js") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		if(currentUser == null || "".equals(currentUser)) {
			//servletResponse.sendRedirect("${pageContext.request.contextPath}/index.jsp");
			//servletRequest.getRequestDispatcher("/index.jsp").forward(request, response);
			servletResponse.sendRedirect("/ThesisManagerment/index.jsp");
		}else {
			chain.doFilter(servletRequest, servletResponse);
		}
		
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
