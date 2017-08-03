package com.haojie.pojo;

import java.io.Serializable;
import java.util.Date;

public class Purchase implements Serializable {
	private static final long serialVersionUID = -719867027283138691L;
	private int id;
	private String material;
	private int count;
	private String useto;
	private Date time;
	private String proposer;
	private int auditor;
	private String specifications;
	private String madein;
	private String unit;
	private int models;
	private double price;

	public String getSpecifications() {
		return specifications;
	}

	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}

	public String getMadein() {
		return madein;
	}

	public void setMadein(String madein) {
		this.madein = madein;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getModels() {
		return models;
	}

	public void setModels(int models) {
		this.models = models;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getUseto() {
		return useto;
	}

	public void setUseto(String useto) {
		this.useto = useto;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public int getAuditor() {
		return auditor;
	}

	public void setAuditor(int auditor) {
		this.auditor = auditor;
	}

}
