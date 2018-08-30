package com.example.mapper;

import java.util.List;

import org.jboss.logging.Param;

import com.example.model.Watch;

public interface WatchMapper {
	   
		List<Watch> findAllWatch();
		List<Watch> findTypeWatch( String type,String type1);
		List<Watch> findRandWatch();
		Watch findIdWatch(int watchid);
		List<Watch> findXlWatch(String type);
		List<Watch> findRelatedWatch(int watchid);
		List<Watch> findSearchWatch(String watchname);
		int findCWatch();
		int updateWatch(Watch watch);
		int insertWatch(Watch watch);
		int deleteWatch(int watchid);
		int updateWcount(int count,int count1,int watchid);
}
