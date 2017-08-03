package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.BuytypeDao;
import com.haojie.pojo.Buytype;
import com.haojie.utils.HibernateUtils;

public class BuytypeImpl implements BuytypeDao {

	public List<Buytype> AllBuytype() {

		List<Buytype> rs = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Buytype";
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
	 */
	public Buytype BuytypeById(int id) {
		Buytype rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Buytype where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (Buytype) query.uniqueResult();

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
	 * 添加
	 */
	public void AddBuytype(Buytype b) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(b);
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
	 * 更新
	 */
	public void UpdateBuytype(Buytype b) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Buytype bt set bt.type=:type where id=:id";
			Query query = session.createQuery(hql)
					.setParameter("id", b.getId()).setParameter("type",
							b.getType());
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
	 * 根据
	 */
	public Buytype BuytypeBytype(String type) {
		Buytype rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Buytype where type=:type";
			Query query = session.createQuery(hql).setParameter("type", type);
			rs = (Buytype) query.uniqueResult();

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
