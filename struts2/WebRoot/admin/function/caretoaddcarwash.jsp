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
		<s:if test="CarWashByNum(value1)==null">
			<title>添加洗车卡</title>
		</s:if>
		<s:else>
			<title>洗车卡信息</title>
		</s:else>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';">
		<div style="margin-top: 20px;">
			<div
				style="width: 40%; float: left; text-align: right; display: inline; line-height: 50px; font-size: 20px;">

				卡号：
				<br />
				类别：
				<br />
				车牌号：
				<br />
				车型：
				<br />
				姓名：
				<br />
				电话：
				<br />
				剩余次数：
				<br />
				<s:if test="CarWashByNum(value1)==null">
				充值金额：<br />
				</s:if>

				有效期至：
				<br />
				付款方式：
				<br />

			</div>
			<div style="width: 60%; float: right; display: inline; line-height: 50px; text-align: left;">

				<input type="text" id="number" value="<s:property value="value1"/>"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly" />
				&nbsp;
				<br />
				<input type="text" id="kind" style="width: 40%; height: 30px; font-size: 15px;"  />
				&nbsp;
				<br />
				<input type="text" id="carnum" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<select style="width: 40%;height:30px;" id="models">
								<s:iterator value="AllModels()" var="son">
								<option value="<s:property value="#son.id"/>" ><s:property value="#son.name"/></option>
								</s:iterator>
				</select>
				<br />
				<input type="text" id="name" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<input type="text" id="tel" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<input type="text" id="residuedegree" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />
				<s:if test="CarWashByNum(value1)==null">
					<input type="text" id="balance" style="width: 40%; height: 30px; font-size: 15px;" />
				&nbsp;
				<br />

					<div style="width: 40%; height: 50px; font-size: 15px; display: none;" id="time1">
						<input type="text" id="timet" style="width: 40%; height: 30px; font-size: 15px;"
							readonly="readonly" />
						<br />
					</div>
					<div style="width: 40%; height: 50px; font-size: 15px;" id="time2">
						<select name="YYYY" onchange="YYYYDD(this.value)" id="yy" style="width: 30%; height: 30px;">
							<option value="">
								请选择 年
							</option>
						</select>
						<select name="MM" onchange="MMDD(this.value)" id="mm" style="width: 30%; height: 30px;">
							<option value="">
								选择 月
							</option>
						</select>
						<select name="DD" style="width: 30%; height: 30px;" id="dd">
							<option value="">
								选择 日
							</option>
						</select>
					</div>
					
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
				</s:if>
				<s:else>
					<input type="text" id="expdate" style="width: 40%; height: 30px; font-size: 15px;" />&nbsp;<br />
					<s:if test="CarWashByNum(value1).payment==0">
					<input type="text" id="payment" style="width: 40%; height: 30px; font-size: 15px;" value="现金"/>&nbsp;<br />
					</s:if>
					<s:if test="CarWashByNum(value1).payment==1">
					<input type="text" id="payment" style="width: 40%; height: 30px; font-size: 15px;" value="银行卡"/>&nbsp;<br />
					</s:if>
					
					
					<s:if test="CarWashByNum(value1).payment==4">
					<input type="text" id="payment" style="width: 40%; height: 30px; font-size: 15px;" value="支付宝"/>&nbsp;<br />
					</s:if>
					
				</s:else>
				


			</div>
		</div>
		<s:if test="CarWashByNum(value1)==null">
			<div style="text-align: center;">
				<p style="color: red;" id="msg">

				</p>
				<button onclick="sub();" id="sub"
					style="width: 200px; height: 40px; margin-top: 10px; background: #00a5a5; color: #ffffff; border: 0px; font-size: 25px;">
					确定添加
				</button>
			</div>
		</s:if>
		<input id="douser" style="display: none;"
			value="<s:property value="#session.adminuser.username" />">
		<script type="text/javascript">
			
		
		
		
		
			if("<s:property value="value1"/>"=="")
				location.href = "<%=path%>/admin/function/carwashcard.jsp?function=caretoaddcarwash";
				
			
			
			function sub(){
				document.getElementById("msg").innerHTML = "正在添加，请勿重复提交";
				var yy = $("#yy").val();
				var mm = $("#mm").val();
				var dd = $("#dd").val();
				var name = $("#name").val();
				var number = $("#number").val();
				var tel = $("#tel").val();
				var residuedegree = $("#residuedegree").val();
				var balance = $("#balance").val();
				var payment = $("#payment").val();
				var douser = $("#douser").val();
				var kind = $("#kind").val();
				var carnum = $("#carnum").val();
				var models = $("#models").val();
				
				if(name=="" || number=="" || tel=="" || residuedegree=="" || balance==""){
					document.getElementById("msg").innerHTML = "请完整填写表单";
					return;
				}
				
				var reg = new RegExp("^[0-9]*$");  
      
    			if(!reg.test(balance)){  
        			document.getElementById("msg").innerHTML = "金额必须为数字，请修改!"; 
        			return; 
    			}  
    			if(!/^[0-9]*$/.test(balance)){  
        			document.getElementById("msg").innerHTML = "金额必须为数字，请修改!"; 
        			return;   
    			}  
				
				if(mm<10)
					mm="0"+mm;
				if(dd<10)
					dd="0"+dd;
				var expdate = yy+"-"+mm+"-"+dd+" 00:00:00";
				
				
				if(expdate.length<19){
					document.getElementById("msg").innerHTML = "请正确选择截至有效期！";
					return;
				}
				$.post("<%=path%>/admin.action?function=addcarwash", 
					{ "carwash.kind":kind,"carwash.carnum":carnum,"carwash.models":models,"carwash.name":name,"carwash.number":number,"carwash.tel":tel,"carwash.residuedegree":residuedegree,"carwash.balance":balance,"carwash.expdate":expdate,"carwash.payment":payment },
   					function(data){
   					alert(data);
    					document.getElementById("msg").innerHTML = data;
   				}, "text");
				
				
				
			}	
				
				
			
		</script>
		<script>
     		<s:if test="CarWashByNum(value1)!=null">
				
				
				$("#name").val("<s:property value="CarWashByNum(value1).name"/>");
				$("#tel").val("<s:property value="CarWashByNum(value1).tel"/>");
				$("#residuedegree").val("<s:property value="CarWashByNum(value1).residuedegree"/>");
				$("#expdate").val("<s:property value='DateFormat("yyyy-MM-dd",CarWashByNum(value1).expdate)'/>");
				$("#kind").val("<s:property value="CarWashByNum(value1).kind"/>");
				$("#carnum").val("<s:property value="CarWashByNum(value1).carnum"/>");
				$("#models").val("<s:property value="CarWashByNum(value1).models"/>");
				var timess = "<s:property value="DateUtil(CarWashByNum(value1).expdate).yyyy"/>年" 
							+"<s:property value="DateUtil(CarWashByNum(value1).expdate).mm"/>月"
							+"<s:property value="DateUtil(CarWashByNum(value1).expdate).dd"/>日"; 
				
				$("#timet").val(timess);
				document.getElementById('name').readOnly=true;
				document.getElementById('tel').readOnly=true;
				document.getElementById('residuedegree').readOnly=true;
				document.getElementById("payment").readOnly=true;
				document.getElementById("expdate").readOnly=true;
				document.getElementById("kind").disabled=true;				
				document.getElementById("carnum").disabled=true;
				document.getElementById("models").disabled=true;
				document.getElementById("time1").style.display="inline";
				document.getElementById("time2").style.display="none";
				document.getElementById("sub").style.display="none";
				
			</s:if>
   		</script>
		<script language="JavaScript"> 
 function YYYYMMDDstart() {
     MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

     //先给年下拉框赋内容   
     var y = new Date().getFullYear();
     for (var i = y; i < (y + 5); i++) //以今年为准，后5年   
     document.getElementById("yy").options.add(new Option(" " + i + " 年", i));

     //赋月份的下拉框   
     for (var i = 1; i < 13; i++)
     document.getElementById("mm").options.add(new Option(" " + i + " 月", i));
	
     document.getElementById("yy").value = y;
     
     
     document.getElementById("mm").value = new Date().getMonth() + 1;
     var n = MonHead[new Date().getMonth()];
     if (new Date().getMonth() == 1 && IsPinYear(YYYYvalue)) n++;
     writeDay(n); //赋日期下拉框Author:meizz   
     document.getElementById("dd").value = new Date().getDate();
 }
 if (document.attachEvent) window.attachEvent("onload", YYYYMMDDstart);
 else window.addEventListener('load', YYYYMMDDstart, false);

 function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
 {
     var MMvalue = document.getElementById("mm").options[document.getElementById("mm").selectedIndex].value;
     if (MMvalue == "") {
         var e = document.getElementById("dd");
         optionsClear(e);
         return;
     }
     var n = MonHead[MMvalue - 1];
     if (MMvalue == 2 && IsPinYear(str)) n++;
     writeDay(n)
 }

 function MMDD(str) //月发生变化时日期联动   
 {
     var YYYYvalue = document.getElementById("yy").options[document.getElementById("yy").selectedIndex].value;
     if (YYYYvalue == "") {
         var e = document.getElementById("dd");
         optionsClear(e);
         return;
     }
     var n = MonHead[str - 1];
     if (str == 2 && IsPinYear(YYYYvalue)) n++;
     writeDay(n)
 }

 function writeDay(n) //据条件写日期的下拉框   
 {
     var e = document.getElementById("dd");
     optionsClear(e);
     for (var i = 1; i < (n + 1); i++)
     e.options.add(new Option(" " + i + " 日", i));
 }

 function IsPinYear(year) //判断是否闰平年   
 {
     return (0 == year % 4 && (year % 100 != 0 || year % 400 == 0));
 }

 function optionsClear(e) {
     e.options.length = 1;
 }  

   		</script>


	</body>
</html>
