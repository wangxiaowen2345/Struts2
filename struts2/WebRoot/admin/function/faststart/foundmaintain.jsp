<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>创建维修订单</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<style>
			table {
				border-collapse: collapse;
				border-spacing: 0;
				border-left: 1px solid #000;
				border-top: 1px solid #000;
				font-size: 16px;
				margin-top: 20px;
				margin-bottom: 20px;
			}
			th,
			td {
				border-right: 1px solid #000;
				border-bottom: 1px solid #000;
				
			}
			th {
				font-weight: bold;
			}
			.tbinput{
				width:95%;
				height:20px;
				text-align: center;
			}
		</style>
	</head>
	
	<s:set name="car" value="CarById(value2)" />
	<s:set name="vip" value="VipByUserNum(value1)" />
	
	<body style="text-align: center;font-family: 'microsoft yahei';padding-top:50px">
		<form action="<%=path %>/admin.action?function=addrepair" method="post">
		<p style="margin: 0px;"><font size="5">机动车维修业务建档</font></p>
		<br/>
		<p style="margin: 0px;">编号：<input type="text" value="<s:property value="GetRepairNum()"/>"  id="repairnum" style="height:20px;margin: 0px;padding: 0px;" readonly="readonly"/> </p>
		<br/>
		
		<s:if test="value1==null">
		<!-- 如果没有传值 -->
		<input type="button" onclick="openwin();" value="选择车辆"/>
		<SCRIPT LANGUAGE="JavaScript">
			function openwin()
		　　{
		 
		　　		var child = window.open("<%=path %>/admin.action?function=carmanagement&page=1&value1=novip", "newwin", "height=600, width=1000,toolbar=no,scrollbars="+scroll+",menubar=no");
		  
		  		if(!child.closed){ 
					if(!window.close()) 
					{ 
						
					} 
					else 
					{ 
						window.close(); 
						child.close(); 
					} 
				}
		 	
		　　}
		 
		</SCRIPT>
		</s:if>
		
		
		
		<br/>
		<table width="80%" style="margin-left: 10%;">
			<tr>
				<td width="25%">车牌号</td>
				<td width="25%"><input type="text" value="<s:property value="#car.carnum"/>" class="tbinput" style="padding:0px;margin:0px;" readonly="readonly"/></td>
				<td width="25%">车型</td>
				<td width="25%"><input type="text" value="<s:property value="ModelsById(#car.model).name"/>" class="tbinput" style="padding:0px;margin:0px;" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>车架号</td>
				<td><input type="text" value="<s:property value="#car.framenum"/>" class="tbinput" style="padding:0px;margin:0px;" readonly="readonly"/></td>
				<td>送修日期</td>
				<td><input type="text" value="<s:property value='GetNowDate("yyyy-MM-dd")'/>" class="tbinput" style="padding:0px;margin:0px;" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>联系人</td>
				<td><input type="text" id="contact" value="<s:property value="#vip.name"/>" class="tbinput" style="padding:0px;margin:0px;"/></td>
				<td>维修类型</td>
				<td>
					<select class="tbinput" id="type" style="padding:0px;margin:0px;">
  						<option value =0>维修</option>
  						<option value =1>保养</option>
  						<option value =3>洗车</option>
 						<option value =2>其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td><input type="text" id="tel" value="<s:property value="#vip.phone"/>" class="tbinput" style="padding:0px;margin:0px;"/></td>
				<td>送修里程</td>
				<td><input type="text" id="repairmileage" value="" class="tbinput" style="padding:0px;margin:0px;"/></td>
			</tr>
			<tr>
				<td>客户名称</td>
				<td><input type="text" id="customer" value="<s:property value="#vip.name"/>" class="tbinput" style="padding:0px;margin:0px;"/></td>
				<td>客户地址</td>
				<td><input type="text" id="address" value="<s:property value="#vip.address"/>" class="tbinput" style="padding:0px;margin:0px;"/></td>
			</tr>
			<input type="hidden" value="<s:property value="#car.id"/>" id="carid"/>

		</table>
		
		<input type="button" value="提交" onclick="sub();">
		</form>
		
		<script>
			function sub(){
				var carid = $("#carid").val();
				if(carid==""){
					alert("请完善表单数据！");
					return;
				}
				$.post("<%=path %>/admin.action?function=addrepair", 
					{ "repair.carid":$("#carid").val(),"repair.address":$("#address").val(),
					"repair.customer":$("#customer").val(),"repair.repairmileage":$("#repairmileage").val(),
					"repair.tel":$("#tel").val(), "repair.type":$("#type").val(),
					"repair.repairnum":$("#repairnum").val(),"repair.contact":$("#contact").val()},
		   			function(data){
		    			if(data=="\"Success\""){
		    				alert("添加成功");
		    				location.href="<%=path %>/admin.action?function=repairing";
		    			}
		   			}, "text");
			}
		</script>

	</body>

</html>