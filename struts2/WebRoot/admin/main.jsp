<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><s:property value="getSystemValue('sitename')" />
		</title>
		<link type="text/css" rel="stylesheet"
			href="<%=path%>/admin/css/adminstyle.css" />
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/js/menu.js"></script>
	</head>

	<body>

		<script type="text/javascript">
	function ReUserPassword() {
		document.getElementById("npwd").value="";
		document.getElementById("npwd1").value="";
		document.getElementById("pwd").value="";
	
		showBg();
	}
	
	function postPassword(){
		var npwd = document.getElementById("npwd").value;
		var npwd1 = document.getElementById("npwd1").value;
		var pwd = document.getElementById("pwd").value;
		
		if(npwd=="" || npwd1==""  || pwd==""){
			alert("请完整填写！");
			return;
		}
		
		if(npwd!=npwd1){
			alert("新密码两次输入不一致！");
			return;
		}
		
		closeBg();
		$.post("<%=path%>/admin.action?function=adminrepass&pwd=" + pwd
				+ "&npwd=" + npwd, function(data) {
			if (data == '"Password error"')
				alert("原密码输入错误！");
			if (data == '"Success"')
				alert("密码更改成功！请牢记此密码");
			if (data == '"Fail"')
				alert("系统错误，修改失败！");
		}, "text");

	}

	//显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css( {
			height : bh,
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
		<div id="main">
			<div id="fullbg" style="height: 100%; z-index: 99999999;"></div>
			<div id="dialog" style="z-index: 9999999;">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div
						style="width: 35%; float: left; display: inline; text-align: right; line-height: 30px;">
						原密码：
						<br />
						新密码：
						<br />
						重复密码：

					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="password" id="pwd" style="width: 70%">
						</br>
						<input type="password" id="npwd1" style="width: 70%">
						</br>
						<input type="password" id="npwd" style="width: 70%">
					</div>
					<div
						style="width: 30%; margin-left: 35%; margin-top: 20px; line-height: 30px; background: #00a5a5; display: inline; float: left;"
						onclick="javascript: postPassword();">
						<font color="#ffffff">修改</font>
					</div>


				</div>
			</div>
		</div>
		<div class="top"></div>
		<div id="header">
			<div class="logo">
				<s:property value="getSystemValue('sitename')" />
				&nbsp;<span style="float:right;line-height:20px;margin-top:20px;font-size:10px">汽修企业互联网+智慧解决方案</span>
			</div>
			<div class="navigation">
				<s:include value="/admin/usercenter.jsp"></s:include>
			</div>
		</div>
		<div id="content">
			<s:include value="/admin/right.jsp"></s:include>
			<div class="m-right">
				<div class="right-nav">
					<ul>

						<li style="margin-left: 25px;">
						<!-- 	★您当前的位置： --> 操作区
						</li>
					<!--  	<li>
							<a href="#">系统公告</a>
						</li>
						<li>
							>
						</li>
						<li>
							<a href="#">最新公告</a>
						</li> -->
					</ul>
				</div>
				<div class="main">
					<iframe src="" style="width:100%;height:100%"
						id="sonleft" name="sonleft">

					</iframe>
				</div>
			</div>
		</div>
		<div class="bottom"></div>
		<div id="footer">
			<p>
				Copyright© 2017
				<s:property value="getSystemValue('sitename')" />
				版权所有 （技术支持：青岛灵基网络科技有限公司）
			</p>
		</div>
		<script>
	navList(12);
</script>
	</body>
</html>