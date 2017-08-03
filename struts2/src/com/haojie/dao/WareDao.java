package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.Department;
import com.haojie.pojo.ReturnedWare;
import com.haojie.pojo.WareHouse;
import com.haojie.pojo.WareRecord;
import com.haojie.pojo.Wares;
import com.haojie.utils.Page;

public interface WareDao {

	/**
	 * 查询所有仓库
	 * 
	 * @return
	 */
	public List<WareHouse> AllWareHouse();

	/**
	 * 查询所有部门
	 * 
	 * @return
	 */
	public List<Department> AllDepartment();

	/**
	 * 添加退货记录
	 * 
	 * @param rw
	 * @return
	 */
	public Serializable AddReturnedWareRecord(ReturnedWare rw);

	/**
	 * 库存列表
	 * 
	 * @param page
	 * @return
	 */
	public List<Object> InventoryList(Page page, int value1);

	/**
	 * 根据Id查询仓库
	 * 
	 * @param id
	 * @return
	 */
	public WareHouse WareHouseById(int id);

	/**
	 * 更新所有
	 * 
	 * @param wr
	 */
	public void UpdateWareRecordByOrderAndPro(WareRecord wr);

	/**
	 * 添加新的仓库
	 */
	public void AddWareHouse(WareHouse wh);

	/**
	 * 添加新的bumen
	 */
	public void AddDepartment(Department d);

	/**
	 * 更新仓库名称
	 */
	public void UpdateWareHouse(WareHouse wh);

	/**
	 * 更新bumen名称
	 */
	public void UpdateDepartment(Department b);

	/**
	 * 根据Id查询仓库
	 */
	public WareHouse WareHouseByName(String name);

	/**
	 * 根据Id查询bumen
	 */
	public Department DepartmentByName(String name);

	/**
	 * 向商品库添加新商品
	 * 
	 * @param w
	 */
	public Serializable AddWares(Wares w);

	/**
	 * 根据品名 规格 车型 厂家 查询
	 * 
	 * @param w
	 * @return
	 */
	public Wares SelectWares(Wares w);

	/**
	 * 根据货号查询
	 * 
	 * @param w
	 * @return
	 */
	public Wares SelectWaresByNumber(Wares w);

	/**
	 * 快速搜索
	 * 
	 * @param w
	 * @return
	 */
	public List<Wares> FastSelectWares(String s, int suppliers);

	/**
	 * 根据Id查询商品
	 * 
	 * @param w
	 * @return
	 */
	public Wares SelectWaresById(Wares w);

	/**
	 * 根据供货商查询商品
	 * 
	 * @param w
	 * @return
	 */
	public List<Wares> SelectWaresBySuppliers(Wares w);

	/**
	 * 仓库进入记录
	 */
	public Serializable AddWareRecord(WareRecord r);

	/**
	 * 查询最后一个 BY ProductNumber
	 */
	public WareRecord SelectOneWareByTimeDesc(String number);

	/**
	 * 查询在库商品
	 */
	public List<Object[]> SelectWareListByWhere(int warehouse, String key);

	/**
	 * 商品出库
	 */
	public void OutWareHouseByProductNumber(WareRecord w);

	/**
	 * 查某商品在库所有记录
	 */
	public List<WareRecord> SelectWareListByNumber(String number);

	/**
	 * 查某仓库在库所有记录
	 */
	public List<WareRecord> SelectWareListByWareHouse(int wh);

	/**
	 * 根据维修单号查询出库记录
	 * 
	 * @param repairnum
	 * @return
	 */
	public List<WareRecord> OutWareHouseRecord(String repairnum);

	/**
	 *根据某商品货号和价格查出具体的订单号 所剩下的数量
	 */
	// public List<WareRecord> OutWareListByPrice(String productnumber, int
	// price);

	/**
	 *增添出库记录
	 */
	public void OutWareRecord(WareRecord wr);

	/**
	 * 更新记录为无效
	 */
	public void setWrIsfalse(String ordernum, String productnum);

	/**
	 * 根据ID查仓库记录
	 */
	public WareRecord WareRecordById(int id);

	/**
	 * 根据ID更新仓库记录
	 */
	public void UpdateWareRecordById(WareRecord wr);

	/**
	 * 根据ID删除仓库记录
	 */
	public void DeleteWareRecordById(int id);
	
	/**
	 * 根据ID删除无效仓库记录
	 */
	public String DeleteWareRecord(int id);

	/**
	 * 根据订单号货号查询记录
	 * 
	 * @param number
	 * @param productnumber
	 * @return
	 */
	public WareRecord SelectWareRecordByNumberAndProcuct(String number,
			String productnumber, int dotype);

	/**
	 * 出库记录
	 * 
	 * @return
	 */
	public List<WareRecord> OutWareListByDotype(Page page);

	/**
	 * 模糊搜索出库列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object[]> FastOutWareList(String fast);

	/**
	 * 
	 * @param number
	 * @param productnumber
	 * @return
	 */
	public WareRecord SelectWareRecordIstureByNumberAndProcuct(String number,
			String productnumber);

	/**
	 * 退货模糊查询
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastReturned(String fast, String wh);

	/**
	 * 按时间点查询
	 * 
	 * @param fast1
	 * @param wh
	 * @return
	 */
	public List<Object> FastReturnedTime1(String fast1, String wh);

	/**
	 * 按时间段查询
	 * 
	 * @param fast1
	 * @param fast2
	 * @param wh
	 * @return
	 */
	public List<Object> FastReturnedTime1(String fast1, String fast2, String wh);

	/**
	 * 快速搜索库存
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastInventory(String fast, int value2);
}
