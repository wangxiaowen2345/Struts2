package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Allot implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5741848362939580846L;
	private int id;
	private int callout;
	private String count;
	private int callin;
	private String productnumber;
	private String ordernumber;
	private Date time;

	public int getId() {
		return id;
	}

	public int getCallout() {
		return callout;
	}

	public void setCallout(int callout) {
		this.callout = callout;
	}

	public int getCallin() {
		return callin;
	}

	public void setCallin(int callin) {
		this.callin = callin;
	}

	public String getProductnumber() {
		return productnumber;
	}

	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getTime() {
		return time;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCount() {
		return count;
	}

}
