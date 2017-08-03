package com.haojie.pojo;

import java.io.Serializable;
import java.util.List;

public class PrintOut implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3411860503353160341L;
	private String[] headers;
	private String title;
	private String other;
	private List<Object[]> dataList;

	// public String[] getHeaders() {
	// return headers;
	// }
	//
	// public void setHeaders(String[] headers) {
	// this.headers = headers;
	// }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getOther() {
		return other;
	}

	public void setHeaders(String[] headers) {
		this.headers = headers;
	}

	public String[] getHeaders() {
		return headers;
	}

	public void setDataList(List<Object[]> dataList) {
		this.dataList = dataList;
	}

	public List<Object[]> getDataList() {
		return dataList;
	}

}
