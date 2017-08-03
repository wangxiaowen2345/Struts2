package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.SuppliersDao;
import com.haojie.pojo.Suppliers;
import com.haojie.utils.HibernateUtils;

public class SuppliersImpl implements SuppliersDao {

	/**
	 * 查询所有供货商列表
	 */
	@SuppressWarnings("unchecked")
	public List<Suppliers> SelectAllSupplies() {

		List<Suppliers> list = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Suppliers";
			Query query = session.createQuery(hql);
			list = (List<Suppliers>) query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return list;
	}

	public void UpdateSupplier(Suppliers supp) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Suppliers s set s.name=:name,s.tel=:tel,s.fastname=:fastname where s.id=:id";
			Query query = session.createQuery(hql).setParameter("name",
					supp.getName()).setParameter("tel", supp.getTel())
					.setParameter("fastname", supp.getFastname()).setParameter(
							"id", supp.getId());
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public boolean InsertSuppliers(Suppliers s) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(s);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return false;
	}

	public Suppliers SelectSuppliersByName(String name) {

		Suppliers rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Suppliers where name=:name";
			Query query = session.createQuery(hql).setParameter("name", name);
			rs = (Suppliers) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;

	}

	public Suppliers SelectSuppliersById(String id) {
		Suppliers rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Suppliers where id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					Integer.parseInt(id));
			rs = (Suppliers) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;

	}

	public List<Object> FastSup(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select id,name,tel,fastname from suppliers where (name like :fast or tel like :fast or fastname like :fast)";
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
}
