package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;


@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao=purchaseDao;
	}
	
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Purchase addPurchase(Purchase purchaseVO) throws Exception {
		purchaseDao.insertPurchase(purchaseVO);
		return purchaseVO;
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.findPurchase(tranNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String userId) throws Exception {
		List<Purchase> list= purchaseDao.getPurchaseList(search, userId);
		int totalCount = purchaseDao.getTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getSaleList(Search search, String userId) throws Exception {
		List<Purchase> list= purchaseDao.getSaleList(search);
		int totalCount = purchaseDao.getTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Purchase updatePurchase(Purchase purchaseVO) throws Exception {
		purchaseDao.updatePurchase(purchaseVO);
		return purchaseVO;
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		
		purchaseDao.updateTranCode(purchase);
		
	}
	


}