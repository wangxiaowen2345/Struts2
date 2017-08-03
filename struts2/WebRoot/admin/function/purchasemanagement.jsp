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
		<title>采购申请</title>

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
				} 
			</script>
		
		</s:if>
	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';padding-top: 20px">
		<div style="width: 100%;height: 60px;margin-left: 2%;">
		<div style="float:left;width:20%;margin-bottom: 20px;margin-left: 0px;">
			<button onclick="addadmin();"
				style="margin-top: 20px;  background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">   
				添加申请  
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
			<div id="left" style="background: #00a5a5;width:10%">
				<font color="#ffffff">物料</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:5%">
				<font color="#ffffff">价格</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:4%">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:4%">
				<font color="#ffffff">单位</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:5%">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:9%">
				<font color="#ffffff">车型</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:7%">
				<font color="#ffffff">生产厂家</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:27%">
				<font color="#ffffff">用途</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">采购人</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">录入日期</font>
			</div>
			<div id="right" style="background: #00a5a5;width:10%">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:iterator value="AllPurchaseByTimdeDecs(page)" var="son">
				<div id="left"  style="width:10%">
					<s:property value="#son.material" />
				</div>
				<div id="middle" style="width:5%">
					<s:property value="#son.price" />
				</div>
				<div id="middle" style="width:4%">
					<s:property value="#son.count" />
				</div>
				<div id="middle" style="width:4%">
					<s:property value="#son.unit" />
				</div>
				<div id="middle" style="width:5%">
					<s:property value="#son.specifications" />
				</div>
				<div id="middle" style="width:9%">
					<s:property value="ModelsById(#son.models).name" />
				</div>
				<div id="middle" style="width:7%">
					<s:property value="#son.madein" />
				</div>
				<div id="middle" style="width:27%">
					<s:property value="#son.useto" />
				</div>
				<div id="middle" style="width:8%">
					<s:property value="AdminByUsername(#son.proposer).name" />
				</div>
				<div id="middle" style="width:8%">
					<s:date name="time" format="yyyy-MM-dd" nice="false"  />
					<s:property value="#time" />
				</div>
				<div id="right" style="width:10%">
					<s:if test="#son.auditor==0">
						<a href="javascript:updateau(<s:property value="#son.id" />)";>通过审核</a>&nbsp&nbsp
						<a href="javascript:updateau(<s:property value="#son.id" />)";>打印</a>
					</s:if>
					<s:else>
					<font>审核完成</font>&nbsp&nbsp
					<a href="javascript:updateau(<s:property value="#son.id" />)";>打印</a>
					</s:else>
				</div>
			</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

		<div id="main">
			<div id="fullbg"></div>
			<div id="dialog" style="height:auto;">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div
						style="width: 35%; float: left; display: inline; text-align: right; line-height: 39px;">
						物料：
						<br />
						数量：
						<br />
						价格：
						<br />
						单位：
						<br />
						规格：
						<br />
						车型：
						<br />
						生产厂家：
						<br />
						用途：
						<br />
						
					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="text" id="material" style="width: 70%;height:30px">
						</br>
						<input type="text" id="count" style="width: 70%;height:30px">
						</br>
						<input type="text" id="price" style="width: 70%;height:30px">
						</br>
						<input type="text" id="unit" style="width: 70%;height:30px">
						</br>
						<input type="text" id="specifications" style="width: 70%;height:30px">
						</br>
						<select style="width: 70%;height:30px;" id="models">

								<s:iterator value="AllModels()" var="son">
								<option value="<s:property value="#son.id"/>" ><s:property value="#son.name"/></option>
								</s:iterator>
						</select>
						</br>
						<input type="text" id="madein" style="width: 70%;height:30px">
						</br>
						<textarea rows="3" id="use" cols="20" style="width: 200px;height: 100px;max-width: 200px;max-height: 100px;" >
						
						</textarea>
						</br>
						</br>
						
					</div>
				 	
			<div class="btn-group" role="group" style="margin-left:24%;margin-top:-4%">
			  <button type="button" class="btn btn-default btn-lg" onclick="update();">提交</button>
			</div>

				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		
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
</script>
	<script type="text/javascript">
	var carId = 0;
	var tag = 0;
	function updateau(id){
	var id;
		$.post("<%= path%>/admin.action?function=updateauditor",{value5:id},
   			function(data){
    			if(data=="\"Success\""){
    				alert("审核成功！");
    				
    				location.reload();
    			}
    			
   			}, "text");
	}
	function reset(){
	document.getElementById('gettime1').value='';
	document.getElementById('gettime2').value='';
	}
	
	function gettime(){
	var gettime1 = $("#gettime1").val();
	
	var gettime2 = $("#gettime2").val();
    document.getElementById("content").innerHTML = "";
    if(gettime2==""){
    	 $.post("<%=path%>/admin.action?function=fastpurchastime1",{value1:gettime1},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			if(data[i][5]==0)
     			    a="<a href='javascript:updateau("+data[i][6]+")'>通过审核</a>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
     			    else
     			    a="<font>审核完成</font>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
	     			var c = "<div id='left' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][11]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][9]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][10]
							+"</div>"
							+"<div id='middle' style='width:27%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][4].substr(0, 10)
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+a
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
    
    }
    if(gettime2!=""){
    $.post("<%=path%>/admin.action?function=fastpurchastime",{value1:gettime1,value2:gettime2},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			if(data[i][5]==0)
     			    a="<a href='javascript:updateau("+data[i][6]+")'>通过审核</a>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
     			    else
     			    a="<font>审核完成</font>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
	     			var c = "<div id='left' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][11]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][9]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][10]
							+"</div>"
							+"<div id='middle' style='width:27%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][4].substr(0, 10)
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+a
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
    		}
	
	}
	
	
	function addadmin(){
		var material = $("#material").val("");
		var count = $("#count").val("");
		var use = $("#use").val("");
		var unit = $("#unit").val("");
		var specifications = $("#specifications").val("");
		var madein = $("#madein").val("");
		var price = $("#price").val("");
		
		tag = 1;
	     showBg();
	}
	
	

	function update(){
	
		var material = $("#material").val();
		var count = $("#count").val();
		var use = $("#use").val();
		var unit = $("#unit").val();
		var specifications = $("#specifications").val();
		var models = document.getElementById("models").value; 
		var madein = $("#madein").val();
		var price = $("#price").val();
		
		if(material=="" || count=="" || use=="" ){
			alert("表单不能为空！");
			return;
		}
		if(!isNaN(count)){
 		 
		  }else{
		     alert("数量应为数字！");
		     return;
		  }
		if(tag==0)
		$.post("<%= path%>/admin.action?function=updatecar", 
			{ "car.id":carId,"car.framenum":framenum,"car.registartime":registartime,"car.model":models,"car.insurancetime":insurancetime},
   			function(data){
    			if(data=="\"Success\""){
    				alert("信息修改成功！");
    				location.reload();
    			}
    			
   			}, "text");
   			
   		else
   		$.post("<%= path%>/admin.action?function=addpurchase", 
			{ "purchase.price":price,"purchase.madein":madein,"purchase.models":models,"purchase.specifications":specifications,"purchase.unit":unit,"purchase.material":material,"purchase.count":count,"purchase.useto":use},
   			function(data){
    			if(data=="\"Success\""){
    				alert("申请添加成功！");
    				location.reload();
    			}else{
    				alert("添加失败！");
    			}
   			}, "text");
   		
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
		$.post("<%=path%>/admin.action?function=fastpurchase",{value1:s},
    		function(data) {
     			
     			for(var i = 0;i<data.length;i++){
     			if(data[i][5]==0)
     			    a="<a href='javascript:updateau("+data[i][6]+")'>通过审核</a>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
     			    else
     			    a="<font>审核完成</font>"+"   "+"<a href='javascript:updateau("+data[i][6]+")';>打印</a>";
	     			var c = "<div id='left' style='width:10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][11]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width:4%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width:5%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width:9%'>"
							+data[i][9]
							+"</div>"
							+"<div id='middle' style='width:7%'>"
							+data[i][10]
							+"</div>"
							+"<div id='middle' style='width:27%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][4].substr(0, 10)
							+"</div>"
							+"<div id='right' style='width:10%'>"
							+a
							+"</div>";
							
					document.getElementById("content").innerHTML += c;
				}	
     			
     			
    		},"json");
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
