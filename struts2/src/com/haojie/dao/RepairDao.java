package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Repair;
import com.haojie.pojo.RepairRecord;

public interface RepairDao {

	/**
	 * 添加维修（维修建档）
	 * 
	 * @param repair
	 */
	public void AddRepair(Repair repair);

	/**
	 * 查询维修档案详情
	 * 
	 * @param num
	 * @return
	 */
	public Repair RepairByNum(String num);

	/**
	 * 维修车辆记录
	 */
	public List<Repair> RepairedList();

	/**
	 * 按时间点搜维修记录
	 */
	public List<Object> FastRepairTime1(String fast1);

	/**
	 * 按时间段搜维修记录
	 */
	public List<Object> FastRepairTime(String fast1, String fast2);

	/**
	 * 快速搜索维修记录
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastRepair(String fast);

	/**
	 * 正在维修车辆列表
	 * 
	 * @return
	 */
	public List<Repair> RepairIngList();

	/**
	 * 删除维修订单
	 * 
	 * @param num
	 */
	public void DeleteRepair(String num);

	/**
	 * 根据WRID查询维修记录
	 */
	public RepairRecord RepairRecordByWRId(int id);

	/**
	 * 添加维修记录
	 * 
	 * @param repairrecord
	 */
	public void AddRepairRecord(RepairRecord repairrecord);

	/**
	 * 删除维修订单详情记录
	 */
	public void DeleteRepairRecordById(int id);

	/**
	 * 根据NUM查询维修记录
	 */
	public List<RepairRecord> RepairRecordByRepairnum(String num, int type);

	/**
	 * 根据车辆维修档案
	 */
	public List<Repair> RepairByCarid(int carid);

	/**
	 * 更新维修单状态信息
	 * 
	 * @param num
	 * @param state
	 */
	public void UpdateRepairState(String num, int state, int cashflow);
}
