<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"   %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>选择仓库</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

		<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
		-->
	
	<s:set name="size" value="0"/> 
		


	</head>

	<body style="text-align: center;padding-top: 120px">
		<form action="<%=path %>/admin.action" method="get">
		<input type="hidden" value="inventory" id="func" name="function"/>
		<input type="hidden" value="1" id="func" name="page"/>
	
		<span id="msgt">选择仓库</span>
		
			<select style="width:200px;" name="value1"  id="sl">		
				<s:iterator value="AllWareHouse()" var="sson" >
				<option value="<s:property value="#sson.id"/>"><s:property value="#sson.name"/></option>  
				</s:iterator>
			</select>
			
			
		<br/><br/><br/><br/>

		<input type="submit" style="width: 10%; background: #00a5a5; margin-top: 2px; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
		</form>


	</body>
	
</html>
