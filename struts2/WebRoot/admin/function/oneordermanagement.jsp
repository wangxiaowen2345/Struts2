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
		<title>订单详情</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
	
		<!-- ><button onclick="javascript:location.href='<%=path %>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->
		<br/>
		<div style="margin-left: 2%;;">
		订单编号：<s:property value="OrderByNumber(value1).number"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		供应商：<s:property value="SuppliersById(OrderByNumber(value1).suppliers)"/>
		<br/>
		订单时间：<s:property value="DateFormat('yyyy-MM-dd',OrderByNumber(value1).time)"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		订单金额：<s:property value="OrderByNumber(value1).alltotalprice"/>元
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		订单状态：<s:if test="OrderByNumber(value1).tag==0" >
					<font color="red">未确认</font>&nbsp;
					<a href='<%=path %>/admin.action?function=subordermanagement&value1=<s:property value="value1"/>'>马上确认</a>
					<a style="display: block;float: right;margin-right: 20px"
							href='<%=path%>/admin.action?function=ordermanagerlack&value1=<s:property value="value1" />'>打印</a>
					
				 </s:if>
				 <s:else>
				 	已确认
				 	<a  style="display: block;float: right;margin-right: 20px"
							href='<%=path%>/admin.action?function=printoneordermanagement&value1=<s:property value="value1" />'>打印</a>
				 </s:else>
		
		
		
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 10px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">ID</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">品名</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">单价</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">小计</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">操作</font>
			</div>


			<s:iterator value="OrderListByNumber(value1)" var="son">
				<div id="left">
					<s:property value="#son.id" />
				</div>
				<div id="middle" style="width:8%">
					<s:property value="#son.productnumber" />
				</div>
				<div id="middle">
					<s:property value="WaresByNumber(#son.productnumber).name" />
				</div>
				<div id="middle" style="width:10%">
					<s:property value="#son.price" />
				</div>
				<div id="middle">
					<s:property value="#son.count" />
				</div>
				<div id="middle">
					<s:property value="#son.count*#son.price" />
				</div>
				<div id="right">
					<a href='javascript:delData(<s:property value='#son.id' />);'>删除</a>
				</div>
			</s:iterator>


			<div id="bottom"  style="margin-bottom: 50px"></div>
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
	function delData(id){
			var delid=id;
			$.post("<%= path%>/admin.action?function=deleteoneorder", 
			{ value5:delid},
   			function(data){
    			if(data=="\"Success\""){
    				alert("删除成功！");
    				location.reload();
    			}
    			
    		}, "text");
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
</script>
</html>
