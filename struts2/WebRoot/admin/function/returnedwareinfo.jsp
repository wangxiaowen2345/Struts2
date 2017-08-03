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
		<title><s:property value="getSystemValue('sitename')" /> 退货单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="<%=path%>/admin/js/jquery.min.js" type="text/javascript"></script>
		<style>
		table {
			border-collapse: collapse;
			border-spacing: 0;
			border-left: 1px solid #000;
			border-top: 1px solid #000;
			font-size: 12px;
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

	<body style="text-align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
	<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
		</div>
		<p  style="margin: 0px;">
			<font id="title2" size="5">退货单详情</font>
		</p>
		<br/>
		<p  style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 
		</p>
		<p  style="margin: 0px;">
			电话：0532-67768266&nbsp; 
		</p>
		<p  style="margin: 0px;">
			单位：元 &nbsp; 
		</p>
		
		
		<!-- ><button onclick="javascript:location.href='<%=path%>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->

	
		<div id="div1" style="margin-left: 2%; margin-top: 10px;">



			<div id="div1" style="  margin-top: 10px;">
			
				<table width="95%">
					<tr>
						
						<td width="6%">
							货号
						</td>
						<td width="10%">
							品名
						</td>
						<td width="10%">
							规格
						</td>
						<td width="10%">
							车型
						</td>
						<td width="10%">
							生产厂家
						</td>
						<td width="5%">
							数量
						</td>
						<td width="5%">
							单位
						</td>
						<td width="7%">
							进价
						</td>
						<td width="10%">
							仓库
						</td>
						<td width="15%">
							出库日期
						</td>

					</tr>

					<s:iterator value="ReturnInfo()" var="son" status="index">
						<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
						<s:set name="reco" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
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
								<s:property value="ModelsById(#pro.models).name" />
							</td>
							<td>
								<s:property value="#pro.madein" />
							</td>
							<td>
								<s:property value="#son.docount" />
							</td>
							<td>
								<s:property value="#pro.unit" />
							</td>
							<td>
								<s:property value="#reco.price" />
							</td>
							
							<td>
								<s:property value="WareHouseById(#son.warehouse).name" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							
							

						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</body>

</html>
