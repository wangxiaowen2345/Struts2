package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class WareRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3052019547373846944L;

	private int id;
	private String ordernumber;
	private int dotype;
	private double docount;
	private double count;
	private double outprice;
	private String douser;
	private String getuser;
	private Date time;
	private int warehouse;
	private int department;
	private String productnumber;
	private int istrue;
	private int fid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	public int getDotype() {
		return dotype;
	}

	public void setDotype(int dotype) {
		this.dotype = dotype;
	}

	public double getDocount() {
		return docount;
	}

	public void setDocount(double docount) {
		this.docount = docount;
	}

	public double getCount() {
		return count;
	}

	public void setCount(double count) {
		this.count = count;
	}

	public double getOutprice() {
		return outprice;
	}

	public void setOutprice(double outprice) {
		this.outprice = outprice;
	}

	public String getDouser() {
		return douser;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public String getGetuser() {
		return getuser;
	}

	public void setGetuser(String getuser) {
		this.getuser = getuser;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(int warehouse) {
		this.warehouse = warehouse;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}

	public String getProductnumber() {
		return productnumber;
	}

	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}

	public int getIstrue() {
		return istrue;
	}

	public void setIstrue(int istrue) {
		this.istrue = istrue;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

}
