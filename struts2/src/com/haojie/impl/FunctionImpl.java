package com.haojie.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.FunctionDao;
import com.haojie.pojo.Function;
import com.haojie.utils.HibernateUtils;

public class FunctionImpl implements FunctionDao{

	public Function SelectFunctionByName(String FunctionName) {
		long startTime = System.currentTimeMillis();

		Function ft = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Function where function=:function";
			Query query = session.createQuery(hql).setParameter("function",
					FunctionName);
			ft = (Function) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询Function参数" + FunctionName + "耗时："
				+ Float.toString(seconds) + " 秒");

		return ft;
	}

	@SuppressWarnings("unchecked")
	public List<Function> MenuFunction() {
		
		List<Function> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Function where fid=0";
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

	public int SelectFunctionFid(String name) {
		Function ft = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Function where function=:function";
			Query query = session.createQuery(hql).setParameter("function",
					name);
			ft = (Function) query.uniqueResult();
			if(ft==null)
				return -1;
			if(ft.getFid()==0)
				return ft.getId();
			else 
				return ft.getFid();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	
	
	

}
