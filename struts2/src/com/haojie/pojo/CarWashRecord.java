package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class CarWashRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7226373299377887400L;

	private int id;
	private String number;
	private String name;
	private int dotype;
	private double outprice;
	private Date time;
	private int payment;
	private int residuedegree;
	private String douser;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDotype() {
		return dotype;
	}

	public void setDotype(int dotype) {
		this.dotype = dotype;
	}

	public double getOutprice() {
		return outprice;
	}

	public void setOutprice(double outprice) {
		this.outprice = outprice;
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

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPayment() {
		return payment;
	}

	public void setResiduedegree(int residuedegree) {
		this.residuedegree = residuedegree;
	}

	public int getResiduedegree() {
		return residuedegree;
	}

}
