package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class RepairRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 945730203567444646L;

	private int id;
	private String repairnum;
	private int type;
	private int wrid;
	private double amount;
	private double total;
	private Date time;
	private String repairtext;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setWrid(int wrid) {
		this.wrid = wrid;
	}

	public int getWrid() {
		return wrid;
	}

	public void setRepairtext(String repairtext) {
		this.repairtext = repairtext;
	}

	public String getRepairtext() {
		return repairtext;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public String getDouser() {
		return douser;
	}
}
