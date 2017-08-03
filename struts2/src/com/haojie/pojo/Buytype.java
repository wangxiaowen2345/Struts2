package com.haojie.pojo;

import java.io.Serializable;

public class Buytype implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2640603887780233205L;
	private int id;
	private String type;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

}
