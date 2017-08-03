<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
	String newLocn = path + "/admin.action";
	response.setHeader("Location", newLocn);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Hello World!</title>
	</head>

	<body>
		正在跳转...
	</body>
</html>
