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
		<title>车辆管理</title>

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
		<s:if test="value1!=null">
			<script> 
			
				function selectcartomaintain(carnum , carid) 
				{ 
					window.close(); 
					<s:if test="value1=='son'">
					window.opener.document.getElementById("carnum").value=carnum;
					window.opener.document.getElementById("carid").value=carid;
					</s:if>
					<s:if test="value1=='novip'">
					window.opener.location.href="admin.action?function=foundmaintain&value2="+carid;
					</s:if>
					<s:if test="value1=='self'">
					window.opener.location.href="admin.action?function=selfmaintain&value2="+carid;
					</s:if>
				} 
			</script>
		
		</s:if>
	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
		<div style="width: 100%;height: 60px;margin-left: 1%;">
		<div style="float:left;width:20%;margin-bottom: 20px;margin-left: 0px;">
			<button onclick="addadmin();"
				style="margin-top: 20px;  background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">   
				添加新车辆  
			</button>
			</div>
			<div style="float:left;width:20%;margin-left: 8%;">
				<div class="input-append date" style="border:0px;line-height: 30px;" id="time3" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">起始时间：
				<input size="14" type="text" value="" id="gettime1" style="height:30px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:30px" />
				<button onclick="gettime();" style="width: 30%;background: #00a5a5;margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
				</div>
				<div class="input-append date" style="border:0px;line-height: 30px;" id="time4" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">结束时间：
				<input size="14" type="text" value="" id="gettime2" style="height:30px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:30px" />
				<button onclick="reset()" style="width: 30%;background: #00a5a5; margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">重置</button>
				</div>
			</div>
		<div style="float:left;width:20%; height: 30px;margin-left: 28%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px; height: 30px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
			
		</div>
		<div id="div1" style="margin-left: 1%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">序号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">车型</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:4%">
				<font color="#ffffff">颜色</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:6%">
				<font color="#ffffff">车牌号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:12%">
				<font color="#ffffff">车架号</font>
			</div>
			
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">录入日期</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:17%">
				<font color="#ffffff">合同起止日期</font>
			</div>
			
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">购车方式</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">使用人</font>
			</div>
			<div id="right" style="background: #00a5a5;width:24%">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:if test="value1!=null">
			<s:iterator value="SelfCarByTimdeDecs(page)" var="son">
				<div id="left">
					<s:property value="#son.orderid" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="ModelsById(#son.model).name" />
				</div>
				<div id="middle" style="width:4%">
					<s:property value="#son.color" />
				</div>
				<div id="middle" style="width:6%">
					<s:property value="#son.carnum" />
				</div>
				<div id="middle" style="width:12%">
					<s:property value="#son.framenum" />
				</div>
				
				<div id="middle" style="width:8%">
					<s:date name="time" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#time" />
				</div>
				<div id="middle" style="width:17%">
				<s:date name="registartime" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#registartime" />到
						<s:date name="exptime" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#exptime" />
					
				</div>
				
				<div id="middle" style="width:7%">
					<s:property value="BuytypeById(#son.buytype).type" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.usename" />
				</div>
				<div id="right" style="width:24%">
					<s:if test="value1!=null">
						<a href="javascript:selectcartomaintain('<s:property value="#son.carnum" />','<s:property value="#son.id" />');">选择</a>
					</s:if>
					<s:else>
					<a href='<%=path %>/admin.action?function=carrepairrecord&value1=<s:property value="#son.id" />'>车辆维修</a>&nbsp;
					<a href='<%=path %>/admin.action?function=fastcarrecord&value1=<s:property value="#son.carnum" />'>使用人记录</a>&nbsp;
					<a href='javascript:showData(<s:property value='#son.id' />,"<s:property value='ModelsById(#son.model).name' />","<s:property value='BuytypeById(#son.buytype).type' />");'>查看资料</a>
					<a href='javascript:delData(<s:property value='#son.id' />);'>删除</a>
					</s:else>
				</div>
				<script>
				    //合同到期提醒
				    var hetongtime="<s:property value='DateFormat("yyyy-MM-dd",#son.exptime)' />";
				    var beforhetongtime="<s:property value='DateFormatBefor("yyyy-MM-dd",#son.exptime,30)' />";
					var now="<s:property value='DateFormatNow("yyyy-MM-dd")' />";
					var aStart=beforhetongtime.split('-'); //转成成数组，分别为年，月，日，下同  
				    var aEnd=now.split('-');  
				    var startDateTemp = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];  
				    var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];  
<!--				    if (startDateTemp < endDateTemp)   -->
<!--				     alert("车牌号为"+"<s:property value="#son.carnum" />"+",合同到期时间将近，到期日期为"+hetongtime);-->
				     
				     //年审到期提醒
				    var nianshentime="<s:property value='DateFormat("yyyy-MM-dd",#son.examinetime)' />";
				    var befornianshentime="<s:property value='DateFormatBefor("yyyy-MM-dd",#son.examinetime,90)' />";
					var now="<s:property value='DateFormatNow("yyyy-MM-dd")' />";
					var aStart=befornianshentime.split('-'); //转成成数组，分别为年，月，日，下同  
				    var aEnd=now.split('-');  
				    var startDateTemp = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];  
				    var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];  
<!--				    if (startDateTemp < endDateTemp)   -->
<!--				     alert("车牌号为"+"<s:property value="#son.carnum" />"+",年审到期时间将近，到期日期为"+nianshentime);-->
				     
				</script>
			</s:iterator>
			</s:if>
			<s:else>
			<s:iterator value="AllCarByTimdeDecs(page)" var="son">
				<div id="left">
					<s:property value="#son.orderid" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="ModelsById(#son.model).name" />
				</div>
				<div id="middle" style="width:4%">
					<s:property value="#son.color" />
				</div>
				<div id="middle" style="width:6%">
					<s:property value="#son.carnum" />
				</div>
				<div id="middle" style="width:12%">
					<s:property value="#son.framenum" />
				</div>
				
				<div id="middle" style="width:8%">
					<s:date name="time" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#time" />
				</div>
				<div id="middle" style="width:17%">
				<s:date name="registartime" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#registartime" />到
						<s:date name="exptime" format="yyyy-MM-dd " nice="false"  />
					<s:property value="#exptime" />
					
				</div>
				
				<div id="middle" style="width:7%">
					<s:property value="BuytypeById(#son.buytype).type" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.usename" />
				</div>
				<div id="right" style="width:24%">
					<s:if test="value1!=null">
						<a href="javascript:selectcartomaintain('<s:property value="#son.carnum" />','<s:property value="#son.id" />');">选择</a>
					</s:if>
					<s:else>
					<a href='<%=path %>/admin.action?function=carrepairrecord&value1=<s:property value="#son.id" />'>车辆维修</a>&nbsp;
					<a href='<%=path %>/admin.action?function=fastcarrecord&value1=<s:property value="#son.carnum" />'>使用人记录</a>&nbsp;
					<a href='javascript:showData(<s:property value='#son.id' />,"<s:property value='ModelsById(#son.model).name' />","<s:property value='BuytypeById(#son.buytype).type' />");'>查看资料</a>
					<a href='javascript:delData(<s:property value='#son.id' />);'>删除</a>
					</s:else>
				</div>
				<script>
				    //合同到期提醒
				    var hetongtime="<s:property value='DateFormat("yyyy-MM-dd",#son.exptime)' />";
				    var beforhetongtime="<s:property value='DateFormatBefor("yyyy-MM-dd",#son.exptime,30)' />";
					var now="<s:property value='DateFormatNow("yyyy-MM-dd")' />";
					var aStart=beforhetongtime.split('-'); //转成成数组，分别为年，月，日，下同  
				    var aEnd=now.split('-');  
				    var startDateTemp = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];  
				    var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];  
<!--				    if (startDateTemp < endDateTemp)   -->
<!--				     alert("车牌号为"+"<s:property value="#son.carnum" />"+",合同到期时间将近，到期日期为"+hetongtime);-->
				     
				     //年审到期提醒
				    var nianshentime="<s:property value='DateFormat("yyyy-MM-dd",#son.examinetime)' />";
				    var befornianshentime="<s:property value='DateFormatBefor("yyyy-MM-dd",#son.examinetime,90)' />";
					var now="<s:property value='DateFormatNow("yyyy-MM-dd")' />";
					var aStart=befornianshentime.split('-'); //转成成数组，分别为年，月，日，下同  
				    var aEnd=now.split('-');  
				    var startDateTemp = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];  
				    var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];  
<!--				    if (startDateTemp < endDateTemp)   -->
<!--				     alert("车牌号为"+"<s:property value="#son.carnum" />"+",年审到期时间将近，到期日期为"+nianshentime);-->
				     
				</script>
			</s:iterator>
			</s:else>
			</div>

			<div id="bottom" style="margin-bottom:50px"></div>
		</div>

		<div id="main">
			<div id="fullbg"></div>
			<div id="dialog" style="height:550px;top:205px;overflow-y:scroll ">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div
						style="width: 35%; float: left; display: inline; text-align: right; line-height: 34px;">
						
						序号：
						<br />
						车型：
						<br />
						颜色：
						<br />
						车牌号：
						<br />
						车架号：
						<br />
						发动机号：
						<br />
						上牌时间：
						<br />
						年审时间：
						<br />
						备注：
						<br />
						合同开始日期：
						<br />
						合同停止日期：
						<br />
						
						购车方式：
						<br />
						使用人：
						<br />
						个人电话：
						<br />
						公司电话：
						<br />
						使用人备注：
						<br />
						
					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left;font-size:10px; line-height: 5px;">
							
						<input type="text" id="orderid" style="width: 70%;height:24px">
						</br>
						<select style="width: 70%;height:28px;" id="models">

								<s:iterator value="AllModels()" var="son">
								<option value="<s:property value="#son.id"/>" ><s:property value="#son.name"/></option>
								</s:iterator>
						</select>
						</br>
						<input type="text" id="color" style="width: 70%;height:24px">
						</br>
						<input type="text" id="carnum" style="width: 70%;height:24px">
						</br>
						<input type="text" id="framenum" style="width: 70%;height:24px">
						</br>
					    <input type="text" id="engine" style="width: 70%;height:24px">
						</br>
						
						<div class="input-append date" style="border:0px;line-height: 30px; " id="time6" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:4px;border:0px;background-color:#fff;"><input size="14" type="text" value="" id="shangpai"></span>
						<input type="hidden" id="dtp_input2" value="" style="height:30px" />
						</div>
						<div class="input-append date" style="border:0px;line-height: 30px;" id="time7" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:2px;border:0px;background-color:#fff;"><input size="14" type="text" value="" id="examinetime"></span>
						<input type="hidden" id="dtp_input2" value="" style="height:30px" />
						</div>
						<input type="text" id="beizhu" style="width: 70%;height:24px">
						</br>
						<div class="input-append date" style="border:0px;line-height: 30px;height:30px" id="time1" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:4px;border:0px;background-color:#fff;"><input size="14" type="text" value="" id="registartime"></span>
						<input type="hidden" id="dtp_input1" value="" style="height:30px" />
						</div>
						<div class="input-append date" style="border:0px;line-height: 30px;" id="time2" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:4px;border:0px;background-color:#fff;"><input size="14" type="text" value="" id="exptime"></span>
						<input type="hidden" id="dtp_input1" value="" style="height:30px" />
						</div>
						<select style="width: 70%;height:26px;" id="buytype">
							<s:iterator value="AllBuytype()" var="son">
							<option value="<s:property value="#son.id"/>" ><s:property value="#son.type"/></option>
							</s:iterator>
						</select>
						<input type="text" id="usename" style="width: 70%;height:24px">
						</br>
						<input type="text" id="phone" style="width: 70%;height:24px">
						</br>
						<input type="text" id="tel" style="width: 70%;height:24px">
						</br>
						<input type="text" id="usebeizhu" style="width: 70%;height:24px">
						</br>
					</div>
					
			<div class="btn-group" role="group" style="margin-left:20%;margin-bottom:2px;" >
			  <button type="button" class="btn btn-default btn-lg" onclick="update();">提交</button>
			   <button type="button" class="btn btn-default btn-lg" onclick="updatefastcarrecord();">添加使用人记录</button>
			</div>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		$('#time1').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	      
	    });
	    $('#time2').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
	      $('#time3').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
	      $('#time4').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
	         $('#time5').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
	      $('#time6').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        format: 'yyyy-MM-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	        
	    });
	         $('#time7').datetimepicker({
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
	<SCRIPT type="text/javascript">
	var carId = 0;
	var tag = 0;
	function reset(){
	document.getElementById('gettime1').value='';
	document.getElementById('gettime2').value='';
	}
		function gettime(){
	var gettime1 = $("#gettime1").val();
	
	var gettime2 = $("#gettime2").val();
    document.getElementById("content").innerHTML = "";
    if(gettime2==""){
    	 $.post("<%=path%>/admin.action?function=fasttime1",{value1:gettime1},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			
	     			var c = "<div id='left'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][9]
							+"</div>"
							+"<div id='middle' style='width:6%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:12%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][5].substr(0, 10)
							+"</div>"
							+"<div id='middle'  style='width:17%'>"
							+new Date(data[i][6]).Format("yyyy-MM-dd")
							+"到"
							+new Date(data[i][7]).Format("yyyy-MM-dd")
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][9]
							+"</div>"
							+"<div id='right'  style='width:24%'>"
							+"<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>车辆维修</a>&nbsp;"
							+"<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>使用人记录</a>&nbsp;"
							+"<a href='javascript:showData(\""+data[i][0]+"\",\""+data[i][3]+"\");'>查看资料</a>"
							+"<a href='javascript:delData(\""+data[i][0]+"\");'>删除</a>"
							
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
    
    }
    if(gettime2!=""){
    $.post("<%=path%>/admin.action?function=fasttime",{value1:gettime1,value2:gettime2},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			
	     			var c = "<div id='left'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][9]
							+"</div>"
							+"<div id='middle' style='width:6%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:12%'>"
							+data[i][3]
							+"</div>"
							
							+"<div id='middle' style='width:8%'>"
							+data[i][5].substr(0, 10)
							+"</div>"
							+"<div id='middle'  style='width:17%'>"
							+new Date(data[i][6]).Format("yyyy-MM-dd")
							+"到"
							+new Date(data[i][7]).Format("yyyy-MM-dd")
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][9]
							+"</div>"
							+"<div id='right'  style='width:25%'>"
							+"<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>车辆维修</a>&nbsp;"
							+"<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>使用人记录</a>&nbsp;"
							+"<a href='javascript:showData(\""+data[i][0]+"\",\""+data[i][3]+"\");'>查看资料</a>"
							+"<a href='javascript:delData(\""+data[i][0]+"\");'>删除</a>"
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
    		}
	
	}
	function addadmin(){
		var orderid = $("#orderid").val("");
		var carnum = $("#carnum").val("");
		var framenum = $("#framenum").val("");
		var color = $("#color").val("");
		var registartime = $("#registartime").val("");
		var exptime = $("#exptime").val("");
		var examinetime = $("#examinetime").val("");
		var usename = $("#usename").val("");
		var phone = $("#phone").val("");
		var engine = $("#engine").val("");
		var shangpai = $("#shangpai").val("");
		var tel = $("#tel").val("");
		var beizhu = $("#beizhu").val("");
		var usebeizhu = $("#usebeizhu").val("");
		
	
		var models = document.getElementById("models"); 
		for ( var i = 0; i < models.options.length; i++) {
			models.options[i].selected = false;			
		}
		var buytype = document.getElementById("buytype"); 
		for ( var i = 0; i < buytype.options.length; i++) {
			buytype.options[i].selected = false;			
		}
		tag = 1;
		showBg();
	}
	
	
	
	function showData(Id,modelname,type) {
		carId = Id;
		
		tag = 0;
		var orderid = $("#orderid").val();
		var color = $("#color").val();
		var shangpai = $("#shangpai").val();
		var engine = $("#engine").val();
		var exptime = $("#exptime").val();
		var examinetime = $("#examinetime").val();
		var usename = $("#usename").val();
		var phone = $("#phone").val();
		var tel = $("#tel").val();
		var beizhu = $("#beizhu").val();
		
		var carnum = $("#carnum").val();
		var framenum = $("#framenum").val();
		var registartime = $("#registartime").val();
		var models = document.getElementById("models").value; 
		
		var select = document.getElementById("models"); 
		for ( var i = 0; i < select.options.length; i++) {

			if (select.options[i].innerHTML == modelname) {
				select.options[i].selected = true;
				break;
			}
		}
		var buytype = document.getElementById("buytype"); 
		for ( var i = 0; i < buytype.options.length; i++) {
			if (buytype.options[i].innerHTML == type) {
				buytype.options[i].selected = true;
				break;
			}		
		}
		$.post("<%=path%>/admin.action?function=selectcarbyid&value1="+carId,
    		function(data) {
     			document.getElementById("carnum").value = data.carnum;
     			document.getElementById("color").value = data.color;
     			document.getElementById("framenum").value = data.framenum;
     			document.getElementById("orderid").value = data.orderid;
     			document.getElementById("engine").value = data.engine;
     			var date=new Date(data.exptime);
     			document.getElementById("exptime").value = date.Format("yyyy-MM-dd");
     			var date=new Date(data.shangpai);
     			document.getElementById("shangpai").value = date.Format("yyyy-MM-dd");
     			var date=new Date(data.examinetime);
     			document.getElementById("examinetime").value = date.Format("yyyy-MM-dd");
     			document.getElementById("usename").value = data.usename;
     			document.getElementById("tel").value = data.tel;
     			document.getElementById("beizhu").value = data.beizhu;
     			document.getElementById("phone").value = data.phone;
     			var date=new Date(data.registartime);
     			document.getElementById("registartime").value = date.Format("yyyy-MM-dd");
    		},"json");
		
		
		showBg();

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
		$.post("<%=path%>/admin.action?function=fastcar",{value1:s},
    		function(data) {
     			
     			for(var i = 0;i<data.length;i++){
     				temp = "<s:property value="value1" />";
     				if(temp!=null){
	     				param = "<a href='javascript:selectcartomaintain(\""+data[i][2]+"\",\""+data[i][0]+"\");'>选择</a>";
	     			}
	     			else{
	     				param = "<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>车辆维修</a>&nbsp;"
								+"<a href='<%=path %>/admin.action?function=carrepairrecord&value1="+data[i][0]+"'>使用人记录</a>&nbsp;"
								+"<a href='javascript:showData(\""+data[i][0]+"\",\""+data[i][3]+"\");'>查看资料</a>"
								+"<a href='javascript:delData(\""+data[i][0]+"\");'>删除</a>";
	     			}
	     			var c ="<div id='left'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][10]
							+"</div>"
							+"<div id='middle' style='width:6%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:12%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][5].substr(0, 10)
							+"</div>"
							+"<div id='middle'  style='width:17%'>"
							+new Date(data[i][6]).Format("yyyy-MM-dd")
							+"到"
							+new Date(data[i][7]).Format("yyyy-MM-dd")
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][9]
							+"</div>"
							+"<div id='right'  style='width:25%'>"
							+param
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
	}
			function delData(id){
			var result =confirm("确定删除吗?");
			if(result ==true)
			{
				var delid=id;
				$.post("<%= path%>/admin.action?function=deletecar", 
				{ value5:delid},
	   			function(data){
	    			if(data=="\"Success\""){
	    				alert("删除成功！");
	    				location.reload();
	    			}
	    			
	    		}, "text");
			}
			else
			{
			return ;
			}
			
			}
			
			function updatefastcarrecord(){
		
				var carnum = $("#carnum").val();
				var registartime = $("#registartime").val();
				var exptime = $("#exptime").val();
				var usename = $("#usename").val();
				var phone = $("#phone").val();
				var usebeizhu = $("#usebeizhu").val();
				var buytype = document.getElementById("buytype").value; 
				
		
		$.post("<%= path%>/admin.action?function=updatefastcarrecord", 
			{ "fastcarrecord.carnum":carnum,"fastcarrecord.usebeizhu":usebeizhu,"fastcarrecord.registartime":registartime,"fastcarrecord.exptime":exptime,"fastcarrecord.contractname":usename,"fastcarrecord.buytype":buytype,"fastcarrecord.contracttel":phone},
   			function(data){
    			if(data=="\"Success\""){
    				alert("信息添加成功！");
    				location.reload();
    			}
    			
    		}, "text");
    		
   	}



function update(){
		
	    var orderid = $("#orderid").val();
		var carnum = $("#carnum").val();
		var color = $("#color").val();
		var framenum = $("#framenum").val();
		var registartime = $("#registartime").val();
		var exptime = $("#exptime").val();
		var examinetime = $("#examinetime").val();
		var usename = $("#usename").val();
		var shangpai = $("#shangpai").val();
		var engine = $("#engine").val();
		var phone = $("#phone").val();
		var tel = $("#tel").val();
		var beizhu = $("#beizhu").val();
		var models = document.getElementById("models").value; 
		var buytype = document.getElementById("buytype").value; 
		
   		if(orderid=="" || framenum=="" || carnum=="" || registartime==""|| shangpai=="" || engine=="" || exptime=="" || examinetime==""|| usename=="" || phone==""|| tel==""){
			alert("表单不能为空！");
			return;
		}
		
		if(tag==0){
		$.post("<%= path%>/admin.action?function=updatecar", 
			{ "car.color":color, "car.id":carId,"car.beizhu":beizhu,"car.carnum":carnum,"car.orderid":orderid,"car.framenum":framenum,"car.engine":engine,"car.registartime":registartime,"car.model":models,"car.exptime":exptime,"car.shangpai":shangpai,"car.examinetime":examinetime,"car.usename":usename,"car.tel":tel,"car.phone":phone,"car.buytype":buytype},
   			function(data){
    			if(data=="\"Success\""){
    				alert("信息修改成功！");
    				location.reload();
    			}
    		}, "text");
    		alert("车牌号不可修改");}
    		else 
   	$.post("<%= path%>/admin.action?function=addcar", 
			{ "car.color":color,"car.orderid":orderid,"car.beizhu":beizhu,"car.carnum":carnum,"car.framenum":framenum,"car.model":models,"car.registartime":registartime,"car.exptime":exptime,"car.examinetime":examinetime,"car.usename":usename,"car.tel":tel,"car.phone":phone,"car.buytype":buytype,"car.shangpai":shangpai,"car.engine":engine},
   			function(data){
   				
    			if(data=="\"Success\""){
    				alert("车辆添加成功！");
    				location.reload();
    			}
    			if(data=="\"existence\""){
    				alert("车牌号重复！");
    			}
   			}, "text");
   	}



	//显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css( {
			height : 'auto',
			width : bw,
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
	
	</SCRIPT>

</html>
