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
		<title>订单管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="<%=path%>/admin/bootstrap/js/jquery-1.8.3.min.js"></script>

		<link href="<%=path%>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="<%=path%>/admin/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
			media="screen">
		<link href="<%=path%>/admin/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet"
			media="screen">
		<script src="<%=path%>/admin/bootstrap/js/bootstrap.min.js" type="text/javascript"
			charset="utf-8"></script>
		<script src="<%=path%>/admin/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path%>/admin/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"
			charset="utf-8"></script>
		<script src="<%=path%>/admin/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript"
			charset="utf-8"></script>
		<script src="<%=path%>/admin/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"
			type="text/javascript" charset="utf-8"></script>



	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
		<div style="width: 100%; height: 60px; margin-left: 2%;">

			<div style="float: left; width: 20%; margin-left: 2%;">
				<div class="input-append date" style="border: 0px; line-height: 30px;" id="timeone" data-date=""
					data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					<span class="add-on" style="padding: 2px; border: 0px; background-color: #fff;">起始时间： <input
							size="14" type="text" value="" id="gettime1" style="height: 30px">
					</span>
					<input type="hidden" id="dtp_input2" value="" style="height: 30px" />
					<button onclick="gettime();"
						style="width: 30%; background: #00a5a5; margin-top: 2px; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
						搜索
					</button>
				</div>
				<div class="input-append date" style="border: 0px; line-height: 30px;" id="timetwo" data-date=""
					data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					<span class="add-on" style="padding: 2px; border: 0px; background-color: #fff;">结束时间： <input
							size="14" type="text" value="" id="gettime2" style="height: 30px">
					</span>
					<input type="hidden" id="dtp_input2" value="" style="height: 30px" />
					<button onclick="reset();"
						style="width: 30%; background: #00a5a5; margin-top: 2px; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
						重置
					</button>
				</div>

			</div>
			<div style="float: left; width: 20%; height: 30px; margin-left: 54%">
				<input id="fast" type="text" onkeyup="fast();"
					style="height: 30px; margin-top: 20px; margin-bottom: 20px; width: 60%;">
				<button onclick="fast();"
					style="width: 30%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
					搜索
				</button>
			</div>
		</div>
		<!-- <button onclick="javascript:location.href='<%=path%>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;"> 
			添加新订单 
		</button> -->
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">ID</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">订单编号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">供应商</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">总价</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">订单时间</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 10%;">
				<font color="#ffffff">订单状态</font>
			</div>
			<div id="right" style="background: #00a5a5; width: 10%;">
				<font color="#ffffff">操作</font>
			</div>


			<div id="content">
				<s:iterator value="OrderList(page)" var="son">
					<div id="left">
						<s:property value="#son.id" />
					</div>
					<div id="middle">
						<s:property value="#son.number" />
					</div>
					<div id="middle">
						<s:property value='SuppliersById(#son.suppliers)' />
					</div>
					<div id="middle">
						<s:property value="#son.alltotalprice" />
					</div>
					<div id="middle">
						<s:date name="time" format="yyyy-MM-dd hh:mm:ss" nice="false" />
						<s:property value="#time" />
					</div>
					<div id="middle" style="width: 10%">
						<s:if test="#son.tag==0">
							<font color='red'>未确认</font>
						</s:if>
						<s:else>
					已确认
					</s:else>
					</div>
					<div id="right" style="width: 10%">
						<!--<s:if test="#son.tag==0">
							<a	href='<%=path%>/admin.action?function=ordermanagerlack&value1=<s:property value="#son.number" />'>打印</a>
						</s:if>
						<s:else>
					<a href='<%=path%>/admin.action?function=printoneordermanagement&value1=<s:property value="#son.number" />'>打印</a>
					</s:else>
						-->
						<a
							href='<%=path%>/admin.action?function=oneordermanagement&value1=<s:property value="#son.number" />'>查看</a>
					</div>
				</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

	</body>

	<script type="text/javascript">
	
	     $('#timeone').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	      
	    });	    
	
	     $('#timetwo').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
</script>
	<script type="text/javascript">
	var userId = 0;
	var tag = 0;
	
function reset(){
	document.getElementById('gettime1').value='';
	document.getElementById('gettime2').value='';
	location.reload();
	}
	
	
	function gettime(){
	var gettime1 = $("#gettime1").val();
	var gettime2 = $("#gettime2").val();
	
    document.getElementById("content").innerHTML = "";
    if(gettime2==""){
    	 $.post("<%=path%>/admin.action?function=fastordertime1",{value1:gettime1},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			    var a ;
     			    if(data[i][5]==0)
     			    a="<font color='red'>未确认</font>";
     			    else
     			    a="已确认";
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
							+"<div id='middle'>"
							+new Date(data[i][4]).Format("yyyy-MM-dd hh:mm:ss")
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right'  style='width:10%'>"
							+"<a href='<%=path%>/admin.action?function=oneordermanagement&value1="+data[i][1]+"'>查看</a>"
							+"</div>"
							;
							
					document.getElementById("content").innerHTML += c;
					}
     			
    		},"json");
    
    }
    if(gettime2!=""){
    $.post("<%=path%>/admin.action?function=fastordertime",{value1:gettime1,value2:gettime2},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			
     			    var a ;
     			    if(data[i][5]==0)
     			    a="<font color='red'>未确认</font>";
     			    else
     			    a="已确认";
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
							+"<div id='middle'>"
							+new Date(data[i][4]).Format("yyyy-MM-dd hh:mm:ss")
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right'  style='width:10%'>"
							+"<a href='<%=path%>/admin.action?function=oneordermanagement&value1="+data[i][1]+"'>查看</a>"
							+"</div>"
							;
							
					document.getElementById("content").innerHTML += c;
					}
				
    		},"json");
    		}
	
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
		$.post("<%=path%>/admin.action?function=fastorder",{value1:s},
    		function(data) {
    		
     			for(var i = 0;i<data.length;i++){
     			
     			    var a ;
     			    if(data[i][5]==0)
     			    a="<font color='red'>未确认</font>";
     			    else
     			    a="已确认";
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
							+"<div id='middle'>"
							+new Date(data[i][4]).Format("yyyy-MM-dd hh:mm:ss")
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right'  style='width:10%'>"
							+"<a href='<%=path%>/admin.action?function=oneordermanagement&value1="+data[i][1]+"'>查看</a>"
							+"</div>"
							;
							
					document.getElementById("content").innerHTML += c;
					}
				
    		},"json");
	}
	

	
	

</script>
</html>
