package com.haojie.dao;

import java.util.List;

import com.haojie.pojo.Function;

public interface FunctionDao {
	
	/**
	 * 根据名字查询Function
	 * @return
	 */
	public Function SelectFunctionByName(String FunctionName);
	
	
	public List<Function> MenuFunction();
	
	
	public int SelectFunctionFid(String name);

}
