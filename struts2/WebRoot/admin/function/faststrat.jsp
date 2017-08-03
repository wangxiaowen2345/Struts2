<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>快捷菜单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body style="text-align: center;">
		<div style="display: inline; line-height: 50px;">
			<a href="<%=path%>/admin.action?function=viptomaintain">会员卡用户维修车辆</a>
			<br />
			<a href="<%=path%>/admin.action?function=foundmaintain">普通客户维修查询</a>
			<br />
			<a href="<%=path%>/admin.action?function=selfmaintain">公司车辆维修查询</a>
			<br />
			<a href="<%=path%>/admin.action?function=repairing">正在维修车辆</a>
			<br />
			<a href="<%=path%>/admin.action?function=arrearslist">修理挂单列表</a>
			<br />
			<a href="<%=path%>/admin.action?function=returnedlist1">退货挂单列表</a>
			<br />

		</div>
	</body>
</html>
