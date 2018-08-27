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

public class BrandsRedis {
	Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	public List<Brands> readFromRedis() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		List<Brands> Brands = new ArrayList();
		RedisFuture<List<String>> futureKeys = asyncCommands.keys("brand*");
		List<String> keys = futureKeys.get();//它阻塞和等待直到承诺的结果是可用状态 
		/*List<String> keys = syncCommands.keys("author*");  同步实现*/
		if(keys.size()==0) return Brands;
		
		for(String key: keys){
			RedisFuture<Map<String,String>> futureMap = asyncCommands.hgetall(key);
			Map<String,String> map = futureMap.get();//它阻塞和等待直到承诺的结果是可用状态
			/*Map<String, String> map = syncCommands.hgetall(key);  同步实现*/
			Brands brands = new Brands();
				brands.setBrandid(Integer.valueOf(map.get("id")));
				brands.setBrandname( map.get("name") );
				brands.setBrandcount( Integer.valueOf(map.get("count")));
				brands.setBranddscr( map.get("dscr") );
				brands.setBrandpics( map.get("pics") );
				Brands.add(brands);
		
			
		}
		 
	
		Collections.sort(Brands,new BrandsComparator());
		logger.debug("----------read from redis-------------------");
		return Brands;
	}
	
	
	public void writeToRedis(List<Brands> Brands) {
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		
		for(Brands bd: Brands){
			Map<String, String> map = new HashMap();	
			map.put("id", String.valueOf(bd.getBrandid()));
			map.put("name", bd.getBrandname());
			map.put("count", String.valueOf(bd.getBrandcount()));	
			map.put("dscr", bd.getBranddscr());	
			map.put("pics", bd.getBrandpics());	
			asyncCommands.hmset("brand:"+bd.getBrandid(), map);
		}
		
		
	}
	private class BrandsComparator implements Comparator<Brands> { 
		  
		 @Override
		 public int compare(Brands o1, Brands o2) { 
		  // TODO Auto-generated method stub 
		  int flag =  0;
		  if(flag == 0) { 
		   flag = o1.getBrandid()-o2.getBrandid();
		  } 
		  return flag; 
		 } 
		   
		}

}
