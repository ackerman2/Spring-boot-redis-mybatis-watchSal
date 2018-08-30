package com.example.model;

public class Order {
	
	private int orderid;
	private int watch_id;
	private int w_count;
	private String state;
	private int user_id;
	private String w_ordertime;
	private Watch watch;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getWatch_id() {
		return watch_id;
	}
	public void setWatch_id(int watch_id) {
		this.watch_id = watch_id;
	}
	public int getW_count() {
		return w_count;
	}
	public void setW_count(int w_count) {
		this.w_count = w_count;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getW_ordertime() {
		return w_ordertime;
	}
	public void setW_ordertime(String w_ordertime) {
		this.w_ordertime = w_ordertime;
	}
	public Watch getWatch() {
		return watch;
	}
	public void setWatch(Watch watch) {
		this.watch = watch;
	}
	
}
