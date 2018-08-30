package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.User;

public interface UserMapper {
	
	int insertUser(User user);
	int chkUser(String username);
	int chkPwd(int userid , String userpwd);
	User loginUser(@Param("username") String username,@Param("userpwd") String userpwd);
	int updateUser(User user);
	int updatePwd(User user);
	User findUser(int userid);
}
