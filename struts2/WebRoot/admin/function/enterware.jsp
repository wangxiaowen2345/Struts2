<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提示信息</title>
    <script type="text/javascript">
    		
    		setTimeout("location.href='<%=path %>/admin.action?function=oneordermanagement&value1=<s:property value="value1"/>'",3000);
    		
    </script>

  </head>
  
  <body>
    	<s:property value="EnterWareHouse(value1,value2,wrlist)"/>，正在跳转，请稍候！<br>
  </body>
</html>
