package com.haojie.dao;

import java.util.Date;

import com.haojie.pojo.User;


public interface UserDao {
	/**
	 * 添加新纪录
	 * 
	 * @param user
	 * 
	 */
	public void AddUser(User user);

	/**
	 * 按照会员号码查找记录
	 * 
	 * @param nsernum
	 * @return
	 */
	public User SelectUserByUsernum(String usernum);

	/**
	 * 按照姓名查找记录
	 * 
	 * @param name
	 * @return
	 */
	public User SelectUserByName(String name);

	/**
	 * 模糊查询
	 * 
	 * @param para
	 * @return
	 */
	public User SelectUserByPara(String para);
	
	/**
	 * 更新余额和到期时间
	 */
	public void UpdateUserBalance(String num,double balance,Date expdate);

}