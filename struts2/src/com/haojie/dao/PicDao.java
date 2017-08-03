package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Pic;

public interface PicDao {

	public List<Pic> SelectByCar(String carid);

	/**
	 * Ìí¼Ó
	 */
	public void AddPic(Pic p);

}
