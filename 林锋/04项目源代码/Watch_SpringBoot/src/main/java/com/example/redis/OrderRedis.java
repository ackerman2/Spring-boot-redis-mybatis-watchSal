package com.example.redis;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;







import junit.framework.Test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;













import com.example.controller.AdminController;
import com.example.controller.WatchController;
import com.example.lettuce.RedisCli;
import com.example.model.Brands;
import com.example.model.Order;
import com.example.model.Watch;

public class OrderRedis {
	Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	public List<Order> readFromRedis() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		List<Order> Order = new ArrayList();
		RedisFuture<List<String>> futureKeys = asyncCommands.keys("order*");
		List<String> keys = futureKeys.get();//它阻塞和等待直到承诺的结果是可用状态 	
		if(keys.size()==0) return Order;
		
		for(String key: keys){
			RedisFuture<Map<String,String>> futureMap = asyncCommands.hgetall(key);
			Map<String,String> map = futureMap.get();//它阻塞和等待直到承诺的结果是可用状态
			Order order = new Order();
				order.setOrderid(Integer.valueOf(map.get("id")));
				order.setWatch_id(Integer.valueOf(map.get("w_id")));
				order.setW_count(Integer.valueOf(map.get("w_count")));
				order.setUser_id(Integer.valueOf(map.get("u_id")));
				order.setW_ordertime(map.get("time") );
				order.setState(map.get("state"));
			
	
			Watch watches = new Watch();
				watches.setWatchid(Integer.valueOf(map.get("wid")));
				watches.setType( map.get("wtype") );
				watches.setWatchname( map.get("wname") );
				watches.setBrand_id(Integer.valueOf(map.get("wb_id")));
				watches.setPrice(Integer.valueOf(map.get("wprice")));
				watches.setAmount(Integer.valueOf(map.get("wamount")));
				watches.setDescr(map.get("wdescr") );
				watches.setPics( map.get("wpics") );
				watches.setXl(Integer.valueOf(map.get("wxl")));
				order.setWatch(watches);
				
				Order.add(order);
		
			
		}
		 
	
		Collections.sort(Order,new OrderComparator());
		logger.debug("----------read from redis-------------------");
		return Order;
	}
	
		
	public List<Order> readFromRedis1() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		List<Order> Order = new ArrayList();
		RedisFuture<List<String>> futureKeys = asyncCommands.keys("order*");
		List<String> keys = futureKeys.get();//它阻塞和等待直到承诺的结果是可用状态 	
		if(keys.size()==0) return Order;
		
		for(String key: keys){
			RedisFuture<Map<String,String>> futureMap = asyncCommands.hgetall(key);
			Map<String,String> map = futureMap.get();//它阻塞和等待直到承诺的结果是可用状态
			if(map.get("state").equals("已送达")){
			Order order = new Order();
				order.setOrderid(Integer.valueOf(map.get("id")));
				order.setWatch_id(Integer.valueOf(map.get("w_id")));
				order.setW_count(Integer.valueOf(map.get("w_count")));
				order.setUser_id(Integer.valueOf(map.get("u_id")));
				order.setW_ordertime(map.get("time") );
				order.setState(map.get("state"));
			
	
			Watch watches = new Watch();
				watches.setWatchid(Integer.valueOf(map.get("wid")));
				watches.setType( map.get("wtype") );
				watches.setWatchname( map.get("wname") );
				watches.setBrand_id(Integer.valueOf(map.get("wb_id")));
				watches.setPrice(Integer.valueOf(map.get("wprice")));
				watches.setAmount(Integer.valueOf(map.get("wamount")));
				watches.setDescr(map.get("wdescr") );
				watches.setPics( map.get("wpics") );
				watches.setXl(Integer.valueOf(map.get("wxl")));
				order.setWatch(watches);
				
				Order.add(order);
		
			
		}}
		 
	
		Collections.sort(Order,new OrderComparator());
		logger.debug("----------read from redis-------------------");
		return Order;
	}
	
	public List<Order> readFromRedis0() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		List<Order> Order = new ArrayList();
		RedisFuture<List<String>> futureKeys = asyncCommands.keys("order*");
		List<String> keys = futureKeys.get();//它阻塞和等待直到承诺的结果是可用状态 	
		if(keys.size()==0) return Order;
		
		for(String key: keys){
			RedisFuture<Map<String,String>> futureMap = asyncCommands.hgetall(key);
			Map<String,String> map = futureMap.get();//它阻塞和等待直到承诺的结果是可用状态
			if(map.get("state").equals("未送达")){
			Order order = new Order();
				order.setOrderid(Integer.valueOf(map.get("id")));
				order.setWatch_id(Integer.valueOf(map.get("w_id")));
				order.setW_count(Integer.valueOf(map.get("w_count")));
				order.setUser_id(Integer.valueOf(map.get("u_id")));
				order.setW_ordertime(map.get("time") );
				order.setState(map.get("state"));
			
	
			Watch watches = new Watch();
				watches.setWatchid(Integer.valueOf(map.get("wid")));
				watches.setType( map.get("wtype") );
				watches.setWatchname( map.get("wname") );
				watches.setBrand_id(Integer.valueOf(map.get("wb_id")));
				watches.setPrice(Integer.valueOf(map.get("wprice")));
				watches.setAmount(Integer.valueOf(map.get("wamount")));
				watches.setDescr(map.get("wdescr") );
				watches.setPics( map.get("wpics") );
				watches.setXl(Integer.valueOf(map.get("wxl")));
				order.setWatch(watches);
				
				Order.add(order);
		
			
		}}
		 
	
		Collections.sort(Order,new OrderComparator());
		logger.debug("----------read from redis-------------------");
		return Order;
	}
	
	public void writeToRedis(List<Order> order) {
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		
		for(Order or: order){
			Map<String, String> map = new HashMap();
			
			map.put("wid", String.valueOf(or.getWatch().getWatchid()));
			map.put("wtype", or.getWatch().getType());
			map.put("wname", or.getWatch().getWatchname());
			map.put("wb_id", String.valueOf(or.getWatch().getBrand_id()));
			map.put("wprice", String.valueOf(or.getWatch().getPrice()));
			map.put("wamount", String.valueOf(or.getWatch().getAmount()));	
			map.put("wdscr", or.getWatch().getDescr());	
			map.put("wpics", or.getWatch().getPics());
			map.put("wxl", String.valueOf(or.getWatch().getXl()));	
	
			map.put("id", String.valueOf(or.getOrderid()));
			map.put("w_id", String.valueOf(or.getWatch_id()));
			map.put("w_count", String.valueOf(or.getW_count()));
			map.put("u_id", String.valueOf(or.getUser_id()));
			map.put("time", or.getW_ordertime());
			map.put("state", or.getState());
			
			asyncCommands.hmset("order:"+or.getOrderid(), map);
			
			
		}
		
	}
	private class OrderComparator implements Comparator<Order> { 
		  
		 @Override
		 public int compare(Order o1, Order o2) { 
		  // TODO Auto-generated method stub 
		  int flag =  0;
		  if(flag == 0) { 
		   flag = o1.getOrderid()-o2.getOrderid();
		  } 
		  return flag; 
		 } 
		   
		}

}
