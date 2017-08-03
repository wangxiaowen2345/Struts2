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
		<title>挂失列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%;height: 50px;margin-left: 2%;">
		
		<div style="float:left;width:20%; height: 30px;margin-left: 72%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px; height: 30px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;width:7%">
				<font color="#ffffff">卡号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">姓名</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">手机号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">类别</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">车牌号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">车型</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">有效期</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">账目金额</font>
			</div>
			<div id="right" style="background: #00a5a5;width:7%">
				<font color="#ffffff">支付方式</font>
			</div>
			
			

	<div id="content">
			<s:iterator value="LossList(page)" var="son">
				<div id="left" style="width:7%">
					<s:property value="#son.usernum" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.name" />
				</div>
				<div id="middle">
					<s:property value="#son.phone" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.kind" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.carnum" />
				</div>
				<div id="middle" >
					<s:property value="ModelsById(#son.models).name" />
				</div>
				<div id="middle" >
					<s:date name="expdate" format="yyyy-MM-dd hh:mm" nice="false"  />
					<s:property value="#expdate" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.balance" />
				</div>
				<div id="right"style="width:7%" >
<!--					<s:property value="#son.payment" />-->
					<s:if test="#son.payment==0">现金</s:if>
					<s:if test="#son.payment==1">银行卡</s:if>
					<s:if test="#son.payment==2">会员卡</s:if>
					<s:if test="#son.payment==3">挂单</s:if>
					<s:if test="#son.payment==4">支付宝</s:if>
				</div>
			</s:iterator>
	</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
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
        "d+" : this.getDate(), //日
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
		$.post("<%=path%>/admin.action?function=fastuserloss",{value1:s},
    		function(data) {
    			
     			for(var i = 0;i<data.length;i++){
     				if(data[i][8]==0)
					var a="现金";
					if(data[i][8]==1)
					var a="银行卡";
					if(data[i][8]==2)
					var a="会员卡";
					if(data[i][8]==3)
					var a="挂单";
					if(data[i][8]==4)
					var a="支付宝";
	     			var c = "<div id='left' style='width:7%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' >"
							+new Date(data[i][6]).Format("yyyy-MM-dd hh:mm")
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][7]
							+"</div>"
							+"<div id='right' style='width:7%'>"
							+a
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
					}
    		},"json");
	}
	
</script>
</html>
