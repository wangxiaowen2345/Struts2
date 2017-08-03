package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Repair implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7143737769193958845L;
	
	private int id;
	private String repairnum;
	private int carid;
	private String contact;
	private String tel;
	private String customer;
	private String address;
	private double repairmileage;
	private int type;
	private Date time;
	private int state;
	private int cashflow;
	private String douser;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRepairnum() {
		return repairnum;
	}
	public void setRepairnum(String repairnum) {
		this.repairnum = repairnum;
	}
	public int getCarid() {
		return carid;
	}
	public void setCarid(int carid) {
		this.carid = carid;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getRepairmileage() {
		return repairmileage;
	}
	public void setRepairmileage(double repairmileage) {
		this.repairmileage = repairmileage;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public void setCashflow(int cashflow) {
		this.cashflow = cashflow;
	}
	public int getCashflow() {
		return cashflow;
	}
	public void setDouser(String douser) {
		this.douser = douser;
	}
	public String getDouser() {
		return douser;
	}
	

	
	

}
