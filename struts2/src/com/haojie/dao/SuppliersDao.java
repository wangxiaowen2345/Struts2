package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Suppliers;

public interface SuppliersDao {

	/**
	 * 查询所有供应商
	 * @return
	 */
	public List<Suppliers> SelectAllSupplies();
	
	/**
	 * 添加新的供应商
	 * @param s
	 * @return
	 */
	public boolean InsertSuppliers(Suppliers s);
	
	
	/**
	 * 查询单个供应商
	 */
	public Suppliers SelectSuppliersByName(String name);
	
	
	/**
	 * 根据ID查供应商
	 */
	public Suppliers SelectSuppliersById(String id);
}
