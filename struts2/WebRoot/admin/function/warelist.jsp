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
		<title><s:property value="getSystemValue('sitename')" /> 库存单</title>

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
		var warehousename;
		</SCRIPT>
	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
	<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
			<a href="javascript:printout();">导出</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p  style="margin: 0px;">
			<font id="title2" size="5">库存单详情</font>
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
							进价
						</td>
						<td width="10%">
							数量
						</td>
						<td width="5%">
							单位
						</td>
						<td width="5%">
							售价
						</td>
						<td width="7%">
							仓库
						</td>
						
						<td width="10%">
							供应商
						</td>
						<td width="10%">
							时间
						</td>

					</tr>


					<s:iterator value="InventoryList(1,value1)" var="son" status="index">
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
								<s:property value="#reco.price" />
							</td>
							<td>
								<s:property value="#son.count" />
							</td>
							<td>
								<s:property value="#pro.unit" />
							</td>
							<td>
								<s:property value="#son.outprice" />
							</td>
							<td>
								<s:property value="WareHouseById(value1).name" />
							</td>
							<td>
								<s:property value="SuppliersById(#pro.suppliers)" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							
							<SCRIPT type="text/javascript">
									t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#pro.unit" />","<s:property value="#son.count" />","<s:property value="#reco.price*#son.count"/>","<s:property value="#reco.price" />","无");
									dataList[<s:property value="#index.index" />] = t;
									warehousename = "仓库：<s:property value="WareHouseById(#son.warehouse).name" />";
							</SCRIPT>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		
<!--		-->
<!--	<SCRIPT type="text/javascript">-->
<!--		function printout(){-->
<!--		-->
<!--		var title="青岛迅比迪汽车服务有限公司  仓库明细";-->
<!--		var headers=new Array("货号","品名","规格","车型","生产厂家","单位","结存数量","结存金额","平均单价","备注").join(',');-->
<!--		var other=new Array(warehousename,"公司名称：青岛迅比迪汽车服务有限公司","电话：0532-67768266","单位：元").join(',');-->
<!--		$('#titleid').val(title);-->
<!--		$('#headersid').val(headers);-->
<!--		$('#otherid').val(other);-->
<!--		$('#otherid').val(JSON.stringify(dataList));-->
<!--		-->
<!--		$.post("<%=path%>/exportExcel.action",{title:title,headers:headers,other:other,dataList:JSON.stringify(dataList)});-->
<!--		-->
<!--		  }-->
<!--	</SCRIPT>-->
		<script type="text/javascript">
		//Post方式提交表单
		function printout() { 
		
		
		var title = "青岛迅比迪汽车服务有限公司  仓库明细";; //第一个POST数据
		var headers=new Array("货号","品名","规格","车型","生产厂家","单位","结存数量","结存金额","平均单价","备注").join(',');
		var other=new Array(warehousename,"公司名称：青岛迅比迪汽车服务有限公司","电话：0532-67768266","单位：元").join(',');
		
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
