package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7226373299377887400L;

	
	private int id;
	private String number;
	private int suppliers;
	private double alltotalprice;
	private Date time;
	private int tag;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getSuppliers() {
		return suppliers;
	}
	public void setSuppliers(int suppliers) {
		this.suppliers = suppliers;
	}
	public double getAlltotalprice() {
		return alltotalprice;
	}
	public void setAlltotalprice(double alltotalprice) {
		this.alltotalprice = alltotalprice;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public int getTag() {
		return tag;
	}
	
	

}
