package com.model2.mvc.service.wishlist.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.wishlist.WishlistDao;


//==> 장바구니 DAO CRUD 구현
@Repository("wishlistDaoImpl")
public class WishlistDaoImpl implements WishlistDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public WishlistDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addWishlist(Wishlist wishlist) throws Exception {
		sqlSession.insert("WishlistMapper.addWishlist", wishlist);
	}


	@Override
	public List<Wishlist> getWishlist(String userId) throws Exception {
		
		return sqlSession.selectList("WishlistMapper.getWishlist", userId);
	}

	@Override
	public int deleteWishlist(int wishNo) throws Exception {
		sqlSession.delete("WishlistMapper.deleteWishlist",wishNo);
		return 1;
	}
}