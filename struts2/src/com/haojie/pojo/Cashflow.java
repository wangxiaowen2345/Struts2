package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Cashflow implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 225404767772480094L;

	private int id;
	private int type;
	private String number;
	private String ordertype;
	private String douser;
	private int paytype;
	private int istrue;
	private Date time;
	private double total;
	private double reallytotal;
	private String payuser;
	private int fid;

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

	public String getOrdertype() {
		return ordertype;
	}

	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}

	public String getDouser() {
		return douser;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public int getPaytype() {
		return paytype;
	}

	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}

	public int getIstrue() {
		return istrue;
	}

	public void setIstrue(int istrue) {
		this.istrue = istrue;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getType() {
		return type;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getTotal() {
		return total;
	}

	public void setReallytotal(double reallytotal) {
		this.reallytotal = reallytotal;
	}

	public double getReallytotal() {
		return reallytotal;
	}

	public void setPayuser(String payuser) {
		this.payuser = payuser;
	}

	public String getPayuser() {
		return payuser;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getFid() {
		return fid;
	}

}
