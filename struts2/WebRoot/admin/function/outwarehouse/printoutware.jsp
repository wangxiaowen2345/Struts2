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
		<title>出库</title>
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
	
	
	<s:set name="repair" value="RepairByNum(value2)" />
	<s:set name="car" value="CarById(#repair.carid)" />
	
	
	<body style="text-align: center;font-family: 'microsoft yahei';">
		<p style="margin: 0px;"><font size="5">机动车维修业务建档</font></p>
		<br/>
		<p style="margin: 0px;">编号：<s:property value="#repair.repairnum"/> </p>
		<br/>
		
		
		<!-- 如果没有传值 -->
		<SCRIPT LANGUAGE="JavaScript">
			function openwin()
		　　{
		 　		var child = window.open("<%=path %>/admin.action?function=outwarehousemanagement&value3=<s:property value="value1"/>&value4=<s:property value="value2"/>", "newwin", "height=600, width=1000,toolbar=no,scrollbars="+scroll+",menubar=no");
		  
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
		
		
		
		
		<br/>
		<table width="80%" style="margin-left: 10%;">
			<tr>
				<td width="25%">车牌号</td>
				<td width="25%"><s:property value="#car.carnum"/></td>
				<td width="25%">车型</td>
				<td width="25%"><s:property value="ModelsById(#car.model).name"/></td>
			</tr>
			<tr>
				<td>车架号</td>
				<td><s:property value="#car.framenum"/></td>
				<td>送修日期</td>
				<td><s:property value='DateFormat("yyyy-MM-dd",#repair.time)'/></td>
			</tr>
			<tr>
				<td>联系人</td>
				<td><s:property value="#repair.contact"/></td>
				<td>维修类型</td>
				<td>
					<s:property value="#repair.type"/>
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td><s:property value="#repair.tel"/></td>
				<td>送修里程</td>
				<td><s:property value="#repair.repairmileage"/></td>
			</tr>
			<tr>
				<td>客户名称</td>
				<td><s:property value="#repair.customer"/></td>
				<td>客户地址</td>
				<td><s:property value="#repair.address"/></td>
			</tr>
			<input type="hidden" value="<s:property value="#car.id"/>" id="carid"/>

		</table>
		
		<table width="80%" style="margin-left: 10%;">
		
		
			<tr>
				<td width="40%">材料名称</td>
				<td width="10%">规格</td>
				<td width="15%">数量</td>
				<td width="10%">单价</td>
				<td width="15%">材料金额</td>
				<td width="10%">操作</td>
			</tr>
			<s:set name="count" value="0"/>
			<s:iterator value="OutWareHouseRecord(#repair.repairnum)" var="son"> 
			<s:set name="product" value="WaresByNumber(#son.productnumber)"/>
			<s:set name="rr" value="RepairRecordByWRId(#son.id)"/>
			<tr>
				<td><s:property value="#product.name"/></td>
				<td><s:property value="#product.specifications"/></td>
				<td><s:property value="#rr.amount"/></td>
				<td><s:property value="#son.outprice"/></td>
				<td><s:property value="#rr.amount*#son.outprice"/></td>
				<td>
					<a href="javascript:revoke('<s:property value="#rr.id"/>','<s:property value="#rr.wrid"/>');">撤销出库</a>
				</td>
			</tr>
			
			<s:set name="count" value="#rr.amount*#son.outprice+#count"/>
			</s:iterator>
			
			<tr>
				<td colspan="6"><a href="javascript:openwin();">添加新材料</a></td>
				
			</tr>
			
			<tr>
				<td colspan="4">合计</td>
				<td colspan="2"><s:property value="#count"/></td>
			</tr>	
		</table>
		
		
		
		
		
		

	</body>
	<SCRIPT type="text/javascript">
		function revoke(rrid,wrid){
			$.post("<%=path %>/admin.action?function=revokeoutware",
				{"value1":rrid,"value2":wrid},
					function(data){
						alert(data);	
						location.reload();	
				},"text");
		}
	</SCRIPT>

</html>