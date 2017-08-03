<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>请刷卡</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <script>
	 		document.getElementById("num").value="";
	 		document.getElementById("num").focus();	
    		function out(){
    			document.getElementById("num").focus();
    			document.getElementById("num").value="";
    		}
    </script>
    <%	
    	String function=request.getParameter("function");
    	String value2=request.getParameter("value2");
    	String action = path+"/admin.action?function="+function;
    	if(function.equals("repairinfo") || function.equals("payarrears"))
    		action = path+"/admin.action?function="+function+"&value2="+value2;
    	
    %>
  </head>
  
  
  
  
  <body style="text-align: center;font-family: 微软雅黑;">
    	<div style="margin-top: 20px;"><font size="20px">请刷卡</font>
    	<form action="<%=action %>" method="post">
    		<input type="text" name="value1" id="num" style="margin-top:20px;font-size: 30px;height: 40px;text-align: center;" onblur="out();" />
    	</form>
    	</div>
  </body>
  <script>
	 	document.getElementById("num").focus();	
  </script>

</html>
