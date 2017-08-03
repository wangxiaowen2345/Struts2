package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.ModelsDao;
import com.haojie.dao.WareDao;
import com.haojie.pojo.Models;
import com.haojie.pojo.WareHouse;
import com.haojie.utils.HibernateUtils;

public class ModelsImpl implements ModelsDao {

	/**
	 * 查询所有车型
	 */
	public List<Models> AllModels() {

		List<Models> rs = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Models";
			Query query = session.createQuery(hql);
			rs = query.list();

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
	 * 根据车型Id查询
	 */
	public Models ModelsById(int id) {
		Models rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Models where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (Models) query.uniqueResult();

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
	 * 添加新车型
	 */
	public void AddModels(Models wh) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(wh);
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
	 * 更新车型
	 */
	public void UpdateModels(Models wh) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Models wh set wh.name=:name where id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					wh.getId()).setParameter("name", wh.getName());
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
	 * 根据名字查车型
	 */
	public Models ModelsByName(String name) {
		Models rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Models where name=:name";
			Query query = session.createQuery(hql).setParameter("name", name);
			rs = (Models) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

}
