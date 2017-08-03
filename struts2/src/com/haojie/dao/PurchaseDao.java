package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.Purchase;
import com.haojie.utils.Page;

public interface PurchaseDao {

	/**
	 * 添加流水
	 * 
	 * @param cf
	 * @return
	 */
	public Serializable AddPurchase(Purchase p);

	/**
	 * 根据id查申请
	 * 
	 * @param id
	 * @return
	 */
	public Purchase PurchaseById(int id);

	/**
	 * 申请列表
	 */
	public List<Purchase> PurchaseList(Page page);

	/**
	 * 根据id改auditor
	 * 
	 * @param id
	 */
	public void AuditorById(int id);
}
