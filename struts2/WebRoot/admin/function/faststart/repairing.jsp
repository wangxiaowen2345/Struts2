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
		<title>维修中订单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		
	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">车牌号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">联系人</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">电话</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">录入日期</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:iterator value="RepairIngList()" var="son">
				<div id="left">
					<s:property value="#son.repairnum" />
				</div>
				<div id="middle">
					<s:property value="CarById(#son.carid).carnum" />
				</div>
				<div id="middle">
					<s:property value="#son.contact" />
				</div>
				<div id="middle">
					<s:property value="#son.tel" />
				</div>
				<div id="middle">
					<s:date name="time" format="yyyy-MM-dd hh:mm:ss" nice="false"  />
					<s:property value="#time" />
				</div>
				<div id="right">
					<a href="<%=path %>/admin.action?function=deleterepairing&value1=<s:property value="#son.repairnum" />">删除</a>
					<a href='<%=path %>/admin.action?function=repairinfo&value2=<s:property value="#son.repairnum" />'>详情</a>
				</div>
			</s:iterator>
			</div>

			<div id="bottom"></div>
		</div>

		
		
	</body>
	
	
	

</html>
