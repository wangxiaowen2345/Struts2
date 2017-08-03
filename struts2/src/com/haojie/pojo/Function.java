package com.haojie.pojo;

import java.io.Serializable;

public class Function implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -92691115926437087L;
	private int id;
	private String function;
	private String remark;
	private int fid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getFid() {
		return fid;
	}

}
