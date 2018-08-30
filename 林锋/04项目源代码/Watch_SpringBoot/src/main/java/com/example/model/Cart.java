package com.example.model;

public class Cart {
		private int cartid;
		private int watch_id;
		private int cartcount;
		private int user_id;
		private Watch watch;
		public int getCartid() {
			return cartid;
		}
		public void setCartid(int cartid) {
			this.cartid = cartid;
		}
		public int getWatch_id() {
			return watch_id;
		}
		public void setWatch_id(int watch_id) {
			this.watch_id = watch_id;
		}
		public int getCartcount() {
			return cartcount;
		}
		public void setCartcount(int cartcount) {
			this.cartcount = cartcount;
		}
		public int getUser_id() {
			return user_id;
		}
		public void setUser_id(int user_id) {
			this.user_id = user_id;
		}
		
		public Watch getWatch() {
			return watch;
		}
		public void setWatch(Watch watch) {
			this.watch = watch;
		}
		
		
}
