package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.PowerDao;
import com.haojie.pojo.Function;
import com.haojie.pojo.Power;
import com.haojie.pojo.PowerAss;
import com.haojie.pojo.PowerFuntion;
import com.haojie.utils.HibernateUtils;

public class PowerImpl implements PowerDao {

	/**
	 * 根据ID查询权限组列表
	 * 
	 * @param id
	 * @return
	 */
	public Power getPowerNameById(String id) {

		Power pw = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Power where id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					Integer.parseInt(id));
			pw = (Power) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return pw;
	}

	/**
	 * 获取所有的权限组列表
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Power> getAllPower() {

		List<Power> list = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Power";
			Query query = session.createQuery(hql);
			list = (List<Power>) query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return list;

	}

	public boolean Power(int PowerId , int FunctionId) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from PowerAss where powerid=:powerid and functionid=:functionid";
			Query query = session.createQuery(hql).setParameter("powerid", PowerId).setParameter("functionid", FunctionId);
			if(query.uniqueResult()!=null)
				return true;

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return false;
	}

	public List<PowerFuntion> PowerFunctionByPowerId(int id) {
		
		
		List<PowerFuntion> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String sql = "SELECT power.power, function.function ,function.remark,powerass.functionid ,powerass.powerid "
			+ "FROM power , function , powerass "
			+ "WHERE powerass.functionid = function.id and powerass.powerid = power.id and powerid=?";
			Query query = session.createSQLQuery(sql).setParameter(0, id);
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

	public void SavaPowerAss(PowerAss powerass) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			
			session.save(powerass);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		
	}

	public void SavePower(Power power) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			
			session.save(power);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		
	}

	public Power getPowerByName(String powername) {
		Power pw = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Power where power=:powername";
			Query query = session.createQuery(hql).setParameter("powername",
					powername);
			pw = (Power) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			e.printStackTrace();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return pw;
	}

	public void DeletePowerFunctionById(int id) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete PowerAss p where p.powerid=?";
			Query query = session.createQuery(hql).setParameter(0,
					id);
			query.executeUpdate();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			e.printStackTrace();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		
	}

	public void UpdatePowerById(Power power) {
		
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Power p set p.power=:power where p.id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					power.getId()).setParameter("power", power.getPower());
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
