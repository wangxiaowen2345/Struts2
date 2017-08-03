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
		<title><s:property value="getSystemValue('sitename')" /> 员工损耗单</title>

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
		var op=0;
		</SCRIPT>
	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
	<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
			<a href="javascript:printout();">导出</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p  style="margin: 0px;">
			<font id="title2" size="5">员工损耗单详情</font>
		</p>

		<p  style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>
		
		<!-- ><button onclick="javascript:location.href='<%=path%>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->

	
		<div id="div1" style="margin-left: 2%; margin-top: 10px;">



			<div id="div1" style="  margin-top: 10px;">
			
			<table width="95%">
					<tr>
						<td>
							员工：
							<s:property value="SelectAdminUserById(value1).name" />
						</td>
						<td>
							电话：0532-67768266
						</td>
						<td>
							损耗总额：
							<font id="all" ></font>
						</td>
					</tr>
				
				</table>
				<table width="95%">
					<tr>
						<td width="10%">
							订单号
						</td>
						<td width="7%">
							货号
						</td>
						<td width="10%">
							品名
						</td>
						<td width="10%">
							规格
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
							金额
						</td>
						
						<td width="10%">
							仓库
						</td>
						<td width="10%">
							损耗部门
						</td>
						<td width="10%">
							 损耗日期
						</td>
						<td width="10%">
							操作
						</td>

					</tr>



					<s:iterator value="EmployeeOutByDotype(1)" var="son" status="index">
						<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
						<s:set name="reco" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
						<tr>
							<td>
								<s:property value="#son.ordernumber" />
							</td>
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
								<s:property value="#son.docount" />
							</td>
							<td>
								<s:property value="#pro.unit" />
							</td>
							<td>
								<s:property value="#reco.price" />
							</td>
							<td>
								<s:property value="#son.docount*#reco.price" />
							</td>
							
							<td>
								<s:property value="WareHouseById(#son.warehouse).name" />
							</td>
							<td>
								<s:property value="DepartmentById(#son.department).departmentname" />
							</td>
							<td>
								<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
							</td>
							<td>
								<a href="javascript:revoke('<s:property value="#son.id" />');">撤销出库</a>
							</td>
							<SCRIPT type="text/javascript">
							var total="<s:property value="#son.docount*#reco.price" />";
							
							op= parseInt(total)+parseInt(op);
							</Script>
							<SCRIPT type="text/javascript">
									
									t = new Array("<s:property value="#son.ordernumber" />","<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />","<s:property value="#reco.price" />","<s:property value="#son.docount*#reco.price" />","<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value="DepartmentById(#son.department).departmentname" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
									dataList[<s:property value="#index.index" />] = t;
							</SCRIPT>

						</tr>
					</s:iterator>
				
				</table>
			</div>
		</div>
		<SCRIPT type="text/javascript">
		document.getElementById("all").innerText=op;
		function printout(){
		var title=$("title").text();
		var headers=new Array("订单号","货号","品名","规格","数量","单位","进价","金额","仓库","损耗部门","损耗日期","备注");
		var other=new Array("员工：<s:property value="SelectAdminUserById(value1).name" />","电话：0532-67768266","损耗总额："+op).join(',');
		window.location.href="<%=path%>/exportExcel.action?p.title="+title+"&p.headers="+headers+"&p.other="+other+"&p.dataList="+dataList;
		
    		}
    		
  		function revoke(i){
				$.post("<%=path %>/admin.action?function=revoke",
				{value5:i},
					function(data){
						alert(data);
						location.reload();
						
				},"text");
				
			}
		</SCRIPT>
	</body>

</html>
