package com.haojie.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.UserDao;
import com.haojie.pojo.User;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class UserImpl implements UserDao {
	/**
	 * 添加新纪录
	 */
	public void AddUser(User user) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(user);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	/**
	 * 按照姓名查找记录
	 */
	public User SelectUserByName(String name) {
		User resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where name=:uname and isture=1 ";
			Query query = session.createQuery(hql).setParameter("uname", name);
			resultaus = (User) query.uniqueResult();

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
	 * 模糊查询
	 */
	public User SelectUserByPara(String para) {
		User resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			String hql = "from User where isture=1 and name like :upara or phone like :upara or address like :upara or usernum like :upara or citiaonum like :upara";
			Query query = session.createQuery(hql).setParameter("upara",
					"%" + para + "%");
			resultaus = (User) query.uniqueResult();

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
	 * 按照会员号码查找记录
	 */
	public User SelectUserByUsernum(String usernum) {
		User resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where usernum=:uusernum and isture=1";
			Query query = session.createQuery(hql).setParameter("uusernum",
					usernum);
			resultaus = (User) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}

	@Test
	public void a() {
		System.out.println(SelectUserByUsernum("2"));
	}

	public int UserCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where isture=1";
			Query query = session.createQuery(hql);
			rs = query.list().size();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public int LossCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where isture=0";
			Query query = session.createQuery(hql);
			rs = query.list().size();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	/**
	 * 会员列表
	 */

	public List<User> AllUserByTimeDesc(Page page) {
		List<User> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where isture=1";
			Query query = session.createQuery(hql).setMaxResults(
					page.getEveryPage()).setFirstResult(page.getBeginIndex());
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
	 * 会员卡挂失列表
	 */

	public List<User> AllLossByTimeDesc(Page page) {
		List<User> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from User where isture=0";
			Query query = session.createQuery(hql).setMaxResults(
					page.getEveryPage()).setFirstResult(page.getBeginIndex());
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

	public List<Object> FastVipList(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select name,phone,address,usernum,expdate,balance,douser from user where isture=1 and (name like :fast or phone like :fast or address like :fast or usernum like :fast) order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast",
					"%" + fast + "%");
			result = query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public List<Object> FastUserLoss(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select u.usernum,u.name,u.phone,u.kind,u.carnum,m.name as mname,u.expdate,u.balance,u.payment from user as u,models as m where u.models=m.id and isture=0 and (u.usernum like :fast or u.name like :fast or u.phone like :fast or u.kind like :fast or u.carnum like :fast or m.name like :fast) order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast",
					"%" + fast + "%");
			result = query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public void UpdateUserBalance(String num, double balance, Date expdate) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update User u set u.balance=:balance ,u.expdate=:expdate where usernum=:num";
			Query query = session.createQuery(hql).setParameter("num", num)
					.setParameter("balance", balance).setParameter("expdate",
							expdate);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	/**
	 * 挂失
	 */
	public void UpdateIsture(int uid) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update User u set u.isture=0 where id=:uid";
			Query query = session.createQuery(hql).setParameter("uid", uid);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

}
