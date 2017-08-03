<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>退货列表		</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script	src="<%=path %>/admin/bootstrap/js/jquery-1.8.3.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>
		<link href="<%=path %>/admin/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		<link href="<%=path %>/admin/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
		<script src="<%=path %>/admin/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/admin/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<style>
			table {
				border-collapse: collapse;
				border-spacing: 0;
				border-left: 1px solid #000;
				border-top: 1px solid #000;
				font-size: 16px;
				margin-top: 20px;
				margin-bottom: 20px;
			}
			th,
			td {
				border-right: 1px solid #000;
				border-bottom: 1px solid #000;
				
			}
			th {
				font-weight: bold;
			}
			.tbinput{
				width:95%;
				height:20px;
				text-align: center;
			}
		</style>
		<SCRIPT type="text/javascript">
				var c= new Array();
				var t;
			</SCRIPT>
		
	</head>
	
	
	
	<body style="text-align: center;font-family: 'microsoft yahei';">
	<br/>
		<div style="width: 100%;height: 60px;margin-left: 2%;">
		
			<div style="float:left;width:20%;margin-left:2%;">
				<div class="input-append date" style="border:0px;line-height: 30px;" id="timeone"  data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">起始时间：
				<input size="14" type="text" value="" id="gettime1" style="height:20px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:20px" />
				<button onclick="gettime();" style="width: 30%;background: #00a5a5;margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
				</div>
				<div class="input-append date" style="border:0px;line-height: 30px;" id="timetwo"   data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
				<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">结束时间：
				<input size="14" type="text" value="" id="gettime2" style="height:20px"></span>
				<input type="hidden" id="dtp_input2" value="" style="height:20px" />
				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">重置</button>
<!--				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px;margin-left:25px; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按月查询</button>-->
<!--				<button onclick="reset();" style="width: 32%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按季度查询</button>-->
<!--				<button onclick="reset();" style="width: 32%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按半年查询</button>-->
<!--				<button onclick="reset();" style="width: 30%;background: #00a5a5; margin-top:2px; margin-left:5px;border: 0px; color: #ffffff; font-size: 15px;height: 30px;">按年查询</button>-->
				</div>
			</div>
	<!-- 	<div style="float:left;width:20%; height: 30px;margin-left:54%">
			<input id="fast" type="text" onkeyup="fast();" style="height: 20px;margin-top: 20px;margin-bottom: 20px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>-->
		</div>
		<br/>
		<p style="margin: 0px;"><font size="5"><s:property value="WareHouseById(value1).name" />&nbsp;&nbsp;库存列表</font></p>
		
		<br/>
		
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">订单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:6%"">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:6%">
				<font color="#ffffff">库存数量</font>
			</div>
			
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">进货价格</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">产品名称</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">供应商</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">操作人</font>
			</div>
			
			<div id="right" style="background: #00a5a5;width:26%">
				<font color="#ffffff">退货数量</font>
			</div>
			

			<div id="content">
			<s:iterator value="ReturnedList(value1)" var="son" status="index">
				<div id="left">
				<s:property value="#son.ordernumber" />
				</div>
				<div id="middle" style="width:6%">
				<s:property value="#son.productnumber" />
				</div>
				<div id="middle" style="width:6%">
				<s:property value="#son.count" />
					
				</div>
				<s:set name="wareinfo" value="WaresByNumber(#son.productnumber)"></s:set>
				<s:set name="sup" value="SuppliersById(#wareinfo.suppliers)"></s:set>
				<div id="middle" style="width:8%">
				<s:property value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber).price" />
				</div>
				<div id="middle" >
				<s:property value="#wareinfo.name" />
				</div>
				<div id="middle" >
				<s:property value='SuppliersById(#wareinfo.suppliers)' />
				</div>
				
				<div id="middle" style="width:10%">
				<s:property value="AdminByUsername(#son.douser).name" />
				</div>
				<SCRIPT type="text/javascript">
						t = new Array("<s:property value="#son.count" />","<s:property value="#son.ordernumber" />","<s:property value="#son.productnumber" />","<s:property value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber).price" />","<s:property value="#wareinfo.suppliers" />","<s:property value="value1" />","<s:property value="#wareinfo.name" />");
						c[<s:property value="#index.index" />] = t;
				</SCRIPT>
				
				<div id="right" style="width:26%">
				<SELECT id="paytype" style="width:27%;height:27px;" >

				<option value="0">
					现金
				</option>
				<option value="1">
					银行卡
				</option>
				<option value="3">
					挂单
				</option>
			</SELECT>
				<input type="text" id="count<s:property value="#index.index" />" style="width:33%;height:19px;margin:0px;">
				<input type="button" onclick="sub(<s:property value="#index.index" />);" style="width:30%" value="确认退货"/>
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
	<SCRIPT type="text/javascript">
		
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
    	 $.post("<%=path%>/admin.action?function=fastreturnedtime1",{value1:gettime1,value2:c[1][5]},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			  
	     			var a = "<div id='left'>"
							+data[i][0]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][1]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][2]+
							"</div>"+
							"<div id='middle' style='width:8%'>"
							+data[i][3]+
							"</div>"+
							"<div id='middle'>"
							+data[i][4]+
							"</div>"+
							"<div id='middle'>"
							+data[i][5]+
							"</div>"+
							"<div id='middle' style='width:10%'>"
							+data[i][8]+
							"</div>"+
							
							"<div id='right' style='width:26%'>"
							+"<SELECT id='paytype' style='width:27%;' >"+
							"<option value='0'>"+"现金"+"</option>"+
							"<option value='1'>"+"银行卡"+"</option>"+
							"<option value='3'>"+"挂单"+"</option>"+
							"</SELECT>"+
							"<input type='text' id='count"+i+"' style='width:33%;height:20px;margin:0px;'>"+
			             	"<input type='button' onclick='sub("+i+");' style='width:30%' value='确认退货'/>"+
							"</div>";
							
							
					document.getElementById("content").innerHTML += a;
							var c = new Array(data[i][2],data[i][0],data[i][1],data[i][3],data[i][6],data[i][7],data[i][4]);
					}
     			
    		},"json");
    
    }
    if(gettime2!=""){
    $.post("<%=path%>/admin.action?function=fastreturnedtime",{value1:gettime1,value2:gettime2,value3:c[1][5]},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			  
	     			var a = "<div id='left'>"
							+data[i][0]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][1]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][2]+
							"</div>"+
							"<div id='middle' style='width:8%'>"
							+data[i][3]+
							"</div>"+
							"<div id='middle'>"
							+data[i][4]+
							"</div>"+
							"<div id='middle'>"
							+data[i][5]+
							"</div>"+
							"<div id='middle' style='width:10%'>"
							+data[i][8]+
							"</div>"+
							
							"<div id='right' style='width:26%'>"
							+"<SELECT id='paytype' style='width:27%;' >"+
							"<option value='0'>"+"现金"+"</option>"+
							"<option value='1'>"+"银行卡"+"</option>"+
							"<option value='3'>"+"挂单"+"</option>"+
							"</SELECT>"+
							"<input type='text' id='count"+i+"' style='width:33%;height:20px;margin:0px;'>"+
			             	"<input type='button' onclick='sub("+i+");' style='width:30%' value='确认退货'/>"+
							"</div>";
							
							
					document.getElementById("content").innerHTML += a;
							var c = new Array(data[i][2],data[i][0],data[i][1],data[i][3],data[i][6],data[i][7],data[i][4]);
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
		$.post("<%=path%>/admin.action?function=fastreturned",{value1:s,value2:c[1][5]},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     			  
	     			var a = "<div id='left'>"
							+data[i][0]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][1]+
							"</div>"+
							"<div id='middle' style='width:6%'>"
							+data[i][2]+
							"</div>"+
							"<div id='middle' style='width:8%'>"
							+data[i][3]+
							"</div>"+
							"<div id='middle'>"
							+data[i][4]+
							"</div>"+
							"<div id='middle'>"
							+data[i][5]+
							"</div>"+
							"<div id='middle' style='width:10%'>"
							+data[i][8]+
							"</div>"+
							
							"<div id='right' style='width:26%'>"
							+"<SELECT id='paytype' style='width:27%;' >"+
							"<option value='0'>"+"现金"+"</option>"+
							"<option value='1'>"+"银行卡"+"</option>"+
							"<option value='3'>"+"挂单"+"</option>"+
							"</SELECT>"+
							"<input type='text' id='count"+i+"' style='width:33%;height:20px;margin:0px;'>"+
			             	"<input type='button' onclick='sub("+i+");' style='width:30%' value='确认退货'/>"+
							"</div>";
							
							
					document.getElementById("content").innerHTML += a;
							var c = new Array(data[i][2],data[i][0],data[i][1],data[i][3],data[i][6],data[i][7],data[i][4]);
					}
				
    		},"json");
	}
			function sub(i){
				
		var paytype = $("#paytype").val();
				var cc = $("#count"+i).val();
				var reg=/^[0-9]*$/; 
				
				
				if(cc==""){
					alert("退货数量必须填写！");
					$("#count"+i).val("");
					return;
				}    
      			if(!reg.test(cc))
      			{
         			alert("退货数量必须输入数字！");
         			$("#count"+i).val("");
         			return;
      			}
      			if(parseInt(cc)==0){
					alert("退货数量不能为0！");
					$("#count"+i).val("");
					return;
				}
				if(parseInt(cc)>parseInt(c[i][0])){
					alert("库存不足！");
					$("#count"+i).val("");
					return;
				}
      					
				$.post("<%=path %>/admin.action?function=addreturned",
				{"rw.ordernumber":c[i][1],"rw.productnumber":c[i][2],"rw.price":c[i][3],"rw.count":cc,"rw.allprice":c[i][3]*cc,"rw.suppliers":c[i][4],"rw.warehouse":c[i][5],"rw.name":c[i][6],"rw.paytype":paytype},
					function(data){
						if(data=="\"DoType Error!\"")
							alert("请求错误！");
						
						else{
							alert("退货成功！");
							if (confirm("是否打印退货凭证？")) {
							window.open("","_self").close();
									window.opener.location.href="admin.action?function=returnedwareinfo";
						        }else{
							window.open("","_self").close();
							window.opener.location.href="admin.action?function=returnedware";}
						}
						
				},"text");
			}
			
		
		</SCRIPT>
	

</html>