package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.Cart;

public interface CartMapper {
	    
	List<Cart> findAllCart(int user_id);
	int insertCart( int watch_id, int cartcount, int user_id);
	int findCCart(int user_id);
	int deleteCart(int cartid);
	int deleteAllCart(int user_id);
	int updateCart(int cartcount,int cartid);
	Cart chkCart(int watch_id,int user_id);

}
