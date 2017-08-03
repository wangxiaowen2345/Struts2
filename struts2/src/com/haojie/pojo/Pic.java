package com.haojie.pojo;

import java.io.Serializable;

public class Pic implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4030682628432437328L;
	private int id;
	private String path;
	private String carid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getCarid() {
		return carid;
	}

}
