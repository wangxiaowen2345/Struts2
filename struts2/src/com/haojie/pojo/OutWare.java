package com.haojie.pojo;

import java.io.Serializable;

public class OutWare implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8685186193115690675L;

	private String productnum;
	private String ordernum;
	private double docount;
	private double price;
	private int warehouseid;
	private String douser;
	private String getuser;
	private int type;
	private int department;

	public double getDocount() {
		return docount;
	}

	public void setDocount(double docount) {
		this.docount = docount;
	}

	public String getProductnum() {
		return productnum;
	}

	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getWarehouseid() {
		return warehouseid;
	}

	public void setWarehouseid(int warehouseid) {
		this.warehouseid = warehouseid;
	}

	public String getGetuser() {
		return getuser;
	}

	public void setGetuser(String getuser) {
		this.getuser = getuser;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public String getDouser() {
		return douser;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setDepartment(int department) {
		this.department = department;
	}

	public int getDepartment() {
		return department;
	}

}
