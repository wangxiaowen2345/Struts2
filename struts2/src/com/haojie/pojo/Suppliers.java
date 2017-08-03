package com.haojie.pojo;

import java.io.Serializable;

public class Suppliers implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7990434397761628659L;
	
	private int id;
	private String name;
	private String tel;
	private String fastname;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getFastname() {
		return fastname;
	}
	public void setFastname(String fastname) {
		this.fastname = fastname;
	}
	
	
}
