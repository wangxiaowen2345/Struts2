package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.AdminDao;
import com.haojie.dao.AdminNavDao;
import com.haojie.pojo.AdminNav;
import com.haojie.pojo.Admin;
import com.haojie.utils.HibernateUtils;

public class AdminImpl implements AdminDao, AdminNavDao {

	/**
	 * 后台登陆
	 * 
	 * @exception runtimeExcption
	 * 
	 * @author haojie
	 * 
	 */
	public Admin Login(Admin aus) {

		Admin resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Admin where username=:us and password=:pw";
			Query query = session.createQuery(hql).setParameter("us",
					aus.getUsername()).setParameter("pw", aus.getPassword());
			resultaus = (Admin) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}

	/**
	 * 后台用户通过用户名查询是否存在
	 */
	public Admin SelectAdminUserByName(Admin aus) {
		Admin resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Admin where username=:us";
			Query query = session.createQuery(hql).setParameter("us",
					aus.getUsername());
			resultaus = (Admin) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}

	/**
	 * 返回List<AdminNav>
	 */
	@SuppressWarnings("unchecked")
	public List<AdminNav> getAdminNav(String colid) {
		List<AdminNav> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from AdminNav where colid=?";
			Query query = session.createQuery(hql).setParameter(0, colid);
			resultList = query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultList;

	}

	/**
	 * 查询所有AdminUser
	 */
	public List<Admin> SelectAllAadminUser() {
		List<Admin> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Admin";
			Query query = session.createQuery(hql);
			resultList = query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultList;
	}

	/**
	 * 根据Id查询用户
	 */
	public Admin SelectAdminUserById(int id) {
		Admin resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Admin where id=:uid";
			Query query = session.createQuery(hql).setParameter("uid", id);
			resultaus = (Admin) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}

	public int ResetPassword(Admin admin) {
		Transaction tx = null;
		Session session = null;
		int rs;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Admin admin set admin.password=:password where id=:uid";
			Query query = session.createQuery(hql).setParameter("uid",
					admin.getId())
					.setParameter("password", admin.getPassword());
			rs = query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public int AdminRePassWord(String username, String newpassword) {
		Transaction tx = null;
		Session session = null;
		int rs;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Admin admin set admin.password=:password where username=:username";
			Query query = session.createQuery(hql).setParameter("username",
					username).setParameter("password", newpassword);
			rs = query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public void UpdateAdmin(Admin admin) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Admin admin set admin.power=:power , "
					+ "admin.name=:name ,admin.tel=:tel where admin.id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					admin.getId())
					.setParameter("power", admin.getPower()).setParameter(
							"name", admin.getName()).setParameter("tel",
							admin.getTel());
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public void AddAdmin(Admin admin) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(admin);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		
	}
	
	public Admin AdminUserByUsername(String username) {
		Admin resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Admin where username=:username";
			Query query = session.createQuery(hql).setParameter("username", username);
			resultaus = (Admin) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}


}
