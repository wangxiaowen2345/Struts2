package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Buytype;

public interface BuytypeDao {

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<Buytype> AllBuytype();

	/**
	 * 根据Id查询
	 * 
	 * @param id
	 * @return
	 */
	public Buytype BuytypeById(int id);

	/**
	 * 添加新的
	 */
	public void AddBuytype(Buytype b);

	/**
	 * 更新名称
	 */
	public void UpdateBuytype(Buytype b);

	/**
	 * 根据类型查询
	 */
	public Buytype BuytypeBytype(String type);

}
