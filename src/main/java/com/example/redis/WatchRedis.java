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
import com.example.model.Watch;

public class WatchRedis {
	Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	public List<Watch> readFromRedis() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		List<Watch> Watch = new ArrayList();
		RedisFuture<List<String>> futureKeys = asyncCommands.keys("watch*");
		List<String> keys = futureKeys.get();//它阻塞和等待直到承诺的结果是可用状态 	
		if(keys.size()==0) return Watch;
		
		for(String key: keys){
			RedisFuture<Map<String,String>> futureMap = asyncCommands.hgetall(key);
			Map<String,String> map = futureMap.get();//它阻塞和等待直到承诺的结果是可用状态
			Watch watches = new Watch();
				watches.setWatchid(Integer.valueOf(map.get("id")));
				watches.setType( map.get("type") );
				watches.setWatchname( map.get("name") );
				watches.setBrand_id(Integer.valueOf(map.get("b_id")));
				watches.setPrice(Integer.valueOf(map.get("price")));
				watches.setAmount(Integer.valueOf(map.get("amount")));
				watches.setDescr(map.get("descr") );
				watches.setPics( map.get("pics") );
				watches.setXl(Integer.valueOf(map.get("xl")));
	
			Brands brands = new Brands();
				brands.setBrandid(Integer.valueOf(map.get("bid")));
				brands.setBrandname( map.get("bname") );
				brands.setBrandcount( Integer.valueOf(map.get("bcount")));
				brands.setBranddscr( map.get("bdscr") );
				brands.setBrandpics( map.get("bpics") );
				watches.setBrands(brands);
				Watch.add(watches);
		
			
		}
		 
	
		Collections.sort(Watch,new WatchesComparator());
		logger.debug("----------read from redis-------------------");
		return Watch;
	}
	
	
	public void writeToRedis(List<Watch> Watches) {
		RedisAsyncCommands<String, String> asyncCommands = RedisCli.connection.async();
		
		for(Watch wt: Watches){
			Map<String, String> map = new HashMap();
			map.put("id", String.valueOf(wt.getWatchid()));
			map.put("type", wt.getType());
			map.put("name", wt.getWatchname());
			map.put("b_id", String.valueOf(wt.getBrand_id()));
			map.put("price", String.valueOf(wt.getPrice()));
			map.put("amount", String.valueOf(wt.getAmount()));	
			map.put("dscr", wt.getDescr());	
			map.put("pics", wt.getPics());
			map.put("xl", String.valueOf(wt.getXl()));	
	
			map.put("bid", String.valueOf(wt.getBrands().getBrandid()));
			map.put("bname", wt.getBrands().getBrandname());
			map.put("bcount", String.valueOf(wt.getBrands().getBrandcount()));
			map.put("bdscr", wt.getBrands().getBranddscr());
			map.put("bpics", wt.getBrands().getBrandpics());
			
			asyncCommands.hmset("watch:"+wt.getWatchid(), map);
			
			
		}
		
	}
	private class WatchesComparator implements Comparator<Watch> { 
		  
		 @Override
		 public int compare(Watch o1, Watch o2) { 
		  // TODO Auto-generated method stub 
		  int flag =  0;
		  if(flag == 0) { 
		   flag = o1.getWatchid()-o2.getWatchid();
		  } 
		  return flag; 
		 } 
		   
		}

}
