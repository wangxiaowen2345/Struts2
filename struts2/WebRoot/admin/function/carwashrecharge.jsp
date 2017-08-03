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
		<title>洗车卡充值</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>

		<SCRIPT type="text/javascript">
			if("<s:property value="value1"/>"=="")
				location.href="<%=path%>/admin/function/carwashcard.jsp?function=carwashrecharge";
		
		
		</SCRIPT>


	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';margin-bottom:50px">

		<div style="margin-top: 20px;">
			<div
				style="width: 40%; float: left; text-align: right; display: inline; line-height: 50px; font-size: 20px;">

				卡号：
				<br />
				姓名：
				<br />
				电话：
				<br />
				洗车卡余额：
				<br />
				剩余次数：
				<br />
				到期时间：
				<br />
				充值金额：
				<br />
				增加次数：
				<br />
				延期时间：
				<br />
				付款方式：
				<br />



			</div>
			<div style="width: 60%; float: right; display: inline; line-height: 50px; text-align: left;">

				<input type="text" id="number" value="<s:property value="value1"/>"
					style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<input type="text" id="name" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<input type="text" id="tel" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />

				<input type="text" id="balance" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />

				<input type="text" id="residuedegree" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<input type="text" id="expdate" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />

				<input type="text" id="recharge" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br/>
				<input type="text" id="rechargetime" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<select id="figure" style="width: 20%; height: 32px; font-size: 15px;">
					<option value="0">
						0
					</option>
					<option value="1">
						1
					</option>
					<option value="2">
						2
					</option>
					<option value="3">
						3
					</option>
					<option value="4">
						4
					</option>
					<option value="5">
						5
					</option>
					<option value="6">
						6
					</option>
					<option value="7">
						7
					</option>
					<option value="8">
						8
					</option>
					<option value="9">
						9
					</option>
					<option value="10">
						10
					</option>
					<option value="11">
						11
					</option>
					<option value="12">
						12
					</option>
				</select>
				<select id="yearmonth" style="width: 20%; height: 32px; font-size: 15px;">
					<option value="y">
						年
					</option>
					<option value="m">
						月
					</option>
				</select>
				&nbsp;
				<br />
				
				<select id="payment" style="width: 40%; height: 32px; font-size: 15px;">
					<option value="0">
						现金
					</option>
					<option value="1">
						银行卡
					</option>
					
					
					<option value="4">
						支付宝
					</option>
				</select>
				&nbsp;
				<br />



			</div>
		</div>
		<div style="text-align: center;">
			<p style="color: red;" id="msg">

			</p>
			<button onclick="sub();" id="sub"
				style="width: 200px; height: 40px; margin-top: 10px; background: #00a5a5; color: #ffffff; border: 0px; font-size: 25px;">
				确定充值
			</button>
		</div>
		<input type="text" id="douser" style="display: none"
			value="<s:property value="#session.adminuser.username" />" />
		</a>
	</body>
	<script>
	
     		<s:if test="CarWashByNum(value1)!=null">
				
				
				$("#name").val("<s:property value="CarWashByNum(value1).name"/>");
				$("#tel").val("<s:property value="CarWashByNum(value1).tel"/>");
				$("#balance").val("<s:property value="CarWashByNum(value1).balance"/>");
				$("#payment").val("<s:property value="CarWashByNum(value1).payment"/>");
				$("#expdate").val("<s:property value='DateFormat("yyyy-MM-dd",CarWashByNum(value1).expdate)'/>");
				$("#residuedegree").val("<s:property value="CarWashByNum(value1).residuedegree"/>");
				
				document.getElementById('number').readOnly=true;
				document.getElementById('name').readOnly=true;
				document.getElementById('tel').readOnly=true;
				document.getElementById('balance').readOnly=true;				
				document.getElementById('expdate').readOnly=true;		
				document.getElementById('residuedegree').readOnly=true;		
				
			</s:if>
		
   		</script>
	<SCRIPT type="text/javascript">
   			function sub(){
   			
			var number =document.getElementById('number').value;
			var payment =document.getElementById('payment').value;
			var recharge =document.getElementById('recharge').value;
			var residuedegree=document.getElementById('residuedegree').value ;
			var douser=document.getElementById('douser').value;
			var rechargetime=document.getElementById('rechargetime').value;
			var time1=document.getElementById('figure').value ;
			var time2=document.getElementById('yearmonth').value;
			
			var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
			if(!exp.test(recharge)){
			     
			    alert("请输入正确金额！");
			    return;
			}
			var unit = "";
			if(time2=='y')
				unit =  time1+"年";
			else
				unit =  time1+"个月";
			if(confirm("卡号："+number+",充值金额："+recharge+"元，增加次数："+rechargetime))			
			$.post("<%=path%>/admin.action?function=carwashrechargerecord",{value1:number,value2:douser,value3:time1,value4:time2,value6:recharge,value7:rechargetime,value8:payment},
    		function(data) {
    		
    			if(data=="\"success\"")
     				alert("充值成功。");
     			else
     				alert("充值失败！");
    		},"text");  
			
			}
   		</SCRIPT>
</html>
