package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.PicDao;
import com.haojie.pojo.Pic;
import com.haojie.utils.HibernateUtils;

public class PicImpl implements PicDao {

	/**
	 * ²éÑ¯
	 */
	public List<Pic> SelectByCar(String carid) {
		List<Pic> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Pic where carid=:carid";
			Query query = session.createQuery(hql).setParameter("carid", carid);
			rs = query.list();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			////HibernateUtils.closeSession(session);
		}
		return rs;
	}

	@Test
	public void aa() {
		System.out.println(SelectByCar("0").size());
	}

	/**
	 * Ìí¼Ó
	 */
	public void AddPic(Pic p) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(p);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			////HibernateUtils.closeSession(session);
		}
	}

	/**
	 * É¾³ýÍ¼Æ¬
	 * 
	 * @param id
	 */
	public void DeletePic(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete Pic c where c.id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			////HibernateUtils.closeSession(session);
		}

	}
}
