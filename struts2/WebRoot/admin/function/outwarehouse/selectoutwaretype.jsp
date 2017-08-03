<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"   %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>选择出库类型</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

		<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
		-->
	
	<s:set name="size" value="0"/> 
		


	</head>

	<body style="text-align: center;padding-top: 120px">
		<form action="<%=path %>/admin.action" method="get">
		<input type="hidden" value="outware" id="func" name="function"/>
	
		<span id="msgt">选择商品去向</span>
		
			<select style="width:200px;" name="value1" onchange="sltput();" id="sl">		
				<option value="1">订单出库</option>
				<option value="2">员工损耗</option>
			</select>
			
			<select style="width:200px;" name="value2" id="slt">		
			
			</select>
			<select style="width:200px;" name="value3" id="slt2">		
				<s:iterator value="AllWareHouse()" var="sson" >
   					<option value="<s:property value="#sson.id"/>" selected="selected" ><s:property value="#sson.name"/></option>  
				</s:iterator>
			</select>
			
		<br/><br/><br/><br/>

		<input type="submit" style="width: 10%; background: #00a5a5; margin-top: 2px; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
		</form>


	</body>
	
	<SCRIPT type="text/javascript">
		
		var type = new Array();
		
		<s:iterator value="RepairIngList()" var="son" status="index">
		type[<s:property value="#index.index"/>] = new Array("<s:property value="#son.repairnum"/>","<s:property value="#son.repairnum"/>",1);
		<s:set name="size" value="#index.index+1"/> 
		</s:iterator>
		
		<s:iterator value="SelectAllAdminUser()" var="son" status="index">
		type[<s:property value="#size+#index.index"/>] = new Array("<s:property value="#son.id"/>","<s:property value="#son.name"/>",2);
		</s:iterator>
		
		function sltput(){
			
			var t=$("#sl").val();
			
			if(t=='1'){
				$("#func").val("outware");
				$("#slt2").hide();
			}
			if(t=='2'){
				$("#func").val("consumption");
				$("#slt2").show();
			}
			
			var obj = document.getElementById("slt");
			for(var i = 0;i<type.length;i++){
				obj.options.remove(0);
			}
			
			for(var i = 0;i<type.length;i++){
				if(type[i][2]==t){
            		var varItem = new Option(type[i][1],type[i][0]);
 					obj.options.add(varItem);
				}
			}
		}
		
		sltput();
		 
		 
		
	
	</SCRIPT>
</html>
