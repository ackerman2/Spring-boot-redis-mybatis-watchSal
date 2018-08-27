package com.example.model;

public class Watch {
		private int watchid;
		private String type;
		private String watchname;
		private int brand_id;
		private int price;
		private int amount;
		private String descr;
		private String pics;
		private int xl;
		private String brandname;
		private Brands brands;
		
		public String getBrandname() {
			return brandname;
		}
		public void setBrandname(String brandname) {
			this.brandname = brandname;
		}
		public int getWatchid() {
			return watchid;
		}
		public void setWatchid(int watchid) {
			this.watchid = watchid;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getWatchname() {
			return watchname;
		}
		public void setWatchname(String watchname) {
			this.watchname = watchname;
		}
		public int getBrand_id() {
			return brand_id;
		}
		public void setBrand_id(int brand_id) {
			this.brand_id = brand_id;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public String getDescr() {
			return descr;
		}
		public void setDescr(String descr) {
			this.descr = descr;
		}
		public String getPics() {
			return pics;
		}
		public void setPics(String pics) {
			this.pics = pics;
		}
		public int getXl() {
			return xl;
		}
		public void setXl(int xl) {
			this.xl = xl;
		}
		public Brands getBrands() {
			return brands;
		}
		public void setBrands(Brands brands) {
			this.brands = brands;
		}
		@Override
		public String toString() {
			return "Watch [watchid=" + watchid + ", type=" + type
					+ ", watchname=" + watchname + ", brand_id=" + brand_id
					+ ", price=" + price + ", amount=" + amount + ", descr="
					+ descr + ", pics=" + pics + ", xl=" + xl + ", brands="
					+ brands + "]";
		}
		
}
