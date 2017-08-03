package com.haojie.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="systemvalue")
public class SystemValue implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3937631170514961203L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name="keyname")
	private String keyname;
	@Column(name="vle")
	private String vle;
	@Column(name="remark")
	private String remark;
	@Column(name="colid")
	private int colid;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKeyname() {
		return keyname;
	}
	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}
	public String getVle() {
		return vle;
	}
	public void setVle(String vle) {
		this.vle = vle;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public void setColid(int colid) {
		this.colid = colid;
	}
	public int getColid() {
		return colid;
	}
	
}
