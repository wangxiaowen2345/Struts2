package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Admin;

public interface AdminDao {

	/**
	 * 登陆查询
	 * 
	 * @param aus
	 * @return
	 */
	public Admin Login(Admin aus);

	/**
	 * 用户名查询
	 * 
	 * @param aus
	 * @return
	 */
	public Admin SelectAdminUserByName(Admin aus);

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<Admin> SelectAllAadminUser();

	/**
	 * 根据Id查询用户
	 * 
	 * @return
	 */
	public Admin SelectAdminUserById(int id);

	/**
	 * 重新设置密码
	 * 
	 * @param id
	 * @return
	 */
	public int ResetPassword(Admin admin);

	/**
	 * Admin用户修改密码
	 * 
	 * @param username
	 * @param newpassword
	 * @return
	 */
	public int AdminRePassWord(String username, String newpassword);

	/**
	 * 更新用户信息
	 * 
	 * @param admin
	 */
	public void UpdateAdmin(Admin admin);

	/**
	 * 添加新用户
	 * 
	 * @param admin
	 */
	public void AddAdmin(Admin admin);

	public Admin AdminUserByUsername(String username);

}
