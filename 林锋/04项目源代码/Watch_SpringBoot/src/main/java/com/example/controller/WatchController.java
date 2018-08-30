package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.BrandsMapper;
import com.example.mapper.CartMapper;
import com.example.mapper.OrderMapper;
import com.example.mapper.WatchMapper;
import com.example.model.Brands;
import com.example.model.Cart;
import com.example.model.Order;
import com.example.model.User;
import com.example.model.Watch;

@Controller
public class WatchController {
	Logger logger = LoggerFactory.getLogger(WatchController.class);
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	BrandsMapper brandsMapper;
	
	@GetMapping(value="/brands")

	public String findAllBrands(Model model,HttpSession session){
		
		model.addAttribute("brands", brandsMapper.findAllBrands());
		model.addAttribute("count",brandsMapper.findCBrands());
		if(session.getAttribute("user")!=null){
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		}
		System.out.println(brandsMapper.findCBrands());
		return "brands";
		
	}
	
	@Autowired
	CartMapper cartMapper;
	
	@GetMapping("/checkout")
	public String checkout(Model model,HttpSession session){
		if(session.getAttribute("user")!=null){
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		session.setAttribute("CartOrder",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		return "checkout";
	}
		session.setAttribute("msg","您尚未登录，请登陆");
		return "login";
	}
	
/*	@GetMapping("/checkout/{watchid}")
	public String check(@PathVariable("watchid") int watchid, @RequestParam("count") int count ,Model model,HttpSession session){
		if(session.getAttribute("user")!=null){
	
		int i = cartMapper.insertCart(watchid,count,((User) session.getAttribute("user")).getUserid());
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		System.out.println(i);
	
		return "checkout";
	}
		session.setAttribute("msg","您尚未登录，请登陆");
	return "login";
	}*/
	
	@GetMapping("/checkout/{watchid}")
	public String check(@PathVariable("watchid") int watchid, @RequestParam("count") int count ,Model model,HttpSession session){
		if(session.getAttribute("user")!=null){
			Cart ca = cartMapper.chkCart(watchid,((User) session.getAttribute("user")).getUserid());
		if(ca!=null){
			int Tcount=count+ca.getCartcount();
			int i=cartMapper.updateCart(Tcount,ca.getCartid());
			model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		}
		else{
			int i = cartMapper.insertCart(watchid,count,((User) session.getAttribute("user")).getUserid());
			model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
			System.out.println(i);
		}
		return "checkout";
	}
		session.setAttribute("msg","您尚未登录，请登陆");
		return "login";
	}
	
	@PostMapping("/Cajax")
	public void Cajax(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		
		PrintWriter out = response.getWriter();	
		if(session.getAttribute("user")!=null){
		int i=((User) session.getAttribute("user")).getUserid();
		int j=cartMapper.deleteAllCart(i);
		String tip="N";		
		out.print(tip);
		}
		else{
			
		}
		
	}
	
	
	@PostMapping("/SingleChk")
	public void SingleChk(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		String watch_id=request.getParameter("watch_id");
		if(session.getAttribute("user")!=null){
			Cart ca = cartMapper.chkCart(Integer.parseInt(watch_id),((User) session.getAttribute("user")).getUserid());	
			if(ca!=null){
				int Tcount=1+ca.getCartcount();
				int i=cartMapper.updateCart(Tcount,ca.getCartid());
				String tip="N";		
				out.print(tip);
				
			}
			else{
				int i = cartMapper.insertCart(Integer.parseInt(watch_id),1,((User) session.getAttribute("user")).getUserid());
				String tip="Y";		
				out.print(tip);
				
			}
	
				}
		
		else{
			String tip="W";
			out.print(tip);
		}
	
	}
	
	@GetMapping("/editChk")
	public String editChk(@RequestParam("cartid") int cartid ,Model model,HttpSession session){
		
		int i=cartMapper.deleteCart(cartid);
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		System.out.print(i);
		return "checkout";
	}
	
	@GetMapping("/edit")
	public String edit(Model model,HttpSession session){
		int j = ((User) session.getAttribute("user")).getUserid();
		int i=cartMapper.deleteAllCart(j);
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		System.out.print(i);
		return "checkout";
	}
	
	/*@GetMapping("/editAll")
	public String editAll(Model model,HttpSession session,Order order,HttpServletRequest request){
		int j = ((User) session.getAttribute("user")).getUserid();
		int i = cartMapper.deleteAllCart(j);
		String total = request.getParameter("tot");
		order.setOrdertime((new Date()).toString());
		order.setState("未送达");
		order.setTotal(Integer.parseInt(total));
		order.setUser_id(((User) session.getAttribute("user")).getUserid());
		List<Cart> c=(List<Cart>)session.getAttribute("CartOrder");
		String wid="";
		String cid="";
		int first=0;
		for(Cart a:c){
			if(first==0){
				wid=a.getWatch_id()+"";
				cid=a.getCartcount()+"";
				first++;
			}else{
				wid=wid+","+a.getWatch_id();
				cid=cid+","+a.getCartcount();
			}
			
			
		}
      
		order.setWatch_id(wid);
		order.setWcount(cid);
		
		int k = orderMapper.insertOrder(order);
		
		
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("RandWatch",watchMapper.findRandWatch());
		System.out.print(i);
		return "index";
	}*/
	
	@SuppressWarnings("unchecked")
	@GetMapping("/editAll")
	public String editAll(Model model,HttpSession session,Order order,HttpServletRequest request){
		int j = ((User) session.getAttribute("user")).getUserid();			
		List<Cart> c=(List<Cart>)session.getAttribute("CartOrder");				
		for(Cart a:c){	
			int w_count=a.getCartcount();
			int watch_id=a.getWatch_id();
			order.setW_ordertime((new Date()).toString());
			order.setState("未送达");
			order.setUser_id(((User) session.getAttribute("user")).getUserid());
			order.setW_count(w_count);
			order.setWatch_id(watch_id);
			int k = orderMapper.insertOrder(order);
			int m = watchMapper.updateWcount(w_count,w_count,watch_id);
					
		}
		int i = cartMapper.deleteAllCart(j);	
		model.addAttribute("Cart",cartMapper.findAllCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		model.addAttribute("RandWatch",watchMapper.findRandWatch());
		System.out.print(i);
		return "index";
	}
	
	
	@GetMapping("/contact")
	public String contact(){
		return "contact";
	}
	
	
	
	@Autowired
	WatchMapper watchMapper;
	@GetMapping(value="/men/{type}")

	public String men(@PathVariable("type") String type,@RequestParam(value="search",required=false) String watchname,Model model,HttpSession session){
	if(type.equals("搜索")){
		model.addAttribute("Typewatch",watchMapper.findSearchWatch(watchname));
		model.addAttribute("watch1", brandsMapper.findAllBrands());
		model.addAttribute("Cwatch",watchMapper.findCWatch());
	}
		
	else{
		if(type.equals("热销")){
		model.addAttribute("Typewatch",watchMapper.findXlWatch(type));
		model.addAttribute("watch1", brandsMapper.findAllBrands());
		model.addAttribute("Cwatch",watchMapper.findCWatch());	
	}else{
		model.addAttribute("watch", watchMapper.findAllWatch());
		model.addAttribute("Typewatch",watchMapper.findTypeWatch(type,type));
		model.addAttribute("watch1", brandsMapper.findAllBrands());
		model.addAttribute("Cwatch",watchMapper.findCWatch());	
	}}
	if(session.getAttribute("user")!=null){
		model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
	}
		return "men";
	}
	
	
	@GetMapping(value="/men")

	public String Allmen(Model model,HttpSession session) {
		
		model.addAttribute("Typewatch", watchMapper.findAllWatch());
		model.addAttribute("watch1", brandsMapper.findAllBrands());
		model.addAttribute("Cwatch",watchMapper.findCWatch());
		if(session.getAttribute("user")!=null){
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		}
		return "men";
	}
	
	@GetMapping("/index")
	public String watchIndex(Model model,HttpSession session){
		logger.debug("--------这是主页-----------");
		if(session.getAttribute("user")!=null){
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		}
		model.addAttribute("RandWatch",watchMapper.findRandWatch());
		return "index";
	}
	
	
	
	@GetMapping(value="/single/{watchid}")

	public String single(@PathVariable("watchid") int watchid,Model model,HttpSession session){
	
		model.addAttribute("RelateWatch",watchMapper.findRelatedWatch(watchid));
		model.addAttribute("Idwatch",watchMapper.findIdWatch(watchid));
		if(session.getAttribute("user")!=null){
			model.addAttribute("Ccart", cartMapper.findCCart(((User) session.getAttribute("user")).getUserid()));
		}
	
		
		return "single";
	}
	
	
	@GetMapping("/404")
	public String do404(){
		return "404";
	}
	
	
}
