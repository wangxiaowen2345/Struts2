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
		<title>洗车卡管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<div style="width: 100%; height: 50px; margin-left: 2%;">
			<div style="float: left; width: 22%; margin-top: 20px; margin-bottom: 20px; margin-left: 0px;">

			</div>
			<div style="float: left; width: 20%; height: 30px; margin-left: 50%">
				<input id="fast" type="text" onkeyup="fast();"
					style="margin-top: 20px; margin-bottom: 20px; height: 30px; width: 60%;">
				<button onclick="fast();"
					style="width: 30%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
					搜索
				</button>
			</div>
		</div>
		<div id="div1" style="margin-left: 1%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5; width: 10%">
				<font color="#ffffff">卡号</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 10%">
				<font color="#ffffff">姓名</font>
			</div>

			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">手机号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">有效期</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">办卡日期</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 7%">
				<font color="#ffffff">剩余次数</font>
			</div>
			<div id="right" style="background: #00a5a5; width: 16%">
				<font color="#ffffff">操作</font>
			</div>


			<div id="content">
				<s:iterator value="CarWashList(page)" var="son">
					<div id="left" style="width: 10%">
						<s:property value="#son.number" />
					</div>
					<div id="middle" style="width: 10%">
						<s:property value="#son.name" />
					</div>

					<div id="middle">
						<s:property value="#son.tel" />
					</div>
					<div id="middle">
						<s:property value='DateFormat("yyyy-MM-dd",#son.expdate)' />
					</div>
					<div id="middle">
						<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />
					</div>
					<div id="middle" style="width: 7%">
						<s:property value="#son.residuedegree" />
					</div>
					<div id="right" style="width: 16%">
					<a href='<%=path %>/admin.action?function=caretoaddcarwash&value1=<s:property value="#son.number" />'>查看</a>&nbsp;&nbsp;
					<a href='<%=path %>/admin.action?function=losscarwash&value5=<s:property value="#son.id" />' >挂失</a>&nbsp;&nbsp;
					<a href='<%=path%>/admin.action?function=swipingcard&value1=<s:property value="#son.number" />'>洗车</a>&nbsp;&nbsp;
					<a href='<%=path%>/admin.action?function=carwashconsumer&value1=<s:property value="#son.number" />'>查看消费记录</a>
					</div>
				</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

		
	</body>
	<SCRIPT type="text/javascript">
	function fast(){
			var s = $("#fast").val();
	     	document.getElementById("content").innerHTML = "";
			$.post("<%=path%>/admin.action?function=fastcarwashlist",{value1:s},
	    		function(data) {
	    		
	     			for(var i = 0;i<data.length;i++){
	     			
		     			var c = "<div id='left' style='width: 10%'>"
								+data[i][0]
								+"</div>"
								+"<div id='middle' style='width: 10%'>"
								+data[i][1]
								+"</div>"
								+"<div id='middle'>"
								+data[i][2]
								+"</div>"
								+"<div id='middle'>"
								+new Date(data[i][3]).Format("yyyy-MM-dd ")
								+"</div>"
								+"<div id='middle'>"
								+new Date(data[i][4]).Format("yyyy-MM-dd ")
								+"</div>"
								+"<div id='middle' style='width: 7%'>"
								+data[i][5]
								+"</div>"
								+"<div id='right' style='width: 16%'>"
								+"<a href="<%=path%>/admin.action?function=swipingcard&value1="+data[i][0]+"">洗车</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+"<a href='<%=path%>/admin.action?function=carwashconsumer&value1="+data[i][0]+"'>查看消费记录</a>"
								+"</div>";
	
									document.getElementById("content").innerHTML += c;
								}
		
					
	    		},"json");
		}
	</SCRIPT>
	<script type="text/javascript">
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

	
</script>
</html>
