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
		<title>会员延期</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%;height: 50px;margin-left: 2%;">
		<div style="float:left;width:22%;margin-top: 20px;margin-bottom: 20px;margin-left: 0px;">
			</div>
		<div style="float:left;width:20%; height: 30px;margin-left: 50%">
		</div>
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">姓名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">手机号</font>
			</div>
			
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">卡号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">有效期</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">账目金额</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">延期时间</font>
			</div>
			<div id="right" style="background: #00a5a5;width:17%">
				<font color="#ffffff">充值金额</font>
			</div>
			

			<div id="content">
			
				<div id="left">
				姓名
				</div>
				<div id="middle" >
				手机号
				</div>
				
				<div id="middle" style="width:10%">
				卡号
				</div>
				<div id="middle" >
				到期时间
				</div>
				
				<div id="middle" style="width:10%">
				账目余额
				</div>
				<div id="middle" >
				<input type="text" id="count" style="width:60%;height:30px;margin:0px;">
				</div>
				
				<div id="right" style="width:17%">
				<input type="text" id="count" style="width:60%;height:30px;margin:0px;">
			<input type="button" value="确认">
				</div>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>

		
	</body>
	
</html>
