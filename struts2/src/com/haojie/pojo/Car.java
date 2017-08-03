package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Car implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1486703644630236524L;
	private int id;
	private String carnum;
	private String orderid;
	private String framenum;
	private String color;
	private String engine;
	private int model;
	private int buytype;
	private Date registartime;
	private Date shangpai;
	private Date exptime;
	private Date examinetime;
	private Date time;
	private String usename;
	private String tel;
	private String phone;
	private String beizhu;
	private String douser;

	public Date getExptime() {
		return exptime;
	}

	public void setExptime(Date exptime) {
		this.exptime = exptime;
	}

	public Date getExaminetime() {
		return examinetime;
	}

	public void setExaminetime(Date examinetime) {
		this.examinetime = examinetime;
	}

	public String getUsename() {
		return usename;
	}

	public void setUsename(String usename) {
		this.usename = usename;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

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

	public String getFramenum() {
		return framenum;
	}

	public void setFramenum(String framenum) {
		this.framenum = framenum;
	}

	public int getModel() {
		return model;
	}

	public void setModel(int model) {
		this.model = model;
	}

	public Date getRegistartime() {
		return registartime;
	}

	public void setRegistartime(Date registartime) {
		this.registartime = registartime;
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

	public void setBuytype(int buytype) {
		this.buytype = buytype;
	}

	public int getBuytype() {
		return buytype;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getEngine() {
		return engine;
	}

	public void setShangpai(Date shangpai) {
		this.shangpai = shangpai;
	}

	public Date getShangpai() {
		return shangpai;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getColor() {
		return color;
	}

}
