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
		<title>商品出库</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		
		
				
				
			<div style="margin-top:20px;margin-left: 2%;width:100% ;height:20px;"> 
				 
				<span style="font-size:25px;">备选区域</span>
				<div style="float: right;margin-right:2%;margin-top: 5px; display: inline;line-height: 30px;">
					<form action="" method="post" style="margin:0px;padding:0px;">
					仓库：					
					<select name="value1" style="width:25%;height:28px;margin:0px;" >
								<option value="0">全部</option>
							<s:iterator value="AllWareHouse()" var="son">
								<option value="<s:property value='#son.id'/>" <s:if test="value1==#son.id">selected='selected'</s:if>><s:property value='#son.name'/></option>
							</s:iterator>
					</select>
					关键字：<input type="text" name="value2" value="<s:property value='value2'/>" style="width:20%;height:28px;margin:0px;" />
					<input value="搜索" type="submit" style="width:20%;height:28px; background: #00a5a5;color:#fff"/>
					</form>
				</div>
			</div>
			
			
			

		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">序号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">品名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">单位</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:iterator value="SelectWareListByWhere(value1,value2)" var="sson" status="index">
				<div id="left">
					<s:property value="#index.index+1" />
				</div>
				<div id="middle" style="width:8%">
					<s:property value="#sson[3]" />
				</div>
				<div id="middle">
					<s:property value="#sson[2]" />
				</div>
				<div id="middle">
					<s:property value="#sson[5]" />
				</div>
				<div id="middle">
					<s:property value="#sson[1]" />
				</div>
				<div id="middle" style="width:10%">
					<s:property value="#sson[6]" />
				</div>
				<div id="right">
					<a href="<%=path %>/admin.action?function=outwarehousestepmanagement&value1=<s:property value="#sson[3]" />&value3=<s:property value="value3"/>&value4=<s:property value="value4"/>">出库</a>
				</div>
			</s:iterator>
			</div>

			<div id="bottom"></div>
		</div>

		
	</body>
	
	
</html>
