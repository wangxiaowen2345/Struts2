
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
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script	src="<%=path %>/admin/bootstrap/js/jquery-1.8.3.min.js"></script>
		<link href="<%=path %>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
		<script src="<%=path %>/admin/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<title>供应商列表</title>

		<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}

#div1 {
	width: 100%;
}

#left {
	float: left;
	width: 10%;
	height: 30px;
	list-style-type: none;
	border-left: 1px solid;
	border-top: 1px solid;
	border-right: 1px solid;
	text-align: center;
	line-height: 30px;
	border-color: #00a5a5;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;
}

#middle {
	float: left;
	width: 24%;
	height: 30px;
	border-top: 1px solid;
	border-right: 1px solid;
	text-align: center;
	line-height: 30px;
	border-color: #00a5a5;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;
}

#right {
	float: left;
	width: 15%;
	height: 30px;
	border-top: 1px solid;
	border-right: 1px solid;
	text-align: center;
	line-height: 30px;
	border-color: #00a5a5;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;
}

#bottom {
	float: left;
	width: 97%;
	height: 0px;
	border-left: 1px solid;
	border-top: 1px solid;
	border-right: 1px solid;
	border-bottom: 0px solid;
	text-align: center;
	border-color: #00a5a5;
}
</style>

		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<link href="<%=path %>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">



	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%;height: 50px;margin-left: 2%;">
		<div style="float:left;width:20%;margin-bottom: 20px;margin-left: 0px;">
			<button onclick="addadmin();"
				style="margin-top: 20px;  background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">   
				添加供应商
			</button>
			</div>
		<div style="float:left;width:20%; height: 30px;margin-left: 57%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
		</div>
		
		<div id="div1" style="margin-left: 2%; width:99%;margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">供货商ID</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">供货商名称</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">电话</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">快速搜索</font>
			</div>

			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>

		<div id="content">
			<s:iterator value="AllSupplies()" var="son">
				<div id="left">
					<s:property value="#son.id" />
				</div>
				<div id="middle">
					<s:property value="#son.name" />
				</div>
				<div id="middle">
					<s:property value="#son.tel" />
				</div>
				<div id="middle">
					<s:property value="#son.fastname" />
				</div>
				<div id="right">
				<a href='javascript:showData(<s:property value='#son.id' />);'>修改资料</a>
					<a
						href='<%=path %>/admin.action?function=newordermanagement&value1=<s:property value="#son.id" />'>下单</a>
				</div>
			</s:iterator>
		</div>
			<div id="bottom" style="margin-bottom:50px;"></div>
		</div>
		
		<div id="main">
			<div id="fullbg"></div>
			<div id="dialog" style="height:210px;">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div
						style="width: 35%; float: left; display: inline; text-align: right; line-height: 36px;">
						供货商：
						<br />
						手机号：
						<br />
						快速搜索：
						<br />
					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="text" id="suppliersname" style="width: 70%" >
						</br>
						<input type="text" id="telphone" style="width: 70%">
						</br><input type="text" id="sonid" style="display: none;" > 
						<input type="text" id="fastname" style="width: 70%">
						</br>
					</div>
					  <button type="button" class="btn btn-default btn-lg " onclick="update();" style="margin-left:40%">提交</button>

				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	var carId = 0;
	var tag = 0;
	function fast(){
		var s = $("#fast").val();
	
     	document.getElementById("content").innerHTML = "";
		$.post("<%=path%>/admin.action?function=fastsup",{value1:s},
    		function(data) {
    		
     			for(var i = 0;i<data.length;i++){
     			
	     			var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle'>"
							+data[i][3]
							+"</div>"
							+"<div id='right'>"
							+"<a href='<%=path %>/admin.action?function=newordermanagement&value1="+data[i][0]+"'>下单</a>"
							+"</div>"
							;
							
					document.getElementById("content").innerHTML += c;
					}
				
    		},"json");
	}
	
			function cf(){
			
				
				
				
									
				
			}
		function addadmin(){
		var carnum = $("#suppliersname").val("");
		var framenum = $("#telphone").val("");
		var framenum = $("#fastname").val("");
		tag = 1;
		showBg();
	}
	function showData(Id) {
		carId = Id;
		var Id=Id;
		tag = 0;
		var suppliersname = $("#suppliersname").val();
		var telphone = $("#telphone").val();
		var fastname = $("#fastname").val();
		
		$.post("<%=path%>/admin.action?function=supplierbyid&value1="+Id,
    		function(data) {
     			document.getElementById("suppliersname").value = data.name ;
     			document.getElementById("telphone").value = data.tel;
     			document.getElementById("fastname").value = data.fastname;
     			document.getElementById("sonid").value = data.id;
    		},"json");
		
		
		showBg();

	}
	
	function update(){
		var carnum = $("#suppliersname").val();
		var framenum = $("#telphone").val();
		var framenum = $("#fastname").val();
		
		if($("#suppliersname").val().trim()==""){
				
					alert("供应商名称不能为空！");
					return;
				}	
		if(tag==0)
		$.post('<%=path%>/admin.action?function=updatesuppliers', 
				{ "suppliers.name":$("#suppliersname").val() 
				, "suppliers.tel":$("#telphone").val() 
				, "suppliers.fastname":$("#fastname").val()
				, "suppliers.id":$("#sonid").val()},
					function(data){
    			if(data=="\"Success\""){
    				alert("信息修改成功！");
    				location.reload();
    			}
    			
   			},"text");
   			
   		else
   		$.post('<%=path%>/admin.action?function=addsuppliers', 
				{ "suppliers.name":$("#suppliersname").val() 
				, "suppliers.tel":$("#telphone").val() 
				, "suppliers.fastname":$("#fastname").val() },
					function (text, status) {
					 	if("Name existence" == text){
					 		alert("供应商名称重复，请更换名称！");
					 		return;
					 	}
					 	if("request error" == text){
					 		alert("请求错误！");
					 		return;
					 	}
					 	if("Success" == text){
					 		alert("供应商添加成功！");
					 		location.reload();
					 	}
				});
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