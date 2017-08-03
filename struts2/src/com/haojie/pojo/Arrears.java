package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Arrears implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7971881836805808530L;
	private int id;
	private int cashflow;
	private Date time;
	private String douser;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCashflow() {
		return cashflow;
	}
	public void setCashflow(int cashflow) {
		this.cashflow = cashflow;
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

}
