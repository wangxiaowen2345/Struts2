package com.haojie.dao;

import com.haojie.pojo.SystemValue;

public interface SystemValueDao {
	
	/**
	 * 查询系统参数
	 * @param sv
	 * @return
	 */
	public SystemValue SelectValue(SystemValue sv);

}
