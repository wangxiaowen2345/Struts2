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
		<title>维修记录管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
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
		
		

	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
		<div style="width: 100%;height: 60px;margin-left: 2%;">
		
			<div style="float:left;width:20%;margin-left:2%;">
				<div class="input-append date" style="border:0px;line-height: 30px;" id="timeone" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">起始时间：
				<input size="14" type="text" value="" id="gettime1" style="height:30px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:30px" />
				<button onclick="gettime();" style="width: 30%;background: #00a5a5;margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
				</div>
				<div class="input-append date" style="border:0px;line-height: 30px;" id="timetwo" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">结束时间：
				<input size="14" type="text" value="" id="gettime2" style="height:30px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:30px" />
				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">重置</button>
<!--				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px;margin-left:25px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按月查询</button>-->
<!--				<button onclick="reset();" style="width: 32%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按季度查询</button>-->
<!--				<button onclick="reset();" style="width: 32%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按半年查询</button>-->
<!--				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按年查询</button>-->
				</div>
			</div>
		<div style="float:left;width:20%; height: 30px;margin-left:54%">
			<input id="fast" type="text" onkeyup="fast();" style="height: 30px;margin-top: 20px;margin-bottom: 20px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
		</div>
		<!-- <button onclick="javascript:location.href='<%=path %>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;"> 
			添加新订单 
		</button> -->
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">车牌号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">联系人</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">电话</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">时间</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">里程</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">状态</font>
			</div>
			<div id="right" style="background: #00a5a5;width:10%">
				<font color="#ffffff">操作</font>
			</div>
		<div id="content">
			<s:iterator value="RepairedList()" var="son">
				<div id="left">
					<s:property value="#son.repairnum" />
				</div>
				<div id="middle" style="width:10%">
					<s:property value="CarById(#son.carid).carnum" />
				</div>
				<div id="middle">
					<s:property value="#son.contact" />
				</div>
				<div id="middle">
					<s:property value="#son.tel" />
				</div>
				<div id="middle" >
					<s:date name="time" format="yyyy-MM-dd hh:mm" nice="false"  />
					<s:property value="#time" />
				</div>
				<div id="middle" style="width:8%">
					<s:property value="#son.repairmileage" />
				</div>
				<div id="middle"  style="width:10%">
					<s:if test="#son.type==0&&#son.state==0" >
					<font color='red'>正在维修</font>
					</s:if>
					<s:if test="#son.type==0&&#son.state==1" >
					维修完毕
					</s:if>
					<s:if test="#son.type==1&&#son.state==0" >
					<font color='red'>正在保养</font>
					</s:if>
					<s:if test="#son.type==1&&#son.state==1" >
					保养完毕
					</s:if>
					<s:if test="#son.type==2&&#son.state==0||#son.type==3&&#son.state==0" >
					<font color='red'>其他项目进行中</font>
					</s:if>
					<s:if test="#son.type==2&&#son.state==1||#son.type==3&&#son.state==1" >
					其他项目完成
					</s:if>
					
				</div>
				<div id="right" style="width:10%">
					<a href='<%=path %>/admin.action?function=repairinfo&value2=<s:property value="#son.repairnum" />'>详情</a>
					<s:if test="#son.state==1" >
					&nbsp;&nbsp;
					<a href='javascript:delData(<s:property value='#son.repairnum' />);'>反审核</a>
					
					</s:if>
				</div>
			</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom:50px"></div>
		</div>

	</body>
	
	<script type="text/javascript">
	
	function delData(id){
			var result =confirm("确定反审核吗?");
			if(result ==true)
			{
				var delid=id;
				$.post("<%= path%>/admin.action?function=payinforeturned", 
				{ value1:delid},
	   			function(data){
	    			if(data=="\"Success\""){
	    				alert("反审核成功！");
	    				location.reload();
	    			}
	    			else
	    			{
	    				alert("反审核失败！");
	    				location.reload();
	    			}
	    			
	    		}, "text");
			}
			else
			{
			return ;
			}
			
			}
			
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
    	 $.post("<%=path%>/admin.action?function=fastrepairtime1",{value1:gettime1},
    		function(data) {
     			for(var i = 0;i<data.length;i++){var a ;
     			    if(data[i][5]==0&&data[i][7]==0)
     			    a="<font color='red'>正在维修</font>";
     			    if(data[i][5]==1&&data[i][7]==0)
     			    a="维修完毕";
     			    if(data[i][5]==0&&data[i][7]==1)
     			    a="<font color='red'>正在保养</font>";
     			    if(data[i][5]==1&&data[i][7]==1)
     			    a="保养完毕完毕";
     			    if(data[i][5]==0&&data[i][7]==2)
     			    a="<font color='red'>其他项目进行中</font>";
     			    if(data[i][5]==1&&data[i][7]==2)
     			    a="其他项目完成";
	     			var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' >"
							+data[i][4].replace('T',' ')
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle'  style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+"<a href='<%=path %>/admin.action?function=repairinfo&value1="+data[i][0]+"'>详情</a>"
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
					}
     			
    		},"json");
    
    }
    if(gettime2!=""){
    $.post("<%=path%>/admin.action?function=fastrepairtime",{value1:gettime1,value2:gettime2},
    		function(data) {
     			for(var i = 0;i<data.length;i++){var a ;
     			    if(data[i][5]==0&&data[i][7]==0)
     			    a="<font color='red'>正在维修</font>";
     			    if(data[i][5]==1&&data[i][7]==0)
     			    a="维修完毕";
     			    if(data[i][5]==0&&data[i][7]==1)
     			    a="<font color='red'>正在保养</font>";
     			    if(data[i][5]==1&&data[i][7]==1)
     			    a="保养完毕完毕";
     			    if(data[i][5]==0&&data[i][7]==2)
     			    a="<font color='red'>其他项目进行中</font>";
     			    if(data[i][5]==1&&data[i][7]==2)
     			    a="其他项目完成";
	     			var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' >"
							+data[i][4].replace('T',' ')
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle'  style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+"<a href='<%=path %>/admin.action?function=repairinfo&value1="+data[i][0]+"'>详情</a>"
							+"</div>";
							
							
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
		$.post("<%=path%>/admin.action?function=fastrepair",{value1:s},
    		function(data) {
    		
     			for(var i = 0;i<data.length;i++){
     			    var a ;
     			    if(data[i][5]==0&&data[i][7]==0)
     			    a="<font color='red'>正在维修</font>";
     			    if(data[i][5]==1&&data[i][7]==0)
     			    a="维修完毕";
     			    if(data[i][5]==0&&data[i][7]==1)
     			    a="<font color='red'>正在保养</font>";
     			    if(data[i][5]==1&&data[i][7]==1)
     			    a="保养完毕完毕";
     			    if(data[i][5]==0&&data[i][7]==2)
     			    a="<font color='red'>其他项目进行中</font>";
     			    if(data[i][5]==1&&data[i][7]==2)
     			    a="其他项目完成";
	     			var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' >"
							+data[i][4].replace('T',' ')
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle'  style='width:10%'>"
							+a
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+"<a href='<%=path %>/admin.action?function=repairinfo&value1="+data[i][0]+"'>详情</a>"
							+"</div>";
							
							
					document.getElementById("content").innerHTML += c;
					}
				
    		},"json");
	}
</script>
</html>
