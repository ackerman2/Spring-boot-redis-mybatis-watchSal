package com.example.controller;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.lettuce.RedisCli;
import com.example.mapper.AdminMapper;
import com.example.mapper.BrandsMapper;
import com.example.mapper.OrderMapper;
import com.example.mapper.WatchMapper;
import com.example.model.Brands;
import com.example.model.Order;
import com.example.model.User;
import com.example.model.Watch;
import com.example.redis.BrandsRedis;
import com.example.redis.OrderRedis;
import com.example.redis.WatchRedis;

@Controller
public class AdminController {
	Logger logger = LoggerFactory.getLogger(AdminController.class);	
	BrandsRedis bRedis = new BrandsRedis();
	WatchRedis wRedis = new WatchRedis();
	OrderRedis oRedis = new OrderRedis();
	@GetMapping("/login1")
	public String login(HttpServletRequest request,Model model){
		if(request.getCookies()!=null){
			for(Cookie c: request.getCookies()){
				if(c.getName().equals("adminname")){
					String adminname = c.getValue();
					model.addAttribute("adminname",adminname);
					System.out.println(adminname);
				}
			
			}}
		return "login1";
	}
	
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	WatchMapper watchMapper;
	
	@Autowired
	BrandsMapper brandsMapper;
	
	@Autowired
	OrderMapper orderMapper;

	@PostMapping(value="/dologin1")
	public String dologin1(
			@RequestParam("adminname") String adminname ,
			@RequestParam("adminpwd") String adminpwd,
			 HttpServletResponse response , HttpServletRequest request,
			Model model,HttpSession session){ 
			if(adminMapper.loginAdmin(adminname,adminpwd)!=null){
				session.setAttribute("adminname", adminMapper.loginAdmin(adminname, adminpwd).getAdminname());
				model.addAttribute("watch", watchMapper.findAllWatch());
				
				String rem=request.getParameter("rem");
				int keepTime =(rem==null?0:60*60*24*10);
			
					Cookie ckAdmin = new Cookie("adminname",adminname);
					Cookie ckRem1 = new Cookie("rem",rem);
					ckAdmin.setMaxAge(keepTime);
					ckRem1.setMaxAge(keepTime);
					response.addCookie(ckAdmin);
					response.addCookie(ckRem1);
				return "redirect:/admin/index1";
				
			}
		
		model.addAttribute("msg1","用户名或密码不正确,请重新输入");
		return "login1";
		
	}
	@GetMapping("/admin/logout")
	public String logout(HttpSession session,Model model){
		session.removeAttribute("adminname");
		session.setAttribute("msg1","您尚未登录，请登陆");
		return "login1";
	}
	

	
	@PostMapping(value="/admin/doEdit")
	public String doedit(@ModelAttribute("watch") Watch watch,Model model,
			@RequestParam("brandname") String brandname,
			@RequestParam("watchid") int watchid
			) throws Exception{ 	
		int i = watchMapper.updateWatch(watch);
		System.out.println(i);
		List<Watch> watch1 = null;
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		Map<String, String> map = new HashMap();	
		map.put("id", String.valueOf(watch.getWatchid()));
		map.put("type", watch.getType());
		map.put("name", watch.getWatchname());
		map.put("b_id", String.valueOf(watch.getBrand_id()));
		map.put("price", String.valueOf(watch.getPrice()));
		map.put("amount", String.valueOf(watch.getAmount()));	
		map.put("dscr", watch.getDescr());	
		map.put("pics", watch.getPics());
		map.put("xl", String.valueOf(watch.getXl()));	
		asyncCommands.hmset("watch:"+watchid,map);
		watch1 = wRedis.readFromRedis();
		model.addAttribute("watch",watch1);
		/*
		 RedisFuture<List<String>> futureKeys = asyncCommands.keys("watch*");
		 List<String> keys = futureKeys.get();
		  for(String key : keys){
			asyncCommands.del(key);
		}
			watch = watchMapper.findAllWatch();
			wRedis.writeToRedis(watch); 删除全部redis数据,然后再读入
		*/
		return "admin/index1";
		
	}
	

	@PostMapping(value="/admin/doBEdit")
	public String doBedit(@ModelAttribute("brands") Brands brands,Model model
		
			) throws Exception{ 			
			int i = brandsMapper.updateBrands(brands);
			System.out.println(i);
			List<Brands> brand = null;
			RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
			Map<String, String> map = new HashMap();	
			map.put("id", String.valueOf(brands.getBrandid()));
			map.put("name", brands.getBrandname());
			map.put("count", String.valueOf(brands.getBrandcount()));	
			map.put("dscr", brands.getBranddscr());	
			map.put("pics", brands.getBrandpics());	
			asyncCommands.hmset("brand:"+brands.getBrandid(), map);
			brand = bRedis.readFromRedis();
			model.addAttribute("brands",brand);
			return "/admin/index2";

		
	}
	
	@GetMapping(value="/admin/delete")
	public String delete(@RequestParam("id") String id,Model model) throws Exception{ 
		int watchid = Integer.parseInt(id);	
		int i = watchMapper.deleteWatch(watchid);
		System.out.println(i);
		List<Watch> watch1 = null;
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		asyncCommands.del("watch:"+watchid);
		watch1 = wRedis.readFromRedis();
		model.addAttribute("watch",watch1);
		return "admin/index1";
		
	}
	
	@GetMapping(value="/admin/Bdelete")
	public String Bdelete(@RequestParam("id") String id,Model model) throws Exception{ 
		int brandid = Integer.parseInt(id);	
		int i = brandsMapper.deleteBrand(brandid);
		System.out.println(i);
		List<Brands> brands = null;
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		asyncCommands.del("brand:"+brandid);
		brands = bRedis.readFromRedis();
		model.addAttribute("brands",brands);
		return "/admin/index2";
	}
	
	@GetMapping(value="/admin/edit")
	public String edit(@RequestParam("id") String id,Model model){ 
		int watchid = Integer.parseInt(id);	
		model.addAttribute("watchId",watchMapper.findIdWatch(watchid));
		return "/admin/edit";

	}
	
	/*@GetMapping(value="/admin/edit")
	public String edit(@RequestParam("id") String id,Model model) throws Exception{ 
		int watchid = Integer.parseInt(id);	
		List<Watch> watches = null;
		watches = wRedis.readFromRedis();
		if(watches.size()==0){
			logger.debug("----------read from database-------------------");
			watches = watchMapper.findAllWatch();
			wRedis.writeToRedis(watches);
			model.addAttribute("watchId",watchMapper.findIdWatch(watchid));
			return "/admin/edit";
		}
		else{
		while(watches.size()==0){
			if(){
				
			}
		}
		model.addAttribute("watchId",watches);
		return "/admin/edit";
		}
	}*/
	
	@GetMapping(value="/admin/Bedit")
	public String Bedit(@RequestParam("id") String id,Model model){ 
		int brandid = Integer.parseInt(id);	
		model.addAttribute("brandsId",brandsMapper.findIdBrands(brandid));
		return "/admin/Bedit";

		
	}
	
	@GetMapping(value="/admin/editOrder")
	public String editOrder(@RequestParam("id") String id,Model model){ 
		int orderid = Integer.parseInt(id);	
		int i = orderMapper.updateOrder(orderid);
		model.addAttribute("order",orderMapper.findAllOrders());
		System.out.println(i);
		return "/admin/index";

		
	}
	
	
	@GetMapping(value="/admin/search")
	public String search(@RequestParam(value="search",required=false) String watchname,Model model){ 
		
		model.addAttribute("watch",watchMapper.findSearchWatch(watchname));
		return "/admin/index1";

		
	}
	
	
	@GetMapping("/admin/add")
	public String add(){
		return "admin/add";
	}
	
	@GetMapping("/admin/Badd")
	public String Badd(){
		return "admin/Badd";
	}
	
	@PostMapping("/admin/doadd")
	public String doadd(@RequestParam String type,@RequestParam String watchname,@RequestParam String brandname,
			@RequestParam int price,@RequestParam int amount,@RequestParam String descr,
			@RequestParam MultipartFile file,
			Model model,HttpServletRequest request) throws IllegalStateException, IOException {
		
		/**
		 * 文件上传
		 */
		String filenewname="";
		if(file.isEmpty()){ 
        	System.out.println("文件未上传!");
        	return "admin/add";
        }
        else{
        	//得到上传的文件名
			String fileName = file.getOriginalFilename();
			System.out.println("------file----------"+fileName);
			//得到服务器项目发布运行所在地址
			String path1 = request.getSession().getServletContext().getRealPath("/watch/images")+File.separator;
			//  此处未使用UUID来生成唯一标识,用日期做为标识
			 filenewname = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
			 System.out.println("++++++++"+filenewname);
			String path = path1+ filenewname;
			//查看文件上传路径,方便查找
			System.out.println(path);
			//把文件上传至path的路径
			File localFile = new File(path);
			file.transferTo(localFile);
			/*imagenames.add(filenewname);*/
			}
		/*request.setAttribute("images", imagenames);
		 * return "showimage";
		 * 
		 * */
		Watch watch = new Watch();
		watch.setAmount(amount);
		watch.setBrandname(brandname);
		watch.setDescr(descr);
		watch.setPics(filenewname);
		watch.setPrice(price);
		watch.setXl(0);
		watch.setWatchname(watchname);
		watch.setType(type);
		System.out.println(watch);
		
		int i =watchMapper.insertWatch(watch);
		System.out.println("----------"+i+"---------------");
		
		return "redirect:/admin/index1";
	}
	
	@PostMapping("/admin/doBadd")
	public String doBadd(@RequestParam String brandname,@RequestParam String branddscr,
			@RequestParam MultipartFile file,Model model,HttpServletRequest request)
					throws IllegalStateException, IOException {
		
		/**
		 * 文件上传
		 */
		String filenewname="";
		if(file.isEmpty()){ 
        	System.out.println("文件未上传!");
        	return "admin/add";
        }
        else{
        	//得到上传的文件名
			String fileName = file.getOriginalFilename();
			System.out.println("------file----------"+fileName);
			//得到服务器项目发布运行所在地址
			/*String path1 = request.getSession().getServletContext().getRealPath("/static/watch/images")+File.separator;*/
			String path1 = request.getSession().getServletContext().getRealPath("/watch/images")+File.separator;
			//  此处未使用UUID来生成唯一标识,用日期做为标识
			 filenewname = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
			 System.out.println("++++++++"+filenewname);
			String path = path1+ filenewname;
			//查看文件上传路径,方便查找
			System.out.println(path);
			//把文件上传至path的路径
			File localFile = new File(path);
			file.transferTo(localFile);
			/*imagenames.add(filenewname);*/
			}
		/*request.setAttribute("images", imagenames);
		 * return "showimage";
		 * 
		 * */
		Brands brands = new Brands();
		brands.setBrandcount(0);
		brands.setBranddscr(branddscr);
		brands.setBrandname(brandname);
		brands.setBrandpics(filenewname);
		System.out.println(brands);
		
		int i =brandsMapper.insertBrand(brands);
		System.out.println("----------"+i+"---------------");
		
		return "redirect:/admin/index2";
	}
	
	
	@GetMapping("/admin/index2")
	public String index2(Model model) throws Exception{
		
		List<Brands> brands = null;
		brands = bRedis.readFromRedis();
		if(brands.size()==0){
			logger.debug("----------read from database-------------------");
			brands = brandsMapper.findAllBrands();
			bRedis.writeToRedis(brands);
			model.addAttribute("brands", brandsMapper.findAllBrands());
			return "admin/index2";
		}
		else{
		model.addAttribute("brands",brands);
		return "admin/index2";
		}
	}
	
	@GetMapping("/admin/index")
	public String index(Model model) throws Exception{
		
		List<Order> order = null;
		order = oRedis.readFromRedis();
		if(order.size()==0){
			logger.debug("----------read from database-------------------");
			order = orderMapper.findAllOrders();
			oRedis.writeToRedis(order);
			model.addAttribute("order",orderMapper.findAllOrders());
			return "admin/index";
		}
		else{
		model.addAttribute("order",order);
		return "admin/index";
		}
	}
	

	
	@GetMapping("/admin/index_1")
	public String index_1(Model model) throws Exception{
		
		List<Order> order = null;
		order = oRedis.readFromRedis1();
		if(order.size()==0){
			logger.debug("----------read from database-------------------");
			order = orderMapper.findAllOrders();
			oRedis.writeToRedis(order);
			model.addAttribute("order",orderMapper.findOrder1());
			return "admin/index";
		}
		else{
		model.addAttribute("order",order);
		return "admin/index";
		}
	}
	
	@GetMapping("/admin/index_0")
	public String index_0(Model model) throws Exception{
		
		List<Order> order = null;
		order = oRedis.readFromRedis0();
		if(order.size()==0){
			logger.debug("----------read from database-------------------");
			order = orderMapper.findAllOrders();
			oRedis.writeToRedis(order);
			model.addAttribute("order",orderMapper.findOrder0());
			return "admin/index";
		}
		else{
		model.addAttribute("order",order);
		return "admin/index";
		}
	}
	

	@GetMapping("/admin/index1")
	public String index1(Model model) throws Exception{
		
		List<Watch> watch = null;
		watch = wRedis.readFromRedis();
		if(watch.size()==0){
			logger.debug("----------read from database-------------------");
			watch = watchMapper.findAllWatch();
			wRedis.writeToRedis(watch);
			model.addAttribute("watch", watchMapper.findAllWatch());
			return "admin/index1";
		}
		else{
		model.addAttribute("watch",watch);
		return "admin/index1";
		}
	}
}
