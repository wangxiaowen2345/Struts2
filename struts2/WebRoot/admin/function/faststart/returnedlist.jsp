<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>挂单退货列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		
	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		
		<div id="div1" style="margin-left: 1%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">品名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">仓库</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">供应商</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">操作人</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">金额</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:iterator value="ReturnedWareList()" var="ss">
				<s:set name="son" value="WaresByNumber(#ss.payuser)"/>
				<s:set name="sw" value="SelectWareByOrderPro(#ss.number,#ss.payuser)"/>
				<div id="left">
					<s:property value="#ss.number" />
				</div>
				<div id="middle">
					<s:property value="#son.name" />
				</div>
				<div id="middle">
					<s:property value="WareHouseById(#sw.warehouse).name" />
				</div>
				<div id="middle">
					<s:property value="SuppliersById(#son.suppliers)" />
				</div>
				<div id="middle" style="width:10%">
					<s:property value="AdminByUsername(#ss.douser).name" />
				</div>
				<div id="middle" style="width:8%">
					<s:property value="#ss.reallytotal" />
				</div>
				<div id="right">
					<a href="<%=path %>/admin.action?function=payreturned&value2=<s:property value="#ss.id" />">结款</a>
				</div>
			</s:iterator>
			</div>

			<div id="bottom"></div>
		</div>

		
		
	</body>
	
	
	

</html>
