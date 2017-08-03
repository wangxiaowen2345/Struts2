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
		<title>出库单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>
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
	text-align: center;
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
	<body style="text-align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p style="margin: 0px;">
			<font size="5">出库单明细表</font>
		</p>

		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 电话：0532-67768266
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>
		<!-- ><button onclick="javascript:location.href='<%=path%>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->
		<br />
		<div id="div1" style="margin-left: 2%; margin-top: 10px;">
			<table width="95%">
				<tr>
					<td>
						编号：
						<s:property value="#repair.repairnum" />
					</td>
					<td>
						时间：
						<s:property value='DateFormat("yyyy-MM-dd",#repair.time)' />
					</td>
					<td>
						客户名：
						<s:property value="#repair.customer" />
					</td>
					<td>
						联系人：
						<s:property value="#repair.contact" />
					</td>
					<td>
						手机号：
						<s:property value="#repair.tel" />
					</td>
				</tr>
			</table>
			<table width="95%">
				<tr>
					<td width="10%">
						货号
					</td>
					<td width="20%">
						品名
					</td>
					<td width="15%">
						规格
					</td>
					<td width="10%">
						生产厂家
					</td>
					<td width="10%">
						单价
					</td>
					<td width="8%">
						数量
					</td>
					<td width="15%">
						金额
					</td>
					<td width="12%">
						仓库
					</td>
				</tr>



				<s:set name="count" value="0" />
				<s:iterator value="OutWareHouseRecord(#repair.repairnum)" var="son">
					<s:set name="product" value="WaresByNumber(#son.productnumber)" />
					<s:set name="rr" value="RepairRecordByWRId(#son.id)" />
					<tr>
						<td>
							<s:property value="#son.productnumber" />
						</td>
						<td>
							<s:property value="#product.name" />
						</td>
						<td>
							<s:property value="#product.specifications" />
						</td>
						<td>
							<s:property value="#product.madein" />
						</td>
						<td>
							<s:property value="#son.outprice" />
						</td>
						<td>
							<s:property value="#rr.amount" />
						</td>
						<td>
							<s:property value="#rr.amount*#son.outprice" />
						</td>
						<td>
							<s:property value="WareHouseById(#son.warehouse).name" />
						</td>
						<s:set name="count" value="#rr.amount*#son.outprice+#count" />
					</tr>
				</s:iterator>
				<td colspan="8">
					订单总额：
					<s:property value="#count" />
					元
				</td>
			</table>
		</div>

	</body>

</html>
