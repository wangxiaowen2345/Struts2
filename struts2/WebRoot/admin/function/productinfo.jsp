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
		<title>产品信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>

		<SCRIPT type="text/javascript">
			if("<s:property value="value1"/>"=="")
				location.href="<%=path%>/admin/function/inputproductnum.jsp?function=productinfo";
		
		
		</SCRIPT>

		<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	border-left: 1px solid #000;
	border-top: 1px solid #000;
	font-size: 12px;
}

th,td {
	border-right: 1px solid #000;
	border-bottom: 1px solid #000;
	
}

th {
	font-weight: bold;
}
</style>

	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei'; padding-top: 40px">
<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p style="margin: 0px;">
			<font size="5">产品信息详情</font>
		</p>

		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 电话：0532-67768266
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>
		<table width="95%" style="margin: 20px auto; text-align: center;">
			<tr>
				<td>
					产品编号：
				</td>
				<td id="pronum">

				</td>
				<td>
					品名：
				</td>
				<td id="name">
				</td>
				<td>
					规格：
				</td>
				<td id="specifications">
				</td>

			</tr>
			<tr>
				<td>
					车型 :
				</td>
				<td id="models">
				</td>
				<td>
					生产厂家：

				</td>
				<td id="madein">
				</td>
				<td>

					供应商：

				</td>
				<td id="suppliers">
				</td>

			</tr>
			<tr>
				<td colspan="6">
					库存和价格信息
				</td>
			</tr>
			<tr>
				<td>
					订单号
				</td>
				<td>
					进价
				</td>
				<td>
					售价
				</td>
				<td >
					仓库
				</td>
				<td>
					数量
				</td>
				<td>
					单位
				</td>
			</tr>
			<s:iterator value="GetIstureWareRecordList(value1)" var="son">
				<tr>
					<td id="wareid">
						<s:property value="#son.ordernumber" />
					</td>
					<td>
					 <s:property value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber).price" />
					</td>
					<td>
						<s:property value="#son.outprice" />
					</td>
					<td >
						<s:property value="WareHouseById(#son.warehouse).name" />
					</td>
					<td>
						<s:property value="#son.count" />
					</td>
					<td>
						<s:property value="WaresByNumber(#son.productnumber).unit" />
					</td>
				</tr>
			</s:iterator>
		</table>

	</body>
	<script>
     		<s:if test="WaresByNumber(value1)!=null">
				
				
				$("#pronum").text("<s:property value="WaresByNumber(value1).number"/>");
				$("#name").text("<s:property value="WaresByNumber(value1).name"/>");
				$("#specifications").text("<s:property value="WaresByNumber(value1).specifications"/>");
				$("#models").text("<s:property value="ModelsById(WaresByNumber(value1).models).name"/>");
				$("#madein").text("<s:property value="WaresByNumber(value1).madein"/>");
				$("#suppliers").text("<s:property value="SuppliersById(WaresByNumber(value1).suppliers)"/>");
				
			
				
			</s:if>
   		</script>
</html>
