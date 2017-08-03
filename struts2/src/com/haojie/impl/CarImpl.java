package com.haojie.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.CarDao;
import com.haojie.pojo.Car;
import com.haojie.pojo.FastCarRecord;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class CarImpl implements CarDao {

	public List<Car> AllCarByTimeDesc(Page page) {
		List<Car> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where buytype<>5 order by orderid";
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

	public List<Car> CarByTimeDesc(Page page) {
		List<Car> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where buytype=5 order by orderid";
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

	public List<Car> SelfCarByTimeDesc(Page page) {
		List<Car> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where buytype!=5 order by orderid";
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

	public void DeleteCar(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete Car c where c.id=:id";
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

	public void DeleteCarUser(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete FastCarRecord c where c.id=:id";
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

	/**
	 * 根据车牌号查询使用人
	 */
	public List<FastCarRecord> FastCarRecordByCarnum(String carnum) {
		List<FastCarRecord> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarRecord where carnum=:carnum";
			Query query = session.createQuery(hql).setParameter("carnum",
					carnum);
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

	public int CarCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car  where buytype<>5";
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

	public int CarCountLack() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where buytype=5";
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

	public Car CarById(int id) {
		Car result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			result = (Car) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public Serializable AddCar(Car car) {

		Serializable result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(car);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public Serializable AddFastCarRecord(FastCarRecord fc) {

		Serializable result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(fc);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public Car CarByNum(String num) {
		Car result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Car where carnum=:carnum";
			Query query = session.createQuery(hql).setParameter("carnum", num);
			result = (Car) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public void UpdateCar(Car car) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Car c "
					+ "set c.framenum=:framenum,c.model=:model,c.beizhu=:beizhu,c.registartime=:registartime,"
					+ "c.engine=:engine,c.orderid=:orderid,c.exptime=:exptime,c.shangpai=:shangpai,"
					+ "c.examinetime=:examinetime,c.usename=:usename,c.tel=:tel,c.phone=:phone,"
					+ "c.buytype=:buytype,c.time=:time,c.douser=:douser,c.color=:color where c.id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					car.getId()).setParameter("color", car.getColor())
					.setParameter("framenum", car.getFramenum()).setParameter(
							"model", car.getModel()).setParameter(
							"registartime", car.getRegistartime())
					.setParameter("engine", car.getEngine()).setParameter(
							"orderid", car.getOrderid()).setParameter(
							"exptime", car.getExptime()).setParameter(
							"shangpai", car.getShangpai()).setParameter(
							"examinetime", car.getExaminetime()).setParameter(
							"beizhu", car.getBeizhu()).setParameter("usename",
							car.getUsename()).setParameter("tel", car.getTel())
					.setParameter("phone", car.getPhone()).setParameter("time",
							car.getTime()).setParameter("douser",
							car.getDouser()).setParameter("buytype",
							car.getBuytype());
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public List<Object> FastCar(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select c.id,c.orderid,c.carnum,c.framenum,m.name,c.time,c.registartime,c.exptime,b.type,c.usename,c.color from car as c,models as m,buytype as b where c.model=m.id and c.buytype=b.id and (c.carnum like :fast or c.framenum like :fast or m.name like :fast or c.usename like :fast) order by time desc";
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
			String hql = "select c.id,c.orderid,c.carnum,c.framenum,m.name,c.time,c.registartime,c.exptime,b.type,c.usename,c.color from car as c,models as m,buytype as b where c.model=m.id and c.buytype=b.id and (c.registartime between :fast1 and :fast2) and (c.exptime between :fast1 and :fast2) order by time desc";
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
			String hql = "select c.id,c.orderid,c.carnum,c.framenum,m.name,c.time,c.registartime,c.exptime,b.type,c.usename,c.color from car as c,models as m,buytype as b where c.model=m.id and c.buytype=b.id and (c.registartime like :fast1) order by time desc";
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
