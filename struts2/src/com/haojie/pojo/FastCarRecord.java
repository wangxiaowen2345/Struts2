package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class FastCarRecord implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1618290026444222969L;
	private int id;
	private String carnum;
	private Date registartime;
	private Date exptime;
	private int buytype;
	private Date time;
	private String contractname;
	private String usebeizhu;
	private String contracttel;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public Date getRegistartime() {
		return registartime;
	}

	public void setRegistartime(Date registartime) {
		this.registartime = registartime;
	}

	public Date getExptime() {
		return exptime;
	}

	public void setExptime(Date exptime) {
		this.exptime = exptime;
	}

	public int getBuytype() {
		return buytype;
	}

	public void setBuytype(int buytype) {
		this.buytype = buytype;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContractname() {
		return contractname;
	}

	public void setContractname(String contractname) {
		this.contractname = contractname;
	}

	public String getContracttel() {
		return contracttel;
	}

	public void setContracttel(String contracttel) {
		this.contracttel = contracttel;
	}

	public void setUsebeizhu(String usebeizhu) {
		this.usebeizhu = usebeizhu;
	}

	public String getUsebeizhu() {
		return usebeizhu;
	}

}
