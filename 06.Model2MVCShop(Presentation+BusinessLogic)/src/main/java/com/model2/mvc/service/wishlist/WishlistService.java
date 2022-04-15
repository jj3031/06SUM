package com.model2.mvc.service.wishlist;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface WishlistService {
	
	// 회원가입
	public void addWishlist(Wishlist wishlist) throws Exception;
	
	// 회원정보리스트 
	public List<Wishlist> getWishlist(String userId) throws Exception;
	
	// 회원정보수정
	public int deleteWishlist(int wishNo) throws Exception;
	
}