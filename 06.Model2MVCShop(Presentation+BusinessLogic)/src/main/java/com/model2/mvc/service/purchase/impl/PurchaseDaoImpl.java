package com.model2.mvc.service.purchase.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}	
	
	public PurchaseDaoImpl(){
		System.out.println(this.getClass());
	}

	public Purchase findPurchase(int tranNo) throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	
	


	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("buyerId", userId);
		map.put("search", search);
		
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);

	}

	public List<Purchase> getSaleList(Search search) throws Exception {
		

		return sqlSession.selectList("PurchaseMapper.getSaleList", search);

	}
	
	public void insertPurchase(Purchase purchase) throws Exception {
		
		sqlSession.selectList("PurchaseMapper.addPurchase", purchase);
	}
	
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}
	
	public int getTotalCount(Search search, String userId) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("buyerId", userId);
		map.put("search", search);
		
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}
}