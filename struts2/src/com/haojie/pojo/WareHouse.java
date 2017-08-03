package com.haojie.pojo;

import java.io.Serializable;

public class WareHouse implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1352904186119039951L;
	private int id;
	private String name;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

}
