package com.model2.mvc.service.domain;



public class Wishlist {
	
	private int wishNo;
	private int prodNo;
	private String userId;
	private int quantity;
	private int remain;
	private int price;
	private String prodName;


	public int getWishNo() {
		return wishNo;
	}



	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}



	public int getProdNo() {
		return prodNo;
	}



	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getRemain() {
		return remain;
	}



	public void setRemain(int remain) {
		this.remain = remain;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getProdName() {
		return prodName;
	}



	public void setProdName(String prodName) {
		this.prodName = prodName;
	}



	// Override
	public String toString() {
		return "WishlisVO :"+wishNo+prodNo+userId;
	}	
}