package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.CartMapper;
import com.example.mapper.OrderMapper;
import com.example.mapper.UserMapper;
import com.example.model.User;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	UserMapper userMapper;
	@Autowired
	OrderMapper orderMapper;
	
	@GetMapping("/register")
	public String register(){
		return "register";
	}
	
	
	@PostMapping(value="/doreg")
	public String doReg(@ModelAttribute("user1") User user ,Model model,HttpSession session){ 
		
		
		System.out.println(user);
		int i=userMapper.insertUser(user);
		System.out.println(i);
		session.setAttribute("msg","注册成功，请登陆");
		return "redirect:/login";
		//model.addAttribute("msg","注册成功，请登陆");
		//return "login";
	}
	
	@PostMapping("/doajax")
	public void doajax(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		
		PrintWriter out = response.getWriter();
		String tip="Y";
		String username=request.getParameter("username");	
		
		if(username.length()<3){
			tip="W";
			}
		if(userMapper.chkUser(username)>0){
			tip="N";
		}
		System.out.println(tip);
		 out.print(tip);
		
	}
	
	@PostMapping("/user/doajax")
	public void doajaxPwd(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		
		PrintWriter out = response.getWriter();
		String tip="N";
		String userid=request.getParameter("userid");
		int i=Integer.parseInt(userid);
		String userpwd=request.getParameter("userpwd");		
		/*int i = ((User) session.getAttribute("user")).getUserid();*/
		
		if(userMapper.chkPwd(i, userpwd)>0){
			tip="Y";
		}
		System.out.println(tip);
		 out.print(tip);
		
	}
	
	@Autowired
	CartMapper cartMapper;
	@GetMapping("/login")
	public String login(HttpServletRequest request,Model model){
		if(request.getCookies()!=null){
			for(Cookie c: request.getCookies()){
				if(c.getName().equals("username")){
					String username = c.getValue();
					model.addAttribute("username",username);
					System.out.println(username);
				}
			/*	if(c.getName().equals("rem")){
					String rem = c.getValue();
					model.addAttribute("rem",rem);
					System.out.println(rem);
				}*/
			}}
		return "login";
	}
	
	@PostMapping(value="/dologin")
	public String dologin(
			@RequestParam("username") String username ,
			@RequestParam("userpwd") String userpwd,
			 HttpServletResponse response , HttpServletRequest request,
			Model model,HttpSession session){ 
			if(userMapper.loginUser(username,userpwd)!=null){
				session.setAttribute("user", userMapper.loginUser(username, userpwd));
				model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
				
				String rem=request.getParameter("rem");
				int keepTime =(rem==null?0:60*60*24*10);
			
					Cookie ckUser = new Cookie("username",username);
					Cookie ckRem = new Cookie("rem",rem);
					ckUser.setMaxAge(keepTime);
					ckRem.setMaxAge(keepTime);
					response.addCookie(ckUser);
					response.addCookie(ckRem);
				return "redirect:/index";
				
			}
		
		model.addAttribute("msg","用户名或密码不正确,请重新输入");
		return "login";
		
	}
	

	@GetMapping("/user/index")
	public String user(HttpSession session,Model model){
		if(session.getAttribute("user")!=null){
		model.addAttribute("order",orderMapper.findAllOrder(((User) session.getAttribute("user")).getUserid()));
		return "/user/index";
		}
		session.setAttribute("msg","您尚未登录，请登陆");
		return "redirect:/login";
	}
	
	
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session,Model model){
		
		session.removeAttribute("user");	
		return "redirect:/login";
	}
	
	@GetMapping("/user/editUser")
	public String editUser(HttpSession session,Model model){
		if(session.getAttribute("user")!=null){
		model.addAttribute("NewUser",userMapper.findUser(((User) session.getAttribute("user")).getUserid()));
		return "/user/editUser";
		}
		session.setAttribute("msg","您尚未登录，请登陆");
		return "redirect:/login";
		
	}
	
	@GetMapping("/user/editPwd")
	public String editPwd(HttpSession session,Model model){
		if(session.getAttribute("user")!=null){
		return "/user/editPwd";
		}
		session.setAttribute("msg","您尚未登录，请登陆");
		return "redirect:/login";
		
	}
	
	@PostMapping("/user/doEditUser")
	public String doEditUser(HttpSession session,Model model,User user){
		int i = userMapper.updateUser(user);
		System.out.print(i);
		return "redirect:/user/index";
	}
	
	@PostMapping("/user/doEditPwd")
	public String doEditPwd(HttpSession session,Model model,User user){
		int i = userMapper.updatePwd(user);
		System.out.println(i);
		return "redirect:/user/index";
	}
	
	
}
