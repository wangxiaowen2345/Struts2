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
		<title>订单详情</title>

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

	<body style="text-align: center; font-family: 'Microsoft YaHei'; padding-top: 20px">
		<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p style="margin: 0px;   text-align: center;">
			<font size="5">入库单详情</font>

		</p>
		<!-- ><button onclick="javascript:location.href='<%=path%>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->

		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 电话：0532-67768266
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>


		<div id="div1" style="margin-top: 10px;">

			<s:set name="repair" value="RepairByNum(value2)" />
			<s:set name="car" value="CarById(#repair.carid)" />


			<div id="div1" style="margin-left: 2%; margin-top: 10px;">
				<table width="95%">
					<tr>
						<td>
							订单编号：
							<s:property value="OrderByNumber(value1).number" />
						</td>
						<td>
							供应商：
							<s:property value="SuppliersById(OrderByNumber(value1).suppliers)" />
						</td>
						<td>
							订单时间：
							<s:property value='DateFormat("yyyy-MM-dd hh:mm:ss",OrderByNumber(value1).time)' />
						</td>
					</tr>
					<tr>
						<td>
							订单状态：
							<s:if test="OrderByNumber(value1).tag==0">
								<font color="red">未确认</font>&nbsp;
					<a
									href='<%=path%>/admin.action?function=subordermanagement&value1=<s:property value="value1"/>'>马上确认</a>



							</s:if>
							<s:else>
				 	已确认
				 </s:else>
						</td>
						<td colspan="2">
							订单金额：
							<s:property value="OrderByNumber(value1).alltotalprice" />
							元
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
						<td width="10%">
							规格
						</td>
						<td width="10%">
							生产厂家
						</td>
						<td width="10%">
							数量
						</td>
						<td width="10%">
							进价
						</td>
						<td width="10%">
							金额
						</td>


					</tr>




					<s:iterator value="OrderListByNumber(value1)" var="son">
						<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
						<tr>
							<td>
								<s:property value="#son.productnumber" />
							</td>
							<td>
								<s:property value="#pro.name" />
							</td>
							<td>
								<s:property value="#pro.specifications" />
							</td>
							<td>
								<s:property value="#pro.madein" />
							</td>
							<td>
								<s:property value="#son.count" />
							</td>
							<td>
								<s:property value="#son.price" />
							</td>
							<td>
								<s:property value="#son.count*#son.price" />
							</td>


						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</body>

</html>
