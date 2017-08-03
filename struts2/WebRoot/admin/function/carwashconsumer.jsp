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
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<title><s:property value="getSystemValue('sitename')" />  洗车卡明细表</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<style>
		table {
			border-collapse: collapse;
			border-spacing: 0;
			border-left: 1px solid #000;
			border-top: 1px solid #000;
			font-size: 12px;
			margin-bottom: 20px
		}
		
		th,td {
			border-right: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		
		th {
			font-weight: bold;
		}
		</style>
		<SCRIPT type="text/javascript">
		var t;
		var dataList= new Array();
		</SCRIPT>
	</head>

	<body style="text-align: center; font-family: 'microsoft yahei';">
		<div style="width: 100%; text-align: right;">
			<a href="javascript:window.print();">打印</a> &nbsp;&nbsp;&nbsp;
			<a href="javascript:printout();">导出</a> &nbsp;&nbsp;&nbsp;

		</div>
		<p style="margin: 0px;">
			<font size="5">洗车卡消费结算明细表</font>
		</p>

		<p style="margin: 0px;">
			公司名称：青岛迅比迪汽车服务有限公司 &nbsp; 电话：0532-67768266
		</p>
		<p style="margin: 0px;">

			&nbsp; &nbsp; 单位：元
		</p>
		<table width="100%">
			<tr>
				<td width="10%">
					卡号：
				</td>
				<td width="15%">
					<s:property value="CarWashByNum(value1).number" />
				</td>
				<td width="10%" colspan="2">
					姓名：
				</td>
				<td width="15%" colspan="2">
					<s:property value="CarWashByNum(value1).name" />
				</td>
				<td width="10%" colspan="2">
					手机号：
				</td>
				<td width="15%" colspan="2">
					<s:property value="CarWashByNum(value1).tel" />
				</td>

			</tr>
			<tr>
				<td>
					剩余次数：
				</td>
				<td>
					<s:property value="CarWashByNum(value1).residuedegree" />
				</td>

				<td colspan="4">
					到期时间：
				</td>
				<td colspan="4">
					<s:property value='DateFormat("yyyy-MM-dd",CarWashByNum(value1).expdate)' />
				</td>

			</tr>
		</table>
		<table width="100%">
			<tr>
				<td colspan="10" style="font-size: 17px">
					消费记录：
				</td>
			</tr>
			<s:iterator value="CarWashRecordByNum(value1)" var="son" status="index">
				<tr>
					<td>
						操作：
					
					<s:if test="#son.dotype==0">
						消费
					</s:if>
						<s:if test="#son.dotype==1">
						充值
					</s:if>

					</td>
					<td>
						金额：
					
						<s:property value="#son.outprice" />
					</td>
					<td>
						付款方式：
					
						<s:if test="#son.payment==0">
						现金
					</s:if>
						<s:if test="#son.payment==1">
						银行卡
					</s:if>
						<s:if test="#son.payment==2">
						会员卡
					</s:if>
						<s:if test="#son.payment==3">
						挂单
					</s:if>
						<s:if test="#son.payment==4">
						支付宝
					</s:if>
						<s:if test="#son.payment==5">
						洗车卡
					</s:if>
					</td>
					<td>
						时间：
					
						<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
					</td>
					<td>
						操作员：
					
						<s:property value="AdminByUsername(#son.douser).name" />
					</td>
				</tr>
				<SCRIPT type="text/javascript">
					var c;
					var type="<s:property value="#son.dotype" />";
					if(type==0)
						c="消费";
					else
						c="充值";
						
					var i;
					var price="<s:property value="#son.payment" />";
					if(price==0)
						i="现金";
					if(price==1)
						i="银行卡";
					if(price==2)
						i="会员卡";
					if(price==3)
						i="挂单";
					if(price==4)
						i="支付宝";
					if(price==5)
						i="洗车卡";
					t = new Array("<s:property value='CarWashByNum(value1).name' />","<s:property value="CarWashByNum(value1).tel" />",c,"<s:property value="#son.outprice" />",i,"<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","<s:property value="AdminByUsername(#son.douser).name" />","");
					dataList[<s:property value="#index.index" />] = t;
				</SCRIPT>
			</s:iterator>
		</table>
		<p style="margin: 0px;">
			欢迎您下次光临！祝您一路平安！
		</p>
		<p style="margin-bottom: 50px;">
			操作员:
			<s:property value="#session.adminuser.name" />
			&nbsp;&nbsp;&nbsp;&nbsp;客户签名:
		</p>
		<SCRIPT type="text/javascript">
		
		function printout(){
		
		var title=$("title").text();
		
		var headers=new Array("姓名","手机号","操作","金额","付款方式","送洗时间","操作员","备注");
		var other=new Array("卡号：<s:property value="CarWashByNum(value1).number" />","剩余次数：<s:property value="CarWashByNum(value1).residuedegree" />",
	    "到期时间：<s:property value='DateFormat("yyyy-MM-dd",CarWashByNum(value1).expdate)' />").join(',');
		window.location.href="<%=path%>/exportExcel.action?p.title="+title+"&p.headers="+headers+"&p.other="+other+"&p.dataList="+dataList;
    		}
		
		</SCRIPT>
	</body>
</html>
