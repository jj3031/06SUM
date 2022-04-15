package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {

	void insertPurchase(Purchase purchaseVO) throws Exception;

	Purchase findPurchase(int no) throws Exception;

	List<Purchase> getPurchaseList(Search search, String userId) throws Exception;

	List<Purchase> getSaleList(Search search) throws Exception;

	void updatePurchase(Purchase purchaseVO) throws Exception;

	void updateTranCode(Purchase purchaseVO) throws Exception;
	
	int getTotalCount(Search search, String buyerId) throws Exception;

}
