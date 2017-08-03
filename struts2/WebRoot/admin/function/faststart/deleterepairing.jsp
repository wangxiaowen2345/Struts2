<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>删除维修订单</title>
  </head>
  	
  <body>
    <s:property value="DeleteRepairIng(value1)"/> 正在跳转。。。
    	<SCRIPT type="text/javascript">
    		setTimeout("location.href='<%=path %>/admin.action?function=repairing';", 3000);
    	</SCRIPT>
  </body>
</html>
