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
		<title><s:property value="getSystemValue('sitename')" /> 出库单</title>

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
		<SCRIPT type="text/javascript">
		var t;
		var dataList= new Array();
		</SCRIPT>
	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
	<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
			<a href="javascript:printout();">导出</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p  style="margin: 0px;">
			<font id="title2" size="5">出库单详情</font>
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
							出库类型
						</td>
						<td width="10%">
							领料类型
						</td>
						<td width="10%">
							仓库
						</td>
						<td width="15%">
							出库日期
						</td>

					</tr>


				<s:if test="value1==null">
					<s:iterator value="OutWareListByDotype(1)" var="son" status="index">
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
							<s:if test="#son.dotype==1">
								维修订单出库
							</s:if>
							<s:if test="#son.dotype==2">
								员工损耗出库
							</s:if>
							</td>
							<td>
							<s:if test="#son.dotype==1">
							<s:property value="#son.getuser" /> 
							</s:if>
							<s:if test="#son.dotype==2">
								<s:property value="AdminByUsername(#son.getuser).name" />
							</s:if>
							</td>
							<td>
								<s:property value="WareHouseById(#son.warehouse).name" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							
							<s:if test="#son.dotype==1">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="#son.getuser" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("1");
								</SCRIPT>
							</s:if>
							<s:if test="#son.dotype==2">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="AdminByUsername(#son.getuser).name" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("2");
								</SCRIPT>
							</s:if>
							

						</tr>
					</s:iterator>
				</s:if>
				<s:if test="value1!=null&&value2!=null">
					<s:iterator value="OutWareListByDotype2(value2)" var="son" status="index">
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
							<s:if test="#son.dotype==1">
								维修订单出库
							</s:if>
							<s:if test="#son.dotype==2">
								员工损耗出库
							</s:if>
							</td>
							<td>
							<s:if test="#son.dotype==1">
							<s:property value="#son.getuser" /> 
							</s:if>
							<s:if test="#son.dotype==2">
								<s:property value="AdminByUsername(#son.getuser).name" />
							</s:if>
							</td>
							<td>
								<s:property value="WareHouseById(#son.warehouse).name" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							
							<s:if test="#son.dotype==1">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="#son.getuser" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("3");
								</SCRIPT>
							</s:if>
							<s:if test="#son.dotype==2">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="AdminByUsername(#son.getuser).name" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("4");
								</SCRIPT>
							</s:if>
							

						</tr>
					</s:iterator>
				</s:if>
				<s:if test="value1!=null">
					<s:iterator value="OutWareListByDotype1(value1)" var="son" status="index">
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
							<s:if test="#son.dotype==1">
								维修订单出库
							</s:if>
							<s:if test="#son.dotype==2">
								员工损耗出库
							</s:if>
							</td>
							<td>
							<s:if test="#son.dotype==1">
							<s:property value="#son.getuser" /> 
							</s:if>
							<s:if test="#son.dotype==2">
								<s:property value="AdminByUsername(#son.getuser).name" />
							</s:if>
							</td>
							<td>
								<s:property value="WareHouseById(#son.warehouse).name" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							
							<s:if test="#son.dotype==1">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="#son.getuser" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("3");
								</SCRIPT>
							</s:if>
							<s:if test="#son.dotype==2">
								<SCRIPT type="text/javascript">
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="AdminByUsername(#son.getuser).name" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
								console.log("4");
								</SCRIPT>
							</s:if>
							

						</tr>
					</s:iterator>
				</s:if>
				</table>
			</div>
		</div>
		<script type="text/javascript">
		//Post方式提交表单
		function printout() { 
		
		console.log(dataList);
		var title="青岛迅比迪汽车服务有限公司  出库单 "; //第一个POST数据
		var headers=new Array("货号","品名","规格","车型","生产厂家","数量","单位","进价","领料类型","仓库","出库日期","备注");
		var other=new Array("操作员：<s:property value='AdminByUsername(#session.adminuser.username).name' />","电话：0532-67768266","单位：元").join(',');
		
		var ExportForm = document.createElement("FORM");
		
		var newElement = document.createElement("input");
		newElement.setAttribute("name","p.title");
		newElement.setAttribute("type","hidden");
		newElement.value = title;
		ExportForm.appendChild(newElement);
		
		var newElement1 = document.createElement("input");
		newElement1.setAttribute("name","p.headers");
		newElement1.setAttribute("type","hidden");
		newElement1.value = headers;
		ExportForm.appendChild(newElement1);
		
		var newElement2 = document.createElement("input");
		newElement2.setAttribute("name","p.other");
		newElement2.setAttribute("type","hidden");
		newElement2.value = other;
		ExportForm.appendChild(newElement2);
		
		var newElement3 = document.createElement("input");
		newElement3.setAttribute("name","p.dataList");
		newElement3.setAttribute("type","hidden");
		newElement3.value = dataList;
		ExportForm.appendChild(newElement3);
		
		document.body.appendChild(ExportForm);
		ExportForm.setAttribute("target","_blank");
		ExportForm.method ="POST";
		var postUrl = "<%=path%>/exportExcel.action"; //提交地址
		ExportForm.action = postUrl;
		console.log(ExportForm);
		ExportForm.submit();
		}
		</script>
	</body>

</html>
