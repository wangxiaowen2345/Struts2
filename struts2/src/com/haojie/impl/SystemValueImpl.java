package com.haojie.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.SystemValueDao;
import com.haojie.pojo.SystemValue;
import com.haojie.utils.HibernateUtils;

public class SystemValueImpl implements SystemValueDao {

	/**
	 * 查询系统参数
	 */
	public SystemValue SelectValue(SystemValue sv) {
		long startTime = System.currentTimeMillis();

		SystemValue rsv = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from SystemValue where keyname=:keyname";
			Query query = session.createQuery(hql).setParameter("keyname",
					sv.getKeyname());
			rsv = (SystemValue) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询系统参数" + sv.getKeyname() + "耗时："
				+ Float.toString(seconds) + " 秒");

		return rsv;
	}

}
