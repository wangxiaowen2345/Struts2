package com.haojie.pojo;

import java.io.Serializable;

public class PowerAss implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3313865719505365169L;
	
	private int id;
	private int powerid;
	private int functionid;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPowerid() {
		return powerid;
	}
	public void setPowerid(int powerid) {
		this.powerid = powerid;
	}
	public int getFunctionid() {
		return functionid;
	}
	public void setFunctionid(int functionid) {
		this.functionid = functionid;
	}


}
