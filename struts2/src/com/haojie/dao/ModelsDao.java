package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Models;
import com.haojie.pojo.WareHouse;

public interface ModelsDao {
	
	/**
	 * 查询所有仓库
	 * @return
	 */
	public List<Models> AllModels();
	
	/**
	 * 根据Id查询仓库
	 * @param id
	 * @return
	 */
	public Models ModelsById(int id);
	
	/**
	 * 添加新的仓库
	 */
	public void AddModels(Models wh);
	
	/**
	 * 更新仓库名称
	 */
	public void UpdateModels(Models wh);
	
	/**
	 * 根据Id查询仓库
	 */
	public Models ModelsByName(String name);
	
	

}
