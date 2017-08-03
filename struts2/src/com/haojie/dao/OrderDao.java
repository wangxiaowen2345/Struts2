package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.Order;
import com.haojie.pojo.OrderList;
import com.haojie.utils.Page;

public interface OrderDao {
	
	/**
	 * 根据Id查订单
	 * @param order
	 * @return
	 */
	public Order OrderById(Order order);
	
	/**
	 * 所有订单
	 * @return
	 */
	public List<Order> AllOrder(Page page);
	
	/**
	 * 订单总数
	 * @return
	 */
	public int OrderCount();
	
	/**
	 * 根据编号查订单
	 * @param order
	 * @return
	 */
	public Order OrderByNumber(Order order);
	
	/**
	 * 添加新订单
	 */
	public Serializable AddOrder(Order order);
	
	/**
	 * 添加订单列表
	 */
	public Serializable AddOrderList(OrderList order);
	
	/**
	 * 根据编号查询订单列表
	 */
	public List<OrderList> OrderListByOrderNumber(String ordernumber);
	
	/**
	 * 更新入库记录
	 */
	public void EnterWareHouse(String number);
	
	/**
	 * 根据产品number查询订单表中最后一条记录
	 */
	public OrderList SelectOrderListByIdDesc(String number);
}
