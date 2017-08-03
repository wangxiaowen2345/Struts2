package com.haojie.pojo;

import java.io.Serializable;

public class Wares implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2680820078448021818L;

	private int id;
	private String number;
	private String name;
	private String specifications;
	private int models;
	private String madein;
	private int suppliers;
	private String unit;

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

	public String getSpecifications() {
		return specifications;
	}

	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}

	public int getModels() {
		return models;
	}

	public void setModels(int models) {
		this.models = models;
	}

	public String getMadein() {
		return madein;
	}

	public void setMadein(String madein) {
		this.madein = madein;
	}

	public void setSuppliers(int suppliers) {
		this.suppliers = suppliers;
	}

	public int getSuppliers() {
		return suppliers;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getUnit() {
		return unit;
	}

}
