package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.Car;
import com.haojie.utils.Page;

public interface CarDao {

	/**
	 * 查询所有车辆
	 */
	public List<Car> AllCarByTimeDesc(Page page);

	/**
	 * 车辆库车辆数量
	 * 
	 * @return
	 */
	public int CarCount();

	/**
	 * 根据id搜索车辆
	 * 
	 * @param id
	 * @return
	 */
	public Car CarById(int id);

	/**
	 * 根据车牌搜索车辆
	 * 
	 * @param num
	 * @return
	 */
	public Car CarByNum(String num);

	/**
	 * 按时间点搜
	 */
	public List<Object> FastTime1(String fast1);

	/**
	 * 按时间段搜
	 */
	public List<Object> FastTime(String fast1, String fast2);

	/**
	 * 添加新车辆
	 * 
	 * @param car
	 * @return
	 */
	public Serializable AddCar(Car car);

	/**
	 * 更新车辆信息
	 * 
	 * @param car
	 */
	public void UpdateCar(Car car);

	/**
	 * 快速搜索车辆
	 * 
	 * @param fast
	 * @return
	 */
	public List<Object> FastCar(String fast);
}
