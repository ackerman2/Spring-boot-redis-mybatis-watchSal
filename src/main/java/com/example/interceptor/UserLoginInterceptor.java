package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class UserLoginInterceptor extends HandlerInterceptorAdapter {
    private static final String[] URIs = {"user/", "/user"};

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = true;
        String url = request.getRequestURL().toString();
        String user =  (String)request.getSession().getAttribute("user"); 
        System.out.println("user: " + user);
        System.out.println(">>>: " + url);
        if(user==null){
	        for (String s : URIs) {
	            if (url.contains(s)) {//如果访问管理页面
	            	request.getSession().setAttribute("msg","您尚未登录，请登陆");
	            	request.getRequestDispatcher("/login").forward(request, response);
	                return false;
	            }
	        }
        }
        
        
        
        return flag;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
