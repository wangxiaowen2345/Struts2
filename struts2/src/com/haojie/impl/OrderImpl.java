package com.haojie.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.OrderDao;
import com.haojie.pojo.Order;
import com.haojie.pojo.OrderList;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class OrderImpl implements OrderDao {

	public List<Order> AllOrder(Page page) {
		List<Order> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order ";
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

	public Order OrderById(Order order) {
		Transaction tx = null;
		Session session = null;
		Order rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order where id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					order.getId());
			rs = (Order) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public Order OrderById(int id) {
		Transaction tx = null;
		Session session = null;
		Order rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (Order) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public OrderList OrderListById(int id) {
		Transaction tx = null;
		Session session = null;
		OrderList rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from OrderList where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (OrderList) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public Order OrderByNumber(Order order) {
		Transaction tx = null;
		Session session = null;
		Order rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order where number=:number";
			Query query = session.createQuery(hql).setParameter("number",
					order.getNumber());
			rs = (Order) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public Order OrderByNumber(String number) {
		Transaction tx = null;
		Session session = null;
		Order rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order where number=:number";
			Query query = session.createQuery(hql).setParameter("number",
					number);
			rs = (Order) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public int OrderCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Order";
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

	public Serializable AddOrder(Order order) {
		Transaction tx = null;
		Session session = null;
		Serializable rs;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			rs = session.save(order);
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

	public Serializable AddOrderList(OrderList order) {
		Transaction tx = null;
		Session session = null;
		Serializable rs;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			rs = session.save(order);
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

	public List<OrderList> OrderListByOrderNumber(String ordernumber) {
		List<OrderList> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from OrderList where number=:ordernumber";
			Query query = session.createQuery(hql).setParameter("ordernumber",
					ordernumber);
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

	/**
	 * 
	 * 
	 */
	public void UpdatePri(double price, int id) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Order o set o.alltotalprice=:price where id=:id";
			Query query = session.createQuery(hql).setParameter("price", price)
					.setParameter("id", id);
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
	 * »∑»œ»Îø‚
	 * 
	 * @param number
	 */
	public void EnterWareHouse(String number) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Order o set o.tag=1 where number=:ordernumber";
			Query query = session.createQuery(hql).setParameter("ordernumber",
					number);
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public OrderList SelectOrderListByIdDesc(String number) {

		OrderList rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from OrderList where productnumber=:number order by id desc";
			Query query = session.createQuery(hql).setParameter("number",
					number).setFirstResult(0).setMaxResults(1);
			rs = (OrderList) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;

	}

	public List<Object> FastOrder(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select o.id,o.number,s.name,o.alltotalprice,o.time,o.tag from orderinfo as o,suppliers as s where o.suppliers=s.id and (o.number like :fast or s.name like :fast or o.alltotalprice like :fast) order by time acs";
			Query query = session.createSQLQuery(hql).setParameter("fast",
					"%" + fast + "%");
			result = query.list();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}
		finally{
			//HibernateUtils.closeSession(session);
		}
		return result;
	}

	public List<Object> FastOrderTime(String fast1, String fast2) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select o.id,o.number,s.name,o.alltotalprice,o.time,o.tag from orderinfo as o,suppliers as s where o.suppliers=s.id and (o.time between :fast1 and :fast2) order by time acs";
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

	public List<Object> FastOrderTime1(String fast1) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			String hql = "select o.id,o.number,s.name,o.alltotalprice,o.time,o.tag from orderinfo as o,suppliers as s where o.suppliers=s.id and (o.time like :fast1) order by time acs";
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

	public void DeleteOne(int id) {

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete OrderList o where o.id=:id";
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

	public OrderList OrderListByProductNumberAndNumber(String productnumber,
			String number) {
		OrderList resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from OrderList where productnumber=:productnumber and number=:number";
			Query query = session.createQuery(hql).setParameter(
					"productnumber", productnumber).setParameter("number",
					number);
			resultList = (OrderList) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return resultList;
	}

}
