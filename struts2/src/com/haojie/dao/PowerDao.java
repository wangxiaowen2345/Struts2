package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Power;
import com.haojie.pojo.PowerAss;
import com.haojie.pojo.PowerFuntion;

public interface PowerDao {

	/**
	 * 根据ID查询权限组列表
	 * @param id
	 * @return
	 */
	public Power getPowerNameById(String id);
	
	
	/**
	 * 获取所有的权限组列表
	 * @return
	 */
	public List<Power> getAllPower();
	
	/**
	 * 查询是否有权限
	 * @return
	 */
	public boolean Power(int PowerId,int FunctionId);
	
	/**
	 * 根据id查具体权限分配
	 * @param id
	 * @return
	 */
	public List<PowerFuntion> PowerFunctionByPowerId(int id);
	
	/**
	 * 添加新权限
	 */
	public void SavePower(Power power);
	
	
	/**
	 * 用户组权限分配保存更新
	 */
	public void SavaPowerAss(PowerAss powerass);
	
	/**
	 * 根据名字查权限组
	 * @param powername
	 * @return
	 */
	public Power getPowerByName(String powername);
	
	/**
	 * 删除权限
	 * @param id
	 */
	public void DeletePowerFunctionById(int id);
	
	/**
	 * 更新权限名称
	 * @param power
	 */
	public void UpdatePowerById(Power power);
	
	
}
