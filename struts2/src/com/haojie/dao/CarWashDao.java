package com.haojie.dao;

import java.util.Date;
import java.util.List;

import com.haojie.pojo.CarWash;
import com.haojie.pojo.CarWashRecord;
import com.haojie.utils.Page;

public interface CarWashDao {
	/**
	 * 添加新洗车卡
	 * 
	 * 
	 */
	public void AddCarWash(CarWash carwash);

	/**
	 * 查询所有洗车卡
	 */
	public List<CarWash> AllCarWareByTimeDesc(Page page);

	/**
	 * 按照卡号查找洗车卡
	 * 
	 * @param nsernum
	 * @return
	 */
	public CarWash SelectCarWashByNumber(String number);

	/**
	 * 快速搜索洗车卡列表
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCarWashList(String fast);

	/**
	 * 按照卡号查找洗车卡消费记录
	 * 
	 * @param nsernum
	 * @return
	 */
	public List<CarWashRecord> SelectCarWashRecordConsumerByNumber(String number);

	/**
	 * 按照卡号查找洗车卡充值记录
	 * 
	 * @param nsernum
	 * @return
	 */
	public List<CarWashRecord> SelectCarWashRecordByNumber(String number);

	// /**
	// * 模糊查询
	// *
	// * @param para
	// * @return
	// */
	// public CarWash SelectCarWashByPara(String para);

	/**
	 * 更新到期时间和剩余次数
	 */
	public void UpdateCarWash(String num, Date expdate, int residuedegree);

	/**
	 * 根据卡号查找
	 * 
	 * @param num
	 * @return
	 */
	public CarWash CarWashByNum(String num);

	/**
	 * 更新次数
	 * 
	 * @param residuedegree
	 */
	public void UpdateCarWashResidueDegree(int residuedegree, String num);

}