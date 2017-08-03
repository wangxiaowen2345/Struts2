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
		<title>用户管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
	
		<button onclick="addadmin();"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;"> 
			添加新用户 
		</button>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">ID</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">用户名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">姓名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">密码</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">用户所在组</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>


			<s:iterator value="SelectAllAdminUser()" var="son">
				<div id="left">
					<s:property value="#son.id" />
				</div>
				<div id="middle">
					<s:property value="#son.username" />
				</div>
				<div id="middle">
					<s:property value="#son.name" />
				</div>
				<div id="middle">
					<a
						href="javascript:resetPassword(<s:property value='#son.id' />);">短信重置密码</a>
				</div>
				<div id="middle">
					<s:property value="getPowerNameById(#son.power)" />
				</div>
				<div id="right">
					<a href="">删除</a>&nbsp;
					<a href='javascript:showUserData(<s:property value='#son.id' />,"<s:property value='getPowerNameById(#son.power)' />");'>查看</a>
				</div>
			</s:iterator>


			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

		<div id="main">
			<div id="fullbg"></div>
			<div id="dialog">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div
						style="width: 35%; float: left; display: inline; text-align: right; line-height: 30px;">
						用户名：
						<br />
						用户所在组：
						<br />
						姓名：
						<br />
						电话：
						<br />
					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="text" id="username" style="width: 70%">
						</br>
						<select style="width: 70%;height:24px;" id="power">

							<s:iterator value="getAllPower()" var="son">
								<option value="<s:property value='#son.id'/>" ><s:property value="#son.power" /></option>
							</s:iterator>
						</select>
						</br>
						<input type="text" id="name" style="width: 70%">
						</br>
						<input type="text" id="tel" style="width: 70%">
						</br>

					</div>
					
					<button onclick="updateadmin();">提交</button>

				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	var userId = 0;
	var tag = 0;
	
	function resetPassword(Id){
		
		
		
		userId = Id;
		
        if (confirm("你确定重置密码吗？")) {  
            $.post("<%=path%>/admin.action?function=smsramdomresetpassword&AdminUserId="+Id,
    		function(data) {
    			if(data=='"success"')
     				alert("密码重置成功！已短信发送至账户登记号码。");
     			else
     				alert("密码重置失败！");
    		},"text");  
        }  
        else {  
            alert("本次未对密码进行重置");  
        }  
     	
	}
	
	function addadmin(){
		document.getElementById("username").value = "";
     	document.getElementById("name").value = "";
     	document.getElementById("tel").value = "";
		
		var select = document.getElementById("power");  
		for ( var i = 0; i < select.options.length; i++) {
			if (select.options[i].innerHTML == power) {
				select.options[i].selected = true;
				break;
			}
		}
	
		tag = 1;
		
		showBg();
		
		
	}
	
	

	function updateadmin(){
	
		var username = $("#username").val();
		var power = $("#power").val();
		var name = $("#name").val();
		var tel = $("#tel").val();
		
		var carnum = document.getElementById("username");
		var reg = /^[A-Za-z0-9]+$/;
		if(!reg.test(carnum.value)){         alert("请输入正确用户名!"); return;    } 
		
		if(name=="" || power=="" || name=="" || tel==""){
			alert("表单不能为空！");
			return;
		}
		
		if(tag==0)
		$.post("<%= path%>/admin.action?function=updateadmin", 
			{ "aus.id":userId,"aus.username":username,"aus.power":power,"aus.name":name,"aus.tel":tel },
   			function(data){
    			if(data=="\"Success\""){
    				alert("信息修改成功！");
    				location.reload();
    			}
    			
    			if(data=="\"Admin existence\""){
    				alert("用户名重复，请更换用户名！");
    				location.reload();
    			}
    			
   			}, "text");
   			
   		else
   		$.post("<%= path%>/admin.action?function=addadmin", 
			{ "aus.id":userId,"aus.username":username,"aus.power":power,"aus.name":name,"aus.tel":tel },
   			function(data){
    			if(data=="\"Success\""){
    				alert("用户添加成功！请使用短信重置密码将密码以短信形式发送至用户！");
    				location.reload();
    			}
    			if(data=="\"Admin existence\""){
    				alert("用户名重复，请更换用户名！");
    			}
   			}, "text");
   		
   	}
	
	function showUserData(Id, power) {
		userId = Id;
		
		tag = 0;
		
		document.getElementById("username").value = "";
     	document.getElementById("name").value = "";
     	document.getElementById("tel").value = "";
		
		var select = document.getElementById("power");  
		for ( var i = 0; i < select.options.length; i++) {
			if (select.options[i].innerHTML == power) {
				select.options[i].selected = true;
				break;
			}
		}
		
		
		$.post("<%=path%>/admin.action?function=selectadminuserbyid&AdminUserId="+Id,
    		function(data) {
     			document.getElementById("username").value = data.username + "（不可修改）";
     			document.getElementById("name").value = data.name;
     			document.getElementById("tel").value = data.tel;
    		},"json");
		
		
		showBg();

	}

	//显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css( {
			height : '100%',
			width : bw,
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
</script>
</html>
