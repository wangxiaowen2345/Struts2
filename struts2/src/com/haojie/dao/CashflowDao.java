package com.haojie.dao;

import java.io.Serializable;
import java.util.List;

import com.haojie.pojo.Cashflow;

public interface CashflowDao {

	/**
	 * 添加流水
	 * 
	 * @param cf
	 * @return
	 */
	public Serializable AddCashflow(Cashflow cf);

	/**
	 * 根据NUM查流水
	 * 
	 * @param num
	 * @return
	 */
	public Cashflow CashFlowByNum(String num);

	/**
	 * 退货挂单
	 * 
	 * @return
	 */
	public List<Cashflow> ReturnedList();

	/**
	 * 根据Id查流水
	 * 
	 * @param num
	 * @return
	 */
	public Cashflow CashFlowById(int id);

	/**
	 * 挂单列表
	 */
	public List<Cashflow> ArrearsList();

	/**
	 * 根据id改isture
	 * 
	 * @param id
	 */
	public void IstrueById(int id);
}
