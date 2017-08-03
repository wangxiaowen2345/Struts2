package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8059891362367333823L;

	private int id;
	private String name;
	private String phone;
	private String address;
	private Date time;
	private String usernum;
	private double balance;
	private Date expdate;
	private int payment;
	private String douser;
	private String kind;
	private String carnum;
	private int models;
	private int isture;

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public int getModels() {
		return models;
	}

	public void setModels(int models) {
		this.models = models;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public String getUsernum() {
		return usernum;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getBalance() {
		return balance;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public Date getExpdate() {
		return expdate;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPayment() {
		return payment;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public String getDouser() {
		return douser;
	}

	public void setIsture(int isture) {
		this.isture = isture;
	}

	public int getIsture() {
		return isture;
	}

}
