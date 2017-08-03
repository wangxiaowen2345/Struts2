package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class FastCarList implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -822061821565935223L;

	private int id;
	private String carnum;
	private String framenum;
	private int model;
	private Date time;
	private String contractname;
	private String contracttel;
	private String contractaddress;
	private String contractidentity;
	private int cartype;
	private Date insurestart;
	private Date insureexp;
	private String applicant;
	private double business;
	private double traffic;
	private double carboat;
	private double insureoffer;
	private double clientpay;
	private float insurediscount;
	private float userdiscount;
	private String insuretype;

	public double getInsureoffer() {
		return insureoffer;
	}

	public void setInsureoffer(double insureoffer) {
		this.insureoffer = insureoffer;
	}

	public double getClientpay() {
		return clientpay;
	}

	public void setClientpay(double clientpay) {
		this.clientpay = clientpay;
	}

	public float getInsurediscount() {
		return insurediscount;
	}

	public void setInsurediscount(float insurediscount) {
		this.insurediscount = insurediscount;
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

	public String getContractaddress() {
		return contractaddress;
	}

	public void setContractaddress(String contractaddress) {
		this.contractaddress = contractaddress;
	}

	public String getContractidentity() {
		return contractidentity;
	}

	public void setContractidentity(String contractidentity) {
		this.contractidentity = contractidentity;
	}

	public int getCartype() {
		return cartype;
	}

	public void setCartype(int cartype) {
		this.cartype = cartype;
	}

	public Date getInsurestart() {
		return insurestart;
	}

	public void setInsurestart(Date insurestart) {
		this.insurestart = insurestart;
	}

	public Date getInsureexp() {
		return insureexp;
	}

	public void setInsureexp(Date insureexp) {
		this.insureexp = insureexp;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public void setInsuretype(String insuretype) {
		this.insuretype = insuretype;
	}

	public String getInsuretype() {
		return insuretype;
	}

	public void setBusiness(double business) {
		this.business = business;
	}

	public double getBusiness() {
		return business;
	}

	public void setCarboat(double carboat) {
		this.carboat = carboat;
	}

	public double getCarboat() {
		return carboat;
	}

	public void setTraffic(double traffic) {
		this.traffic = traffic;
	}

	public double getTraffic() {
		return traffic;
	}

	public void setUserdiscount(float userdiscount) {
		this.userdiscount = userdiscount;
	}

	public float getUserdiscount() {
		return userdiscount;
	}

}
