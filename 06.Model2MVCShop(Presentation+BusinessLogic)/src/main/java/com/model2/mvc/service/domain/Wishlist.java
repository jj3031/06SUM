package com.model2.mvc.service.domain;



public class Wishlist {
	
	private int wishNo;
	private int prodNo;
	private String userId;
	private int quantity;
	


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



	// Override
	public String toString() {
		return "ProductVO : [fileName]";
	}	
}