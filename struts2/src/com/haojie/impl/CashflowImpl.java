package com.haojie.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.CashflowDao;
import com.haojie.pojo.Arrears;
import com.haojie.pojo.Cashflow;
import com.haojie.utils.HibernateUtils;

public class CashflowImpl implements CashflowDao {

	/**
	 * 添加流水记录
	 */
	public Serializable AddCashflow(Cashflow cf) {
		Serializable rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			rs = session.save(cf);
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

	public Cashflow CashFlowByNum(String num) {
		Cashflow rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Cashflow where number=:num order by time desc";
			Query query = session.createQuery(hql).setParameter("num", num);
			query.setMaxResults(1);
			rs = (Cashflow) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public Serializable AddArrears(Arrears ar) {
		Serializable rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			rs = session.save(ar);
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

	public List<Cashflow> ArrearsList() {
		List<Cashflow> rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Cashflow where paytype=3 and istrue=0 and type=1 and ordertype='repair'";
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

	public List<Cashflow> ReturnedList() {
		List<Cashflow> rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Cashflow where paytype=3 and istrue=0 and type=1 and ordertype='returned'";
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

	public Cashflow CashFlowById(int id) {
		Cashflow rs;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Cashflow where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (Cashflow) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public void IstrueById(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Cashflow c set c.istrue=2 where c.id=:id";
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

	public void DeleteInfo(String num) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete Cashflow c where c.number=:num and c.ordertype =:ordertype";
			Query query = session.createQuery(hql).setParameter("num", num)
					.setParameter("ordertype", "repair");
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
