package com.haojie.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.CarWashDao;
import com.haojie.pojo.CarWash;
import com.haojie.pojo.CarWashRecord;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class CarWashImpl implements CarWashDao {
	public void AddCarWash(CarWash carwash) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(carwash);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public List<Object> FastCarWashLoss(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select u.number,u.name,u.tel,u.kind,u.carnum,m.name as mname,u.expdate,u.balance,u.residuedegree,u.payment from CarWash as u,models as m where u.models=m.id and istrue=0 and (u.number like :fast or u.name like :fast or u.tel like :fast or u.kind like :fast or u.carnum like :fast or m.name like :fast) order by time desc";
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

	/**
	 * 挂失
	 */
	public void UpdateIsture(int uid) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update CarWash c set c.istrue=0 where id=:uid";
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

	/**
	 * 洗车卡挂失列表
	 */

	public List<CarWash> AllLossByTimeDesc(Page page) {
		List<CarWash> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash where istrue=0";
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

	public int LossCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash where istrue=0";
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

	public void AddCarWashRecord(CarWashRecord carwashrecord) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(carwashrecord);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public int CarWashCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash";
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

	public List<CarWash> AllCarWareByTimeDesc(Page page) {

		List<CarWash> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash where istrue=1";
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

	public CarWash SelectCarWashByNumber(String number) {
		CarWash resultaus = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash where number=:number";
			Query query = session.createQuery(hql).setParameter("number",
					number);
			resultaus = (CarWash) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultaus;
	}

	// public CarWash SelectCarWashByPara(String para) {
	// CarWash resultaus = null;
	//
	// Transaction tx = null;
	// Session session = null;
	// try {
	// session = HibernateUtils.getSession();
	// tx = session.beginTransaction();
	//
	// String hql =
	// "from CarWash where name like :upara or phone like :upara or number like :upara or usernum like :upara or citiaonum like :upara";
	// Query query = session.createQuery(hql).setParameter("upara",
	// "%" + para + "%");
	// resultaus = (CarWash) query.uniqueResult();
	//
	// } catch (Exception e) {
	// if (tx != null)
	// tx.commit();
	// throw new RuntimeException(e);
	//
	// }
	//
	// return resultaus;
	// }

	public List<CarWashRecord> SelectCarWashRecordConsumerByNumber(String number) {
		Transaction tx = null;
		Session session = null;
		List<CarWashRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWashRecord where number=:number  and dotype=0 order by time desc";
			Query query = session.createQuery(hql).setParameter("number",
					number);

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
	 * 按卡号查询消费记录
	 */
	public List<CarWashRecord> SelectCarWashRecordByNumber(String number) {
		Transaction tx = null;
		Session session = null;
		List<CarWashRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWashRecord where number=:number order by time desc";
			Query query = session.createQuery(hql).setParameter("number",
					number);

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

	public void UpdateCarWash(String num, Date expdate, int residuedegree) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update CarWash c set c.expdate=:expdate ,c.residuedegree=:residuedegree where number=:num";
			Query query = session.createQuery(hql).setParameter("num", num)
					.setParameter("residuedegree", residuedegree).setParameter(
							"expdate", expdate);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public void UpdateCarWashResidueDegree(int residuedegree, String num) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update CarWash c set c.residuedegree=:residuedegree where number=:num";
			Query query = session.createQuery(hql).setParameter(
					"residuedegree", residuedegree).setParameter("num", num);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public List<Object> FastCarWashList(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select number,name,tel,expdate,time,residuedegree from CarWash where (name like :fast or tel like :fast or number like :fast or residuedegree like :fast) order by time desc";
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

	public CarWash CarWashByNum(String num) {
		CarWash result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from CarWash where number=:num";
			Query query = session.createQuery(hql).setParameter("num", num);
			result = (CarWash) query.uniqueResult();

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
