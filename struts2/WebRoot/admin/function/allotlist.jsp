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
		<title>调拨列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


	</head>

	<body style="text-align: center;font-family: 'Microsoft YaHei';"><br/>
		<p style="margin: 0px;"><font size="5">调拨列表详情</font>
		<a  style="display: block;margin-right: -25%" href="<%=path%>/admin.action?function=allotwarehouselist">打印	</a>
		</p>
		<div style="width: 100%;height: 50px;margin-left: 2%;">
		
		<div style="float:left;width:20%; height: 30px;margin-left: 72%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px; height: 30px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;width:9%">
				<font color="#ffffff">货号</font>
			</div>
			<div id="left" style="background: #00a5a5;width:9%">
				<font color="#ffffff">订单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:13%">
				<font color="#ffffff">品名</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:9%">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:9%">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:9%">
				<font color="#ffffff">进价</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">调出仓库</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">调入仓库</font>
			</div>
			
			

	<div id="content">
			<s:iterator value="AllotList(page)" var="son">
			<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
			<s:set name="reco" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
				<div id="left" style="width:9%">
					<s:property value="#son.productnumber" />
				</div>
				<div id="middle" style="width:9%">
					<s:property value="#son.ordernumber" />
				</div>
				<div id="middle" style="width:13%">
					<s:property value="#pro.name" />
				</div>
				<div id="middle" style="width:9%">
					<s:property value="#pro.specifications" />
				</div>
				<div id="middle" style="width:9%">
					<s:property value="#son.count" />
				</div>
				<div id="middle" style="width:9%">
					<s:property value="#reco.price" />
				</div>
				<div id="middle" >
					<s:property value="WareHouseById(#son.callout).name" />
				</div>
				
				<div id="right">
					<s:property value="WareHouseById(#son.callin).name" />
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
		$.post("<%=path%>/admin.action?function=fastallot",{value1:s},
    		function(data) {
    			
     			for(var i = 0;i<data.length;i++){
	     			var c = "<div id='left' style='width:9%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:13%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' >"
							+data[i][6]
							+"</div>"
							+"<div id='right' >"
							+data[i][7]
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
					}
    		},"json");
	}
	
</script>
</html>
