package com.haojie.pojo;

import java.io.Serializable;

public class OrderList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -799853336962191881L;

	private int id;
	private String number;
	private double price;
	private double count;
	private String productnumber;

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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getCount() {
		return count;
	}

	public void setCount(double count) {
		this.count = count;
	}

	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}

	public String getProductnumber() {
		return productnumber;
	}

}
