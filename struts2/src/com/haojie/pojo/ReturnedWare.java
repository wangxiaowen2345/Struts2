package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class ReturnedWare implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6017261544737163262L;
	private int id;
	private String ordernumber;
	private String productnumber;
	private int count;
	private double price;
	private double allprice;
	private int suppliers;
	private int paytype;
	private int warehouse;
	private Date time;
	private String douser;
	private String name;

	public int getPaytype() {
		return paytype;
	}

	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getAllprice() {
		return allprice;
	}

	public void setAllprice(double allprice) {
		this.allprice = allprice;
	}

	public int getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(int suppliers) {
		this.suppliers = suppliers;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getDouser() {
		return douser;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}

	public String getProductnumber() {
		return productnumber;
	}

	public void setWarehouse(int warehouse) {
		this.warehouse = warehouse;
	}

	public int getWarehouse() {
		return warehouse;
	}

}
