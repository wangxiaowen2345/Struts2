<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	
    
    <title>会员资料</title>
   
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>  
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
	
	<s:if test="function=='viptomaintain'">
	<SCRIPT LANGUAGE="JavaScript">
 
　　function openwin()
 
　　{
 
　　		var child = window.open("<%=path %>/admin.action?function=carmanagement&page=1&value1=son", "newwin", "height=600, width=1000,toolbar=no,scrollbars="+scroll+",menubar=no");
  
  		if(!child.closed){ 
			if(!window .close()) 
			{ 
				var textValue = frm.txt.value; parent.frm0.txt0.value = textValue; 
			} 
			else 
			{ 
				window .close(); 
				child.close(); 
			} 
		}
 	
　　}
 
　　</SCRIPT>
	</s:if>
	
	
	
	
  </head>
  
  <body style="text-align: center;font-family: 'Microsoft YaHei';">
    <div style="margin-top: 20px;">
			<s:if test="function=='viptomaintain'&&VipByUserNum(value1)!=null">
			
			<div
				style="width: 40%; float: left; text-align: right; display: inline; line-height: 50px; font-size: 20px;">

				会员卡号：
				<br />
				姓名：
				<br />
				电话：
				<br />
				地址：
				<br />
				会员卡余额：
				<br />
				有效期至：
				<br />
				维修车辆：
				

			</div>
			<div
				style="width: 60%; float: right; display: inline; line-height: 50px;text-align: left;">

				<input type="text" id="usernum" value="<s:property value="value1"/>"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly" />
				&nbsp;
				<br />
				<input type="text" id="name"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>
				&nbsp;
				<br />
				<input type="text" id="tel"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>
				&nbsp;
				<br />
				<input type="text" id="address"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>
				&nbsp;
				<br />
				<input type="text" id="balence"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>
				&nbsp;
				<br />
				<input type="text" id="timet"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>
				&nbsp;
				<br/>
				<input type="text" id="carnum"
					style="width: 40%; height: 30px; font-size: 15px;" readonly="readonly"/>&nbsp;
				<button onclick="openwin()" style=" height: 25px;">
					选择车辆
				</button>
				<br/>
				
				
				
				
			
				
				
				

			</div>
			
		</div>
		<div style="text-align: center;">
			<p style="color: red;" id="msg">
				
			</p>
			
			<button onclick="sub();"
				style="width: 200px; height: 40px; margin-top: 10px; background: #00a5a5; color: #ffffff; border: 0px; font-size: 25px;">
				生成维修单
			</button>
		</div>
		
		<form id="myform" action="<%=path %>/admin.action?function=foundmaintain" method="post">
		
			<input type="hidden" id="usernum" name="value1" value="<s:property value="value1"/>" />
			<input type="hidden" id="carid" name="value2"/>
			
		</form>
		
		</s:if>
			<s:else>
				<font size="5">未查询到此用户，<a href="javascript:history.go(-1);">点此返回</a></font>
			</s:else>
		
		<script type="text/javascript">
			
		
		
		
		
			if("<s:property value="value1"/>"=="")
				location.href = "<%=path %>/admin/function/card.jsp?function=viptomaintain";
				
			function sub(){
				var carid = $("#carid").val();
				var usernum = $("#usernum").val();
				
				if(carid=="" || usernum==""){
					alert("请完整填写表单");
					return;
				}
				
				document.getElementById("myform").submit();
				
			}
			
			
				
				
			
		</script>
		
		
   		<script>
     		<s:if test="VipByUserNum(value1)!=null">
				
				
				$("#name").val("<s:property value="VipByUserNum(value1).name"/>");
				$("#tel").val("<s:property value="VipByUserNum(value1).phone"/>");
				$("#address").val("<s:property value="VipByUserNum(value1).address"/>");
				$("#balence").val("<s:property value="VipByUserNum(value1).balance"/>");
				$("#payment").val("<s:property value="VipByUserNum(value1).payment"/>");
				var timess = "<s:property value="DateUtil(VipByUserNum(value1).expdate).yyyy"/>年" 
							+"<s:property value="DateUtil(VipByUserNum(value1).expdate).mm"/>月"
							+"<s:property value="DateUtil(VipByUserNum(value1).expdate).dd"/>日"; 
				
				$("#timet").val(timess);
				document.getElementById('name').readOnly=true;
				document.getElementById('tel').readOnly=true;
				document.getElementById('address').readOnly=true;
				document.getElementById('balence').readOnly=true;
				
				
			</s:if>
   		</script>
    
  </body>
</html>
