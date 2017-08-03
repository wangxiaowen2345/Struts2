package com.haojie.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.haojie.dao.WareDao;
import com.haojie.pojo.Allot;
import com.haojie.pojo.Department;
import com.haojie.pojo.ReturnedWare;
import com.haojie.pojo.WareHouse;
import com.haojie.pojo.WareRecord;
import com.haojie.pojo.Wares;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class WareImpl implements WareDao {

	/**
	 * 查询所有仓库
	 */
	public List<WareHouse> AllWareHouse() {

		List<WareHouse> rs = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareHouse";
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

	public List<Department> AllDepartment() {

		List<Department> rs = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Department";
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

	public List<Allot> AllAllot(Page page) {
		List<Allot> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Allot";
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

	public int AllotCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Allot";
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

	public List<Object> FastReturned(String fast, String wh) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.ordernumber,wr.productnumber,wr.count,ol.price,w.name,s.name as sname,s.id,wr.warehouse,a.name as aname from warerecord as wr,orderlist as ol,wares as w,suppliers as s,admin as a where (wr.douser=a.username and wr.ordernumber=ol.number and wr.productnumber=ol.productnumber and wr.productnumber=w.number and w.suppliers=s.id) and (wr.ordernumber like :fast or wr.productnumber like :fast or ol.price like :fast or w.name like :fast or s.name like :fast) and wr.istrue=1 and wr.warehouse=:wh order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast",
					"%" + fast + "%").setParameter("wh", wh);
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

	public void setWrIsfalse(String ordernum, String productnum) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord r set r.istrue=0 where r.productnumber=:productnumber and r.ordernumber=:ordernum";
			Query query = session.createQuery(hql).setParameter(
					"productnumber", productnum).setParameter("ordernum",
					ordernum);

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
	 * 根据仓库Id查询
	 */
	public WareHouse WareHouseById(int id) {
		WareHouse rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareHouse where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (WareHouse) query.uniqueResult();

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
	 * 根据仓库fId查询
	 */
	public WareRecord WareRecordByFid(int fid) {
		WareRecord rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where fid=:fid";
			Query query = session.createQuery(hql).setParameter("fid", fid);
			rs = (WareRecord) query.uniqueResult();

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
	 * 根据Id查询
	 */
	public Department DepartmentById(int id) {
		Department rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Department where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (Department) query.uniqueResult();

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
	 * 添加新仓库
	 */
	public void AddWareHouse(WareHouse wh) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(wh);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public void AddDepartment(Department d) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(d);
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
	 * 更新仓库
	 */
	public void UpdateWareHouse(WareHouse wh) {
		WareHouse rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareHouse wh set wh.name=:name where id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					wh.getId()).setParameter("name", wh.getName());
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
	}

	public void UpdateDepartment(Department b) {
		Department rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update Department wh set wh.departmentname=:departmentname where id=:id";
			Query query = session.createQuery(hql)
					.setParameter("id", b.getId()).setParameter(
							"departmentname", b.getDepartmentname());
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
	 * 根据名字查仓库
	 */
	public WareHouse WareHouseByName(String name) {
		WareHouse rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareHouse where name=:name";
			Query query = session.createQuery(hql).setParameter("name", name);
			rs = (WareHouse) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public Department DepartmentByName(String name) {
		Department rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Department where departmentname=:departmentname";
			Query query = session.createQuery(hql).setParameter(
					"departmentname", name);
			rs = (Department) query.uniqueResult();

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
	 * 向商品库添加新商品
	 */
	public Serializable AddWares(Wares w) {
		Transaction tx = null;
		Session session = null;
		Serializable i = 0;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			i = session.save(w);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return i;
	}

	/**
	 * 模糊查询商品
	 */
	public List<Wares> FastSelectWares(String w, int suppliers) {
		List<Wares> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select w.id,w.number,w.name,w.specifications,m.name as models,w.unit from wares as w,models as m "
					+ "where w.models=m.id and"
					+ "(w.number like :number or w.name like :name or w.specifications like :specifications) and w.suppliers=:suppliers";
			Query query = session.createSQLQuery(hql).setParameter("name",
					"%" + w + "%")
					.setParameter("specifications", "%" + w + "%")
					.setParameter("number", "%" + w + "%").setParameter(
							"suppliers", suppliers);

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

	public List<Object[]> FastOutWareList(String fast) {
		List<Object[]> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.productnumber,w.name,w.specifications,wr.dotype,wr.getuser,wr.outprice,wr.docount,wh.name as whname,w.unit,wr.department from wares as w,warerecord as wr,warehouse as wh where (w.number=wr.productnumber and wr.warehouse=wh.id) and (dotype=1 or dotype=2) and (wh.name like :fast or wr.productnumber like :fast or w.name like :fast or wr.dotype like :fast or wr.getuser like :fast or wr.outprice like :fast or wr.docount like :fast) order by time desc";
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

	public List<Object> FastAllot(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select a.productnumber,a.ordernumber,w.name,w.specifications,a.count,o.price,wh.name as nameo,who.name as namet from allot as a,Wares as w,orderlist as o,warehouse as wh,warehouse as who where (a.productnumber=w.number and a.productnumber=o.productnumber and a.ordernumber=o.number and wh.id=a.callout and who.id=a.callin) and (a.productnumber like :fast or a.ordernumber like :fast or w.name like :fast or w.specifications like :fast) order by time desc";
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
	 * 根据品名 规格 车型 生成厂家 供应商查询商品
	 */
	public Wares SelectWares(Wares w) {
		Wares rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Wares "
					+ "where "
					+ "name=:name and unit=:unit and specifications=:specifications "
					+ "and models=:models and madein=:madein and suppliers=:suppliers";
			Query query = session.createQuery(hql).setParameter("name",
					w.getName()).setParameter("unit", w.getUnit())
					.setParameter("specifications", w.getSpecifications())
					.setParameter("models", w.getModels()).setParameter(
							"madein", w.getMadein()).setParameter("suppliers",
							w.getSuppliers());

			rs = (Wares) query.uniqueResult();

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
	 * 根据Id查询商品
	 */
	public Wares SelectWaresById(Wares w) {
		Wares rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Wares where id=:id";
			Query query = session.createQuery(hql)
					.setParameter("id", w.getId());
			rs = (Wares) query.uniqueResult();

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
	 * 根据货号查询商品
	 */
	public Wares SelectWaresByNumber(Wares w) {
		Wares rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Wares where number=:number";
			Query query = session.createQuery(hql).setParameter("number",
					w.getNumber());
			rs = (Wares) query.uniqueResult();

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
	 * 根据供应商查询商品
	 */
	public List<Wares> SelectWaresBySuppliers(Wares w) {
		List<Wares> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from Wares where suppliers=:suppliers order by number desc";
			Query query = session.createQuery(hql).setParameter("suppliers",
					w.getSuppliers());
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
	 * 添加仓库记录
	 */
	public Serializable AddWareRecord(WareRecord r) {
		Transaction tx = null;
		Session session = null;
		Serializable i = 0;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			i = session.save(r);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return i;
	}

	/**
	 * 添加仓库记录
	 */
	public Serializable AddAllot(Allot a) {
		Transaction tx = null;
		Session session = null;
		Serializable i = 0;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			i = session.save(a);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return i;
	}

	/**
	 * 添加退货记录
	 */
	public Serializable AddReturnedWareRecord(ReturnedWare rw) {
		Transaction tx = null;
		Session session = null;
		Serializable i = 0;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			i = session.save(rw);
			tx.commit();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}
		return i;
	}

	public WareRecord SelectOneWareByTimeDesc(String number) {
		WareRecord rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where productnumber=:number order by time desc";
			Query query = session.createQuery(hql).setParameter("number",
					number).setFirstResult(0).setMaxResults(1);
			rs = (WareRecord) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public List<Object[]> SelectWareListByWhere(int warehouse, String key) {
		Transaction tx = null;
		Session session = null;
		List<Object[]> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "";
			Query query;
			if (warehouse == 0 && key.equals("")) {
				hql = "Select wr.id,wr.count,w.name,wr.productnumber,wr.ordernumber,w.specifications,wr.docount,wr.douser,wr.getuser,wr.time,wr.warehouse,w.unit"
						+ " from warerecord as wr ,wares as w where wr.productnumber=w.number  and istrue=1 "
						+ " order by wr.time desc";
				query = session.createSQLQuery(hql);
			} else if (warehouse != 0 && key.equals("")) {
				hql = "Select wr.id,wr.count,w.name,wr.productnumber,wr.ordernumber,w.specifications,wr.docount,wr.douser,wr.getuser,wr.time,wr.warehouse,w.unit"
						+ " from warerecord as wr ,wares as w where wr.productnumber=w.number and istrue=1 and "
						+ " wr.warehouse=:warehouse order by wr.time desc";
				query = session.createSQLQuery(hql).setParameter("warehouse",
						warehouse);
			} else if (warehouse != 0 && !key.equals("")) {
				hql = "Select wr.id,wr.count,w.name,wr.productnumber,wr.ordernumber,w.specifications,wr.docount,wr.douser,wr.getuser,wr.time,wr.warehouse,w.unit"
						+ " from warerecord as wr ,wares as w where "
						+ "wr.productnumber=w.number and (w.specifications like :key or w.name like :key or w.number like :key or w.madein like :key)  and istrue=1"
						+ " and wr.warehouse=:warehouse order by wr.time desc";
				query = session.createSQLQuery(hql).setParameter("warehouse",
						warehouse).setParameter("key", "%" + key + "%");
			} else {
				hql = "Select wr.id,wr.count,w.name,wr.productnumber,wr.ordernumber,w.specifications,wr.docount,wr.douser,wr.getuser,wr.time,wr.warehouse,w.unit"
						+ " from warerecord as wr ,wares as w where "
						+ "wr.productnumber=w.number and (w.specifications like :key or w.name like :key or w.number like :key or w.madein like :key)  and istrue=1"
						+ " order by wr.time desc";
				query = session.createSQLQuery(hql).setParameter("key",
						"%" + key + "%");
			}

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

	public void OutWareHouseByProductNumber(WareRecord w) {

	}

	public List<WareRecord> OutWareListByPrice(String productnumber, int price) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where productnumber=:productnumber and outprice=:price order by time desc";
			Query query = session.createQuery(hql).setParameter(
					"productnumber", productnumber).setParameter("price",
					(double) price);

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

	public int OutWareListByDotypeCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where dotype=1 or dotype=2";
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
	public WareRecord FindNewId() {
		Transaction tx = null;
		Session session = null;
		WareRecord rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord order by id desc";
			Query query = session.createQuery(hql);

			rs = (WareRecord) query.list().get(0);

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public List<WareRecord> OutWareListByDotype(Page page) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where dotype=1 or dotype=2 order by time desc";
			Query query = session.createQuery(hql).setMaxResults(
					page.getEveryPage()).setFirstResult(page.getBeginIndex());
			;

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

	public WareRecord OutWareListByDotype(int id) {
		Transaction tx = null;
		Session session = null;
		WareRecord rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where id=:id order by productnumber desc";
			Query query = session.createQuery(hql).setParameter("id", id);

			rs = (WareRecord) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public int EmployeeOutByDotypeCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where dotype=2";
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

	public List<WareRecord> EmployeeOutByDotype(Page page) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where dotype=2 order by time desc";
			Query query = session.createQuery(hql).setMaxResults(
					page.getEveryPage()).setFirstResult(page.getBeginIndex());
			;

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

	public List<Object> InventoryList(Page page, int value1) {
		Transaction tx = null;
		Session session = null;
		List<Object> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where istrue=1 and warehouse=:value1 order by productnumber desc";
			Query query = session.createQuery(hql).setParameter("value1",
					value1).setMaxResults(page.getEveryPage()).setFirstResult(
					page.getBeginIndex());
			;

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

	public int InventoryCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where istrue=1 order by time desc";
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

	public List<WareRecord> SelectWareListByNumber(String number) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where productnumber=:number  and istrue=1 order by time desc";
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

	public List<WareRecord> SelectWareListByWareHouse(int wh) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where warehouse=:wh  and istrue=1 order by time desc";
			Query query = session.createQuery(hql).setParameter("wh", wh);

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
	 * 根据id查记录
	 * 
	 * @param id
	 * @return
	 */
	public WareRecord SelectWareListById(int id) {
		Transaction tx = null;
		Session session = null;
		WareRecord rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);

			rs = (WareRecord) query.uniqueResult();

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
	 * 根据订单号货号查询记录
	 * 
	 * @param number
	 * @param productnumber
	 * @return
	 */
	public WareRecord SelectWareRecordByNumberAndProcuct(String number,
			String productnumber, int dotype) {
		Transaction tx = null;
		Session session = null;
		WareRecord rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where ordernumber=:ordernumber and productnumber=:productnumber and dotype=:dotype";
			Query query = session.createQuery(hql).setParameter("ordernumber",
					number).setParameter("productnumber", productnumber)
					.setParameter("dotype", dotype);

			rs = (WareRecord) query.uniqueResult();
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
	 * 根据订单号货号查询有效记录
	 * 
	 * @param number
	 * @param productnumber
	 * @return
	 */
	public WareRecord SelectWareRecordIstureByNumberAndProcuct(String number,
			String productnumber) {
		Transaction tx = null;
		Session session = null;
		WareRecord rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where ordernumber=:ordernumber and productnumber=:productnumber and istrue=1";
			Query query = session.createQuery(hql).setParameter("ordernumber",
					number).setParameter("productnumber", productnumber);

			rs = (WareRecord) query.uniqueResult();
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}
		return rs;
	}

	public List<WareRecord> OutWareHouseRecord(String repairnum) {
		List<WareRecord> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where getuser=:repairnum";
			Query query = session.createQuery(hql).setParameter("repairnum",
					repairnum);
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

	public List<WareRecord> OutWareHouseRecordByTypeAndRepairNum(
			String repairnum, int type) {
		List<WareRecord> rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where getuser=:repairnum and dotype=:dotype";
			Query query = session.createQuery(hql).setParameter("repairnum",
					repairnum).setParameter("dotype", type);
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
	 * 出库
	 * 
	 */
	public void OutWareRecord(WareRecord wr) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(wr);
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
	 * 根据ID查仓库记录
	 */
	public WareRecord WareRecordById(int id) {
		WareRecord rs = null;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			rs = (WareRecord) query.uniqueResult();

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
	 * 根据ID更新仓库记录
	 */
	public void UpdateWareRecordById(WareRecord wr) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.istrue=:istrue where w.id=:id";
			Query query = session.createQuery(hql).setParameter("id",
					wr.getId()).setParameter("istrue", wr.getIstrue());
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
	 * 根据ID更新数量
	 */
	public void UpdateWareRecordCountById(int id, double wc) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.count=:wc where w.id=:id";
			Query query = session.createQuery(hql).setParameter("id", id)
					.setParameter("wc", wc);
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
	 * 根据ID更新dotype
	 */
	public void UpdateWareRecordDotypeById(int id, int dotype) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.dotype=:dotype where w.id=:id";
			Query query = session.createQuery(hql).setParameter("id", id)
					.setParameter("dotype", dotype);
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
	 * 根据ID更新数量
	 */
	public void UpdateWareRecordAllById(int id, double wcc) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.count=0,w.dotype=4,w.docount=:wcc,w.istrue=0 where w.id=:id";
			Query query = session.createQuery(hql).setParameter("wcc", wcc).setParameter("id", id);
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

	@Test
	public void a1() {
		UpdateWareRecordAllById(74, 37);
	}

	/**
	 * 根据订单号和货号更新所有记录
	 */
	public void UpdateWareRecordByOrderAndPro(WareRecord wr) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.dotype=:dotype,w.fid=:fid,w.docount=:docount,w.count=:count,w.getuser=:getuser,w.time=:time,w.istrue=:istrue where w.ordernumber=:ordernumber and w.productnumber=:productnumber and istrue=1";
			Query query = session.createQuery(hql).setParameter("dotype",
					wr.getDotype()).setParameter("docount", wr.getDocount())
					.setParameter("fid", wr.getFid()).setParameter("count",
							wr.getCount()).setParameter("getuser",
							wr.getGetuser()).setParameter("time", wr.getTime())
					.setParameter("istrue", wr.getIstrue()).setParameter(
							"ordernumber", wr.getOrdernumber()).setParameter(
							"productnumber", wr.getProductnumber());
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
	 * 根据订单号和货号更新所有记录
	 */
	public void UpdateWareRecordAll(WareRecord wr) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "update WareRecord w set w.fid=:fid,w.count=:count,w.time=:time,w.istrue=:istrue where w.id=:id";
			Query query = session.createQuery(hql).setParameter("fid",
					wr.getFid()).setParameter("count", wr.getCount())
					.setParameter("time", wr.getTime()).setParameter("istrue",
							wr.getIstrue()).setParameter("id", wr.getId());
			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public void DeleteWareRecordById(int id) {
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "delete WareRecord w where w.id=:id";
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

	public String DeleteWareRecord(int id) {
		Transaction tx = null;
		Session session = null;
		String rs = null;
		List result = null ;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String h = "select * from WareRecord w where w.id=:id and w.istrue=:is";
			Query q = session.createSQLQuery(h).setParameter("id", id).setParameter("is", 1);
			result = q.list();
			
			if(result.size()==0){
				String hql = "delete WareRecord w where w.id=:id";
				Query query = session.createQuery(hql).setParameter("id", id);
				query.executeUpdate();
				rs="1";
			}
			else rs="0";
			

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
			
		}
		return rs;
	}
	public List<Object> FastConsumptionList(String fast, int id, int wh) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.productnumber,wr.ordernumber,wr.count,w.unit,w.specifications,ol.price,w.name,wh.name as whname,a.name as aname from WareRecord as wr,Wares as w,warehouse as wh,admin as a,orderlist as ol where (wr.productnumber=w.number and wr.productnumber=ol.productnumber and wr.ordernumber=ol.number and a.id=:id and wr.warehouse=:wh and wr.warehouse=wh.id) and (w.name like :fast or wh.name like :fast or wr.productnumber like :fast) and wr.istrue=1 order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast",
					"%" + fast + "%").setParameter("id", id).setParameter("wh",
					wh);
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

	public List<WareRecord> SelectWareListByIsture(int wh) {
		Transaction tx = null;
		Session session = null;
		List<WareRecord> rs = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from WareRecord where istrue=1 and warehouse=:wh order by productnumber desc";
			Query query = session.createQuery(hql).setParameter("wh", wh);
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

	@Test
	public void a() {
		System.out.println(SelectWareListByIsture(2).size());
	}

	public List<Object> FastReturnedTime1(String fast1, String wh) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.ordernumber,wr.productnumber,wr.count,ol.price,w.name,s.name as sname,s.id,wr.warehouse,a.name as aname from warerecord as wr,admin as a,orderlist as ol,wares as w,suppliers as s where (wr.douser=a.username and wr.ordernumber=ol.number and wr.productnumber=ol.productnumber and wr.productnumber=w.number and w.suppliers=s.id) and wr.time like :fast1 and wr.istrue=1 and wr.warehouse=:wh order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast1",
					"%" + fast1 + "%").setParameter("wh", wh);
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

	public List<Object> FastReturnedTime1(String fast1, String fast2, String wh) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.ordernumber,wr.productnumber,wr.count,ol.price,w.name,s.name as sname,s.id,wr.warehouse,a.name as aname from warerecord as wr,orderlist as ol,wares as w,admin as a,suppliers as s where (wr.douser=a.username and wr.ordernumber=ol.number and wr.productnumber=ol.productnumber and wr.productnumber=w.number and w.suppliers=s.id) and (wr.time between :fast1 and :fast2) and wr.istrue=1 and wr.warehouse=:wh order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("fast1",
					fast1).setParameter("fast2", fast2).setParameter("wh", wh);
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

	public List<Object> FastInventory(String fast, int value2) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select wr.productnumber,w.name,w.specifications,wr.count,w.unit,wr.outprice,wh.name as whname,s.name as sname,ol.price,wr.id from warehouse as wh,OrderList as ol,wares as w,warerecord as wr,admin as a,suppliers as s where (wr.productnumber=w.number and wr.productnumber=ol.productnumber and wr.ordernumber=ol.number and wr.warehouse=wh.id and w.suppliers=s.id and wr.douser=a.username and wr.warehouse=:value2) and (wr.productnumber like :fast or w.name like :fast or w.specifications like :fast or wr.count like :fast or wh.name like :fast or s.name like :fast) and wr.istrue=1 order by time desc";
			Query query = session.createSQLQuery(hql).setParameter("value2",
					value2).setParameter("fast", "%" + fast + "%");
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
