package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class CarWash implements Serializable {

	private static final long serialVersionUID = -3514104403211034104L;
	private int id;
	private String number;
	private String name;
	private String tel;
	private int residuedegree;
	private Date time;
	private Date expdate;
	private String istrue;
	private String carnum;
	private String kind;
	private int models;
	private double balance;
	private String douser;
	private int payment;

	public String getIstrue() {
		return istrue;
	}

	public void setIstrue(String istrue) {
		this.istrue = istrue;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getResiduedegree() {
		return residuedegree;
	}

	public void setResiduedegree(int residuedegree) {
		this.residuedegree = residuedegree;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getExpdate() {
		return expdate;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public String getDouser() {
		return douser;
	}

	public void setDouser(String douser) {
		this.douser = douser;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getBalance() {
		return balance;
	}

}
