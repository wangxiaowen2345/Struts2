package com.haojie.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.PurchaseDao;
import com.haojie.pojo.Purchase;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class PurchaseImpl implements PurchaseDao {

	public List<Purchase> PurchaseList(Page page) {
		List<Purchase> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Purchase order by time";
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

	public Purchase PurchaseById(int id) {
		Purchase result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Purchase where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			result = (Purchase) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public Serializable AddPurchase(Purchase p) {

		Serializable rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			rs = session.save(p);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	@Test
	public void a() {
		Purchase p = new Purchase();
		p.setMaterial("12");
		p.setCount(12);
		p.setUseto("23423");
		p.setProposer("admin");
		p.setAuditor(0);
		p.setTime(new Date());
		AddPurchase(p);
	}

	public void AuditorById(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Purchase c set c.auditor=1 where c.id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			query.executeUpdate();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public int PurchaseCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Purchase";
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

	public List<Object> FastPurchase(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select p.count,p.material,p.useto,a.name,p.time,p.auditor,p.id,p.unit,p.specifications,m.name as mname,p.madein,p.price from purchase as p,admin as a,models as m where p.proposer=a.username and p.models=m.id and (a.name like :fast or p.material like :fast or p.useto like :fast or p.count like :fast) order by time desc";
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

	public List<Object> FastTime(String fast1, String fast2) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select p.count,p.material,p.useto,a.name,p.time,p.auditor,p.id,p.unit,p.specifications,m.name as mname,p.madein,p.price from purchase as p,admin as a,models as m where p.proposer=a.username and p.models=m.id and (p.time between :fast1 and :fast2) order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast1",
					fast1).setParameter("fast2", fast2);
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

	public List<Object> FastTime1(String fast1) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select p.count,p.material,p.useto,a.name,p.time,p.auditor,p.id,p.unit,p.specifications,m.name as mname,p.madein,p.price from purchase as p,admin as a,models as m where p.proposer=a.username and p.models=m.id and (p.time like :fast1) order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast1",
					"%" + fast1 + "%");
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
