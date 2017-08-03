package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.RepairDao;
import com.haojie.pojo.Repair;
import com.haojie.pojo.RepairRecord;
import com.haojie.utils.HibernateUtils;

public class RepairImpl implements RepairDao {

	/**
	 * 维修建档
	 */
	public void AddRepair(Repair repair) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(repair);
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
	 * 根据编号查询维修档案
	 */
	public Repair RepairByNum(String num) {
		Repair rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Repair where repairnum=:repairnum";
			Query query = session.createQuery(hql).setParameter("repairnum",
					num);
			rs = (Repair) query.uniqueResult();

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
	 * 正在维修车辆
	 */
	public List<Repair> RepairIngList() {
		List<Repair> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Repair where state=:state order by time desc";
			Query query = session.createQuery(hql).setParameter("state", 0);
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

	public void DeleteRepair(String num) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete Repair r where r.repairnum=:num";
			Query query = session.createQuery(hql).setParameter("num", num);
			query.executeUpdate();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public RepairRecord RepairRecordByWRId(int id) {
		RepairRecord rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from RepairRecord where wrid=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (RepairRecord) query.uniqueResult();

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
	 * 维修资料建档
	 */
	public void AddRepairRecord(RepairRecord repairrecord) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(repairrecord);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public void DeleteRepairRecordById(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete RepairRecord w where w.id=:id";
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

	public List<Object> FastRepair(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select r.repairnum,c.carnum,r.contact,r.tel,r.time,r.state,r.repairmileage,r.type from car as c,repair as r where c.id=r.carid and (r.time like :fast or c.carnum like :fast or c.framenum like :fast or r.repairnum like :fast or r.tel like :fast or r.contact like :fast or r.customer like :fast or r.address like :fast) order by time desc";
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

	public List<Object> FastRepairTime(String fast1, String fast2) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select r.repairnum,c.carnum,r.contact,r.tel,r.time,r.state,r.repairmileage,r.type from car as c,repair as r where c.id=r.carid and(r.time between :fast1 and :fast2) order by time desc";
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

	public List<Object> FastRepairTime1(String fast1) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select r.repairnum,c.carnum,r.contact,r.tel,r.time,r.state,r.repairmileage,r.type from car as c,repair as r where c.id=r.carid and (r.time like :fast1) order by time desc";
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

	/**
	 * 维修车辆记录
	 */
	public List<Repair> RepairedList() {
		List<Repair> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Repair order by time desc";
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

	public List<RepairRecord> RepairRecordByRepairnum(String num, int type) {
		List<RepairRecord> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from RepairRecord where repairnum=:num and type=:type order by time desc";
			Query query = session.createQuery(hql).setParameter("num", num)
					.setParameter("type", type);
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

	public void UpdateRepairState(String num, int state, int cashflow) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Repair r set r.state=:state,r.cashflow=:cashflow where r.repairnum=:num";
			Query query = session.createQuery(hql).setParameter("state", state)
					.setParameter("cashflow", cashflow)
					.setParameter("num", num);
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
	 * 根据车辆维修档案
	 */
	public List<Repair> RepairByCarid(int carid) {
		List<Repair> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Repair where carid=:carid";
			Query query = session.createQuery(hql).setParameter("carid", carid);
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
}
