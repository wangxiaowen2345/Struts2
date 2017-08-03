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
		<base href="<%=basePath%>">

		<title>产品查询</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
			<script>
		var num = document.getElementById("num").value;
</script>
	<body style="text-align: center; font-family: 微软雅黑;">
		<div style="margin-top: 20px;">
			<br />
			<br />
			<br />
			<font size="20px">请输入产品编号</font>
			<br />
			
			<form action="<%=path %>/admin.action" method="get">
			<input type="hidden" value="selectpronum" name="function">
			<input type="text" name="value1" id="num"
				style="margin-top: 20px; font-size: 30px; height: 40px; text-align: center;" />
			<br/>
			<input type="submit" style="width: 10%; background: #00a5a5; margin-top: 2px; border: 0px; color: #ffffff; font-size: 15px; height: 30px;" value="查询"/> 
			</form>
			
		</div>
	</body>
	

</html>
