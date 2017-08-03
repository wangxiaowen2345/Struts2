package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.FastCarList;
import com.haojie.pojo.FastCarRecord;
import com.haojie.utils.Page;

public interface FastCarListDao {

	/**
	 * 查询所有公有快车
	 */
	public List<FastCarList> AllPublicFastCarListByTimeDesc(Page page);

	/**
	 * 查询所有私有快车
	 */
	public List<FastCarList> AllPrivateFastCarListByTimeDesc(Page page);

	/**
	 * 公有快车数量
	 * 
	 * @return
	 */
	public int PublicFastCarCount();

	/**
	 * 私有快车数量
	 * 
	 * @return
	 */
	public int PrivateFastCarCount();

	/**
	 * 添加新快车
	 * 
	 * @return
	 */
	public Serializable AddFastCarList(FastCarList fastcarlist);

	/**
	 * 根据车号查快车
	 * 
	 * @param num
	 * @return
	 */
	public FastCarList FastCarListByNum(String num);

	/**
	 * 根据id查车辆
	 * 
	 * @param id
	 * @return
	 */
	public FastCarList FastCarListById(int id);

	/**
	 * 增加快车更换记录
	 * 
	 * @param fastcarrecord
	 * @return
	 */
	public Serializable AddFastCarRecord(FastCarRecord fastcarrecord);

	/**
	 * 更新车辆信息
	 * 
	 */
	public void UpdateFastCarList(FastCarList fastcar);

	/**
	 * 快速搜索
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCarList(String fast);

	/**
	 * 根据车辆id查询承包人信息
	 * 
	 * @param id
	 * @return
	 */
	public List<Object> ContractInfoByCarId(String id);

}
