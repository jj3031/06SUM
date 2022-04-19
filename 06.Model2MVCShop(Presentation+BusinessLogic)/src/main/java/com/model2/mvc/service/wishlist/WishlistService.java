package com.model2.mvc.service.wishlist;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface WishlistService {
	
	//��ٱ����߰�
	public void addWishlist(Wishlist wishlist) throws Exception;
	
	//��ٱ��� ��ȸ
	public Wishlist findWishlist(int wishNo) throws Exception;
	
	// ��ٱ��ϸ���Ʈ 
	public List<Wishlist> getWishlist(String userId) throws Exception;
	
	// ��ٱ��ϻ���
	public int deleteWishlist(int wishNo) throws Exception;
	
}