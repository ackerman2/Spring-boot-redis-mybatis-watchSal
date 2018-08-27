package com.example.mapper;

import java.util.List;

import com.example.model.Order;

public interface OrderMapper {
	
	 int insertOrder(Order order);
	 List<Order> findAllOrder(int user_id);
	 List<Order> findAllOrders();
	 int updateOrder(int orderid);
	 List<Order> findOrder1();
	 List<Order> findOrder0();
}
