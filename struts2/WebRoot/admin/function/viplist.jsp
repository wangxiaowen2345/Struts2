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
		<title>会员管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%;height: 50px;margin-left: 2%;">
		<div style="float:left;width:22%;margin-top: 20px;margin-bottom: 20px;margin-left: 0px;">
			<button onclick="location.href='<%=path %>/admin/function/card.jsp?function=viplist'" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">刷卡查询</button>
			</div>
		<div style="float:left;width:20%; height: 30px;margin-left: 50%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px; height: 30px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">姓名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">手机号</font>
			</div>
			
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">卡号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">有效期</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">账目金额</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>
			

	<div id="content">
			<s:iterator value="VipList(page)" var="son">
				<div id="left">
					<s:property value="#son.name" />
				</div>
				<div id="middle">
					<s:property value="#son.phone" />
				</div>
				<div id="middle">
					<s:property value="#son.usernum" />
				</div>
				<div id="middle">
				<s:date name="time" format="yyyy-MM-dd hh:mm" nice="false"  />
					<s:property value="#expdate" />
				</div>
				<div id="middle" >
					<s:property value="#son.balance" />
				</div>
				<div id="right" >
					<a href='<%=path %>/admin.action?function=cardtoaddvip&value1=<s:property value="#son.usernum" />'>查看</a>
					<a href='<%=path %>/admin.action?function=loss&value5=<s:property value="#son.id" />' >挂失</a>
				</div>
			</s:iterator>
	</div>

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
	
	
	var cardnum = "<s:property value="value1"/>";
	if(cardnum!=""){
		$("#fast").val(cardnum);
		fast();
	}
	
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
	
	Date.prototype.Format = function(fmt)
{
    //author: meizz
    var o =
     {
        "M+" : this.getMonth() + 1, //月份
        "d+" : this.getDate()-1, //日
        "h+" : this.getHours(), //小时
        "m+" : this.getMinutes(), //分
        "s+" : this.getSeconds(), //秒
        "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
        "S" : this.getMilliseconds() //毫秒
     };
    if (/(y+)/.test(fmt))
         fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
	function fast(){
		var s = $("#fast").val();
	
     	document.getElementById("content").innerHTML = "";
		$.post("<%=path%>/admin.action?function=fastviplist",{value1:s},
    		function(data) {
    		
     			for(var i = 0;i<data.length;i++){
     			
	     			var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle'>"
							+data[i][1]
							+"</div>"
							
							+"<div id='middle'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle'>"
							+new Date(data[i][4]).Format("yyyy-MM-dd hh:mm:ss")
							+"</div>"
							+"<div id='middle' >"
							+data[i][5]
							+"</div>"
							+"<div id='right' >"
							+"<a href='<%=path %>/admin.action?function=cardtoaddvip&value1="+data[i][2]+"'>查看</a>"
							+"</div>"
							;
							
					document.getElementById("content").innerHTML += c;
					}
    		},"json");
	}
	
</script>
</html>
