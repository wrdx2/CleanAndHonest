package com.cleanAndHonest.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserFilter implements Filter {

	
	private Set<String> paths = new HashSet<String>();
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//登陆检测,如果不用登陆就可以访问的页面就放过，否则跳转到登陆
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		String userName = (String) req.getSession().getAttribute("uName");
		
		String path = req.getServletPath();
		
		if (userName != null){
			//用户已登陆
			chain.doFilter(req, response);
		}else{
			//用户未登陆，有些链接不可访问
			if(!paths.contains(path)){
				chain.doFilter(req, response);
			}else{
				//回到登陆页面
				resp.sendRedirect("login.jsp");
			}
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		paths.add("/backer/index.html");
	}

}
