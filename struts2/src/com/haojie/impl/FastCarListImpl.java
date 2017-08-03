package com.haojie.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.haojie.dao.FastCarListDao;
import com.haojie.pojo.FastCarList;
import com.haojie.pojo.FastCarRecord;
import com.haojie.utils.HibernateUtils;
import com.haojie.utils.Page;

public class FastCarListImpl implements FastCarListDao {

	public List<FastCarList> AllPublicFastCarListByTimeDesc(Page page) {
		List<FastCarList> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where cartype=0 order by time";
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

	public List<FastCarList> AllPrivateFastCarListByTimeDesc(Page page) {
		List<FastCarList> resultList = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where cartype=1 order by time";
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

	public int PublicFastCarCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where cartype=0";
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

	public FastCarList FastCarListById(int id) {
		FastCarList result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where id=:id";
			Query query = session.createQuery(hql).setParameter("id", id);
			result = (FastCarList) query.uniqueResult();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public FastCarList FastCarListByNum(String num) {
		FastCarList result = null;

		System.out.println("String hql");
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where carnum=:carnum";
			Query query = session.createQuery(hql).setParameter("carnum", num);
			result = (FastCarList) query.uniqueResult();

			System.out.println("String hql");
		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);

		}finally{
			//HibernateUtils.closeSession(session);
		}

		return result;
	}

	public int PrivateFastCarCount() {
		int rs = 0;
		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "from FastCarList where cartype=1";
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

	public Serializable AddFastCarList(FastCarList fastcarlist) {

		Serializable result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.save(fastcarlist);
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

	public Serializable AddFastCarRecord(FastCarRecord fastcarrecord) {
		Serializable result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			result = session.save(fastcarrecord);
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

	public void UpdateFastCarList(FastCarList fastcarlist) {

		Transaction tx = null;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			if ("".equals(fastcarlist.getInsurestart().toString())
					&& "".equals(fastcarlist.getInsureexp().toString())) {
				String hql = "update FastCarList c set c.business=:business,c.userdiscount=:userdiscount,c.traffic=:traffic,c.carboat=:carboat,c.insureoffer=:insureoffer,c.insurediscount=:insurediscount,c.clientpay=:clientpay,c.insuretype=:insuretype,c.framenum=:framenum,c.applicant=:applicant,c.model=:model,c.insurestart=:insurestart,c.insureexp=:insureexp,c.time=:time,c.contractname=:contractname,c.contracttel=:contracttel,c.contractaddress=:contractaddress,c.contractidentity=:contractidentity where c.carnum=:carnum";
				query = session.createQuery(hql).setParameter("business",
						fastcarlist.getBusiness()).setParameter("traffic",
						fastcarlist.getTraffic()).setParameter("userdiscount",
						fastcarlist.getUserdiscount()).setParameter("carboat",
						fastcarlist.getCarboat()).setParameter("insuretype",
						fastcarlist.getInsuretype()).setParameter("clientpay",
						fastcarlist.getClientpay()).setParameter(
						"insurediscount", fastcarlist.getInsurediscount())
						.setParameter("insureoffer",
								fastcarlist.getInsureoffer()).setParameter(
								"framenum", fastcarlist.getFramenum())
						.setParameter("model", fastcarlist.getModel())
						.setParameter("carnum", fastcarlist.getCarnum())
						.setParameter("time", fastcarlist.getTime())
						.setParameter("contractname",
								fastcarlist.getContractname()).setParameter(
								"applicant", fastcarlist.getApplicant())
						.setParameter("insurestart",
								fastcarlist.getInsurestart()).setParameter(
								"insureexp", fastcarlist.getInsureexp())
						.setParameter("contracttel",
								fastcarlist.getContracttel()).setParameter(
								"contractaddress",
								fastcarlist.getContractaddress()).setParameter(
								"contractidentity",
								fastcarlist.getContractidentity());
			} else {
				String hql = "update FastCarList c set c.business=:business,c.userdiscount=:userdiscount,c.traffic=:traffic,c.carboat=:carboat,c.insureoffer=:insureoffer,c.insurediscount=:insurediscount,c.clientpay=:clientpay,c.insuretype=:insuretype,c.framenum=:framenum,c.applicant=:applicant,c.model=:model,c.time=:time,c.contractname=:contractname,c.contracttel=:contracttel,c.contractaddress=:contractaddress,c.contractidentity=:contractidentity where c.carnum=:carnum";
				query = session.createQuery(hql).setParameter("business",
						fastcarlist.getBusiness()).setParameter("userdiscount",
						fastcarlist.getUserdiscount()).setParameter("traffic",
						fastcarlist.getTraffic()).setParameter("carboat",
						fastcarlist.getCarboat()).setParameter("insuretype",
						fastcarlist.getInsuretype()).setParameter("clientpay",
						fastcarlist.getClientpay()).setParameter(
						"insurediscount", fastcarlist.getInsurediscount())
						.setParameter("insureoffer",
								fastcarlist.getInsureoffer()).setParameter(
								"framenum", fastcarlist.getFramenum())
						.setParameter("model", fastcarlist.getModel())
						.setParameter("carnum", fastcarlist.getCarnum())
						.setParameter("time", fastcarlist.getTime())
						.setParameter("contractname",
								fastcarlist.getContractname()).setParameter(
								"applicant", fastcarlist.getApplicant())
						.setParameter("contracttel",
								fastcarlist.getContracttel()).setParameter(
								"contractaddress",
								fastcarlist.getContractaddress()).setParameter(
								"contractidentity",
								fastcarlist.getContractidentity());
			}

			query.executeUpdate();

		} catch (Exception e) {
			if (tx != null)
				tx.commit();
			throw new RuntimeException(e);
		}finally{
			//HibernateUtils.closeSession(session);
		}

	}

	public List<Object> FastCarList(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select m.name,c.carnum,c.framenum,c.insureoffer,c.insurediscount,c.clientpay,c.contractname,c.insureexp,c.applicant,c.insuretype,c.id,c.userdiscount from FastCarList as c,models as m where c.model=m.id and cartype=0 and (m.name like :fast or c.carnum like :fast or c.framenum like :fast or c.contractname like :fast or c.applicant like :fast) order by time desc";
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

	public List<Object> FastCarListone(String fast) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			String hql = "select m.name,c.carnum,c.framenum,c.insureoffer,c.insurediscount,c.clientpay,c.contractname,c.insureexp,c.applicant,c.insuretype,c.id,c.userdiscount from FastCarList as c,models as m where c.model=m.id and cartype=1 and (m.name like :fast or c.carnum like :fast or c.framenum like :fast or c.contractname like :fast or c.applicant like :fast) order by time desc";
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

	public List<Object> ContractInfoByCarId(String id) {
		List<Object> result = null;

		Transaction tx = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			// String hql =
			// "select c.model,c.carnum,c.framenum,m.name,c.time from car as c,models as m where c.model=m.id and (c.carnum like :fast or c.framenum like :fast or m.name like :fast) order by time desc";
			// Query query = session.createSQLQuery(hql).setParameter("fast",
			// "%" + fast + "%");
			// result = query.list();

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
