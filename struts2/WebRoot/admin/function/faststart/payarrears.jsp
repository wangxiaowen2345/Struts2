<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>My JSP 'payarrears.jsp' starting page</title>
    
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <s:set name="cf" value="CashFlowById(value2)"/>
  
  <body>
    
    订单号码：<s:property value="#cf.number"/><br />
    欠款金额：<s:property value="#cf.reallytotal"/>&nbsp;(需全额付款)
    <br />
		付款方式：
		<SELECT id="paytype" style="width: 155px;" onchange="changepaytype();"
			onkeydown="changepaytype();" onblur="changepaytype();">

			<option value="0">
				现金
			</option>
			<option value="1">
				银行卡
			</option>
			<option value="2" <s:if test="value1!=null">selected="selected"</s:if>>
				会员卡
			</option>
			
		</SELECT>
		
		<span id="vip">
		<s:if test="value1!=null">
		<br />
			付款会员：<s:property value="VipByUserNum(value1).name"/>
		</s:if>
		</span>
		
		
		<br />
		
		<button onclick="pay();">
			结款
		</button>
    
    	
    
    
    
    
  </body>
  
  <script type="text/javascript">
  
  	function changepaytype(){
		
		var paytype = $("#paytype").val();
		
		if(paytype==2)
			location.href="<%=path %>/admin/function/card.jsp?function=payarrears&value2=<s:property value="#cf.id"/>";

	}
	
	var paytype = $("#paytype").val();
	
	if(paytype!=2)
		document.getElementById("vip").innerHTML="";

	
	
	
	function pay(){
	
		var reallytotal = $("#reallytotal").val();
		var paytype = $("#paytype").val();
		var payuser = "<s:property value="value1"/>";
		var douser = "<s:property value="#session.adminuser.username"/>";

		if (paytype==2 && payuser == "") {
			alert("请重新刷卡");
			return;
		}
		if (reallytotal=="") {
			alert("实付金额必须输入整数！");
			return;
		}
		
		
		if (paytype!=2) {
			payuser = "";
		}
		
		
	
		if(window.confirm('维修单号：<s:property value="#cf.number"/>，金额：<s:property value="#cf.reallytotal"/>元，请确认！')){
                 $.post("<%=path %>/admin.action?function=payrepairorder",
					{"cf.number":"<s:property value="#cf.number"/>",
					"cf.type":"1","cf.total":"<s:property value="#cf.total"/>",
					"cf.douser":douser,"cf.paytype":paytype,"cf.payuser":payuser,
					"cf.reallytotal":"<s:property value="#cf.reallytotal"/>",
					"cf.fid":"<s:property value="#cf.id"/>"},
					function(data){
						if(data=="\"Success\"")
						{
							alert("结款成功！");
							location.href="<%=path %>/admin.action?function=arrearslist";
						}
						if(data=="\"vip not find\""){
							alert("未找到此会员！");
						}
						if(data=="\"vip be overdue\""){
							alert("该会员卡已到期！");
						}
						if(data=="\"not sufficient funds\""){
							alert("会员卡余额不足！");
						}
				},"text");
				
                 return true;
              }else{
                 alert("您已取消此项目的添加。");
                 return false;
           
             }
	}
  
  </script>
  
</html>
