<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>出库</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	border-left: 1px solid #000;
	border-top: 1px solid #000;
	font-size: 13px;
	margin-bottom: 20px;
}

th,td {
	border-right: 1px solid #000;
	border-bottom: 1px solid #000;
}

th {
	font-weight: bold;
}

.tbinput {
	width: 95%;
	text-align: center;
}
</style>
	</head>


	<s:set name="repair" value="RepairByNum(value2)" />
	<s:set name="car" value="CarById(#repair.carid)" />


	<body style="text-align: center; font-family: 'microsoft yahei';padding-top: 20px">
		<div style="width: 100%; text-align: right;">
			<a href='<%=path %>/admin.action?function=outwaretable&value1=<s:property value="value1" />&value2=<s:property value="value2" />'>打印</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p style="margin: 0px;">
			<font size="5">出库详情</font>
		</p>

		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 电话：0532-67768266
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>
		<p style="margin: 0px;">
			编号：
			<s:property value="#repair.repairnum" />
		</p>

		<br />


		<!-- 如果没有传值 -->
		<SCRIPT LANGUAGE="JavaScript">
			function openwin()
		　　{
		 　		var child = window.open("<%=path%>/admin.action?function=outwarehousemanagement&value3=<s:property value="value1"/>&value4=<s:property value="value2"/>", "newwin", "height=600, width=1000,toolbar=no,scrollbars="+scroll+",menubar=no");
		  
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




		<br />
		<table width="95%" style="margin-left: 2%;">
			<tr>
				<td width="25%">
					车牌号
				</td>
				<td width="25%">
					<s:property value="#car.carnum" />
				</td>
				<td width="25%">
					车型
				</td>
				<td width="25%">
					<s:property value="ModelsById(#car.model).name" />
				</td>
			</tr>
			<tr>
				<td>
					车架号
				</td>
				<td>
					<s:property value="#car.framenum" />
				</td>
				<td>
					送修日期
				</td>
				<td>
					<s:property value='DateFormat("yyyy-MM-dd",#repair.time)' />
				</td>
			</tr>
			<tr>
				<td>
					联系人
				</td>
				<td>
					<s:property value="#repair.contact" />
				</td>
				<td>
					维修类型
				</td>
				<td>
					<s:property value="#repair.type" />
				</td>
			</tr>
			<tr>
				<td>
					联系电话
				</td>
				<td>
					<s:property value="#repair.tel" />
				</td>
				<td>
					送修里程
				</td>
				<td>
					<s:property value="#repair.repairmileage" />
				</td>
			</tr>
			<tr>
				<td>
					客户名称
				</td>
				<td>
					<s:property value="#repair.customer" />
				</td>
				<td>
					客户地址
				</td>
				<td>
					<s:property value="#repair.address" />
				</td>
			</tr>
			<input type="hidden" value="<s:property value="#car.id"/>" id="carid" />

		</table>

		<table width="95%" style="margin-left: 2%;">


			<tr>
				<td width="40%">
					材料名称
				</td>
				<td width="10%">
					规格
				</td>
				<td width="15%">
					数量
				</td>
				<td width="10%">
					单价
				</td>
				<td width="15%">
					材料金额
				</td>
				<td width="10%">
					操作
				</td>
			</tr>
			<s:set name="count" value="0" />
			<s:iterator value="OutWareHouseRecord(#repair.repairnum)" var="son">
				<s:set name="product" value="WaresByNumber(#son.productnumber)" />
				<s:set name="rr" value="RepairRecordByWRId(#son.id)" />
				<tr>
					<td>
						<s:property value="#product.name" />
					</td>
					<td>
						<s:property value="#product.specifications" />
					</td>
					<td>
						<s:property value="#rr.amount" />
					</td>
					<td>
						<s:property value="#son.outprice" />
					</td>
					<td>
						<s:property value="#rr.amount*#son.outprice" />
					</td>
					<td>
						<s:if test="#son.dotype == 1">
							<a href="javascript:revoke('<s:property value="#rr.id"/>','<s:property value="#rr.wrid"/>');">撤销出库</a>
						</s:if>
						<s:if test="#son.dotype == 3">
							<a href="javascript:beRevoke('<s:property value="#son.ordernumber"/>','<s:property value="#son.productnumber"/>');">确认出库</a>
						</s:if>
					</td>
				</tr>

				<s:set name="count" value="#rr.amount*#son.outprice+#count" />
			</s:iterator>

			<tr>
				<td colspan="6">
					<a href="javascript:openwin();">添加新材料</a>
				</td>

			</tr>

			<tr>
				<td colspan="4">
					合计
				</td>
				<td colspan="2">
					<s:property value="#count" />
				</td>
			</tr>
		</table>







	</body>
	<SCRIPT type="text/javascript">
		function revoke(rrid,wrid){
			$.post("<%=path%>/admin.action?function=revokeoutware",
				{"value1":rrid,"value2":wrid},
					function(data){
						alert(data);	
						location.reload();	
				},"text");
		}
		function beRevoke(order,pro){
			$.post("<%=path%>/admin.action?function=berevokeoutware",
				{"value1":order,"value2":pro},
					function(data){
						alert(data);	
						location.reload();	
				},"text");
		}
	</SCRIPT>

</html>