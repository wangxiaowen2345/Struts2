package com.haojie.pojo;

import java.io.Serializable;

public class PowerFuntion implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2612498954408604318L;
	
	private String power;
	private String function;
	private int functionid;
	private int powerid;
	private String remark;
	
	
	public void setPower(String power) {
		this.power = power;
	}
	public String getPower() {
		return power;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public String getFunction() {
		return function;
	}
	public void setFunctionid(int functionid) {
		this.functionid = functionid;
	}
	public int getFunctionid() {
		return functionid;
	}
	public void setPowerid(int powerid) {
		this.powerid = powerid;
	}
	public int getPowerid() {
		return powerid;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRemark() {
		return remark;
	}

}
