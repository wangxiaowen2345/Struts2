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
		<title>私有车辆管理</title>

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
			<script> 
			
				function selectcartomaintain(carnum , carid) 
				{ 
					window.opener.document.getElementById("carnum").value=carnum;
					window.opener.document.getElementById("carid").value=carid;
					window.opener.location.href="admin.action?function=foundmaintain&value2="+carid;
				} 
			</script>
		
	</head>

	<body style=" font-family: 'Microsoft YaHei';margin-bottom:150px;padding-top: 20px;">
		<div style="width: 100%;height: 60px;margin-left: 2%;">
		<div style="float:left;width:20%;margin-bottom: 20px;margin-left: 0px;">
			<button onclick="addadmin();"
				style="margin-top: 20px;  background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">   
				添加新私有车辆  
			</button>
			</div>
			
		<div style="float:left;width:20%; height: 30px;margin-left: 58%">
			<input id="fast" type="text" onkeyup="fast();" style="margin-top: 20px;margin-bottom: 20px; height: 30px;width: 60%;">
			<button onclick="fast();" style="width: 30%;background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px;height: 30px;">搜索</button>
		</div>
			
		</div>
		<div id="div1" style="margin-left: 1%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">车型</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">车牌号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">保险报价</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">保险折扣</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 6%">
				<font color="#ffffff">客户折扣</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 6%">
				<font color="#ffffff">客户支付</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">承包人</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 12%">
				<font color="#ffffff">保险到期时间</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 8%">
				<font color="#ffffff">投保公司</font>
			</div>
			
			<div id="right" style="background: #00a5a5;width: 15%">
				<font color="#ffffff">操作</font>
			</div>

			<div id="content">
			<s:iterator value="AllPrivateFastCarByTimeDesc(page)" var="son">
				<div id="left" style="width: 10%">
					<s:property value="ModelsById(#son.model).name" />
				</div>
				<div id="middle" style="width:10%">
					<s:property value="#son.carnum" />
				</div>
				<div id="middle"  style="width: 10%">
					<s:property value="#son.insureoffer" />
				</div>
				<div id="middle"  style="width: 10%">
					<s:property value="#son.insurediscount" />
				</div>
				<div id="middle"  style="width: 6%">
					<s:property value="#son.userdiscount" />
				</div>
				<div id="middle"  style="width: 6%">
					<s:property value="#son.clientpay" />
				</div>
				<div id="middle" style="width: 10%">
				<a href='javascript:showInfo(<s:property value='#son.id' />,"1");'>
					<s:property value="#son.contractname" />
					</a>
				</div>
				<div id="middle" style="width:12%">
					<s:property value='DateFormat("yyyy-MM-dd",#son.insureexp)' />
				</div>
				<div id="middle" style="width: 8%">
					<s:property value="#son.applicant" />
				</div>
				
				<div id="right" style="width: 15%">
						<a href='javascript:showInfo(<s:property value='#son.id' />,"0");'>查看保险</a>&nbsp&nbsp&nbsp&nbsp
						<a href='javascript:showData(<s:property value='#son.id' />,"<s:property value='ModelsById(#son.model).name' />");'>修改</a>&nbsp&nbsp&nbsp&nbsp
				        <a href='<%=path%>/fileUpload.action?value1=<s:property value='#son.id' />'>上传</a>
				</div>
				<script>
				    var turetime="<s:property value='DateFormat("yyyy-MM-dd",#son.insureexp)' />";
					var befor="<s:property value='DateFormatBefor("yyyy-MM-dd",#son.insureexp,30)' />";
					var now="<s:property value='DateFormatNow("yyyy-MM-dd")' />";
					var aStart=befor.split('-'); //转成成数组，分别为年，月，日，下同  
				    var aEnd=now.split('-');  
				    var startDateTemp = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];  
				    var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];  
				    if (startDateTemp < endDateTemp)   
				     alert("客户名为"+"<s:property value="#son.contractname" />"+",车牌号为"+"<s:property value="#son.carnum" />"+",保险日期将近，到期日期为"+turetime);
				</script>
				</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

		<div id="main">
			<div id="fullbg"></div>
			<div id="dialog" style="height:550px;top:205px;overflow-y:scroll;">
				<p class="close">
					<a href="javascript:closeBg();">关闭</a>
				</p>
				<div align="center" id="dialogbody">
					<div style="width: 35%; float: left; display: inline; text-align: right; line-height: 33px;">
						车牌号：
						<br />
						车型：
						<br />
						承包人：
						<br />
						承包人电话：
						<br />
						承包人地址：
						<br />
						承包人身份证号：
						<br />
						保险开始时间：
						<br />
						保险结束时间：
						<br />
						投保公司：
						<br />
						保险种类：
						<br />
						商业险报价：
						<br /> 
						交强险报价：
						<br /> 
						车船税报价：
						<br />
						保险报价：
						<br />
						保险折扣：
						<br />
						客户折扣：
						<br />
						客户支付金额：
						<br />
					</div>
					<div style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="text" id="carnum" style="width: 70%; height: 23px">
						</br>
						<select style="width: 70%; height: 26px;" id="models">

							<s:iterator value="AllModels()" var="son">
								<option value="<s:property value="#son.id"/>">
									<s:property value="#son.name" />
								</option>
							</s:iterator>
						</select>
						</br>
						<input type="text" id="contractname" style="width: 70%;height:21px"></br>
						<input type="text" id="contracttel" style="width: 70%;height:21px"></br>
						<input type="text" id="contractaddress" style="width: 70%;height:21px"></br>
						<input type="text" id="contractidentity" style="width: 70%;height:21px"></br>
						<div class="input-append date" style="border:0px;line-height: 30px;height:30px" id="time1"
						 data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">
						<input size="14" type="text" value="" id="insurestart"></span>
						<input type="hidden" id="dtp_input1" value="" style="height:30px" />
						</div>
						<div class="input-append date" style="border:0px;line-height: 30px;" id="time2" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
						<span class="add-on" style="padding:2px;border:0px;background-color:#fff;">
						<input size="14" type="text" value="" id="insureexp"></span>
						<input type="hidden" id="dtp_input2" value="" style="height:30px" />
						</div>

						<input type="text" id="applicant" style="width: 70%; height: 25px">
						</br>
						<input type="text" id="insuretype" style="width: 70%; height: 25px">
						</br>
						<input type="text" id="business" style="width: 70%; height: 23px">
						</br>
						<input type="text" id="traffic" style="width: 70%; height: 20px">
						</br>
						<input type="text" id="carboat" style="width: 70%; height: 23px">
						</br>
						<input type="text" id="insureoffer" style="width: 70%; height: 21px">
						</br>
						<input type="text" id="insurediscount" style="width: 70%; height: 21px">
						</br>
						<input type="text" id="userdiscount" style="width: 70%; height: 21px">
						</br>
						<input type="text" id="clientpay" style="width: 70%; height: 21px">
						</br>
					</div>

					<div class="btn-group" style="padding-left: 22%">
						<button type="button" class="btn btn-default btn-lg" onclick="update();">
							提交
						</button>
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
</script>
	<script type="text/javascript">
	var carId = 0;
	var tag = 0;
	function addadmin(){
		var carnum = $("#carnum").val("");
		var framenum = 1;
		var contractname = $("#contractname").val("");
		var contracttel = $("#contracttel").val("");
		var contractaddress = $("#contractaddress").val("");
		var contractidentity = $("#contractidentity").val("");
		var insurestart = $("#insurestart").val("");
		var insureexp = $("#insureexp").val("");
		var applicant = $("#applicant").val("");
		var insuretype = $("#insuretype").val("");
		var business = $("#business").val("");
		var traffic = $("#traffic").val("");
		var carboat = $("#carboat").val("");
		var insureoffer = $("#insureoffer").val("");
		var insurediscount = $("#insurediscount").val("");
		
		var userdiscount = $("#userdiscount").val("");
		var clientpay = $("#clientpay").val("");
	
		var select = document.getElementById("models"); 
		for ( var i = 0; i < select.options.length; i++) {
			select.options[i].selected = false;			
		}
		tag = 1;
		showBg();
	}
	
	

	function update(){
		var carnum = $("#carnum").val();
		var framenum = 1;
		var contractname = $("#contractname").val();
		var contracttel = $("#contracttel").val();
		var contractaddress = $("#contractaddress").val();
		var contractidentity = $("#contractidentity").val();
		var insurestart = $("#insurestart").val();
		var insureexp = $("#insureexp").val();
		var applicant = $("#applicant").val();
		var models = $("#models").val();
		var business = $("#business").val();
		var traffic = $("#traffic").val();
		var carboat = $("#carboat").val();
		var insureoffer = $("#insureoffer").val();
		var insurediscount = $("#insurediscount").val();
		
		var userdiscount = $("#userdiscount").val();
		var clientpay =insureoffer* (1-userdiscount);
		var insuretype = $("#insuretype").val();
		var cartype = 1;
		
        if(isNaN(insurediscount)){
		   alert("折扣请填写数字！");
             return;
		}
		if(tag==1){
		
		$.post("<%= path%>/admin.action?function=addfastcar", 
			{"fastcarlist.insureoffer":insureoffer,"fastcarlist.traffic":traffic,"fastcarlist.carboat":carboat,"fastcarlist.business":business, "fastcarlist.insurediscount":insurediscount, "fastcarlist.userdiscount":userdiscount,"fastcarlist.clientpay":clientpay,"fastcarlist.insuretype":insuretype,"fastcarlist.carnum":carnum,"fastcarlist.cartype":cartype,"fastcarlist.framenum":framenum,"fastcarlist.contractname":contractname,"fastcarlist.contracttel":contracttel,"fastcarlist.contractaddress":contractaddress ,"fastcarlist.contractidentity":contractidentity ,"fastcarlist.insurestart":insurestart ,"fastcarlist.insureexp":insureexp ,"fastcarlist.applicant":applicant ,"fastcarlist.model":models},
   			function(data){
    			if(data=="\"Success\""){
    				alert("私有快车车辆添加成功！");
    				location.reload();
    			}
    			if(data=="\"existence\""){
    				alert("车牌号重复！");
    			}
   			}, "text");
   			}
   		else{
   	
   				
		$.post("<%= path%>/admin.action?function=updatafastcar", 
			{ "fastcarlist.insureoffer":insureoffer,"fastcarlist.traffic":traffic,"fastcarlist.carboat":carboat,"fastcarlist.business":business, "fastcarlist.insurediscount":insurediscount,"fastcarlist.userdiscount":userdiscount,"fastcarlist.clientpay":clientpay,"fastcarlist.insuretype":insuretype,"fastcarlist.id":carId,"fastcarlist.carnum":carnum,"fastcarlist.cartype":cartype,"fastcarlist.framenum":framenum,"fastcarlist.contractname":contractname,"fastcarlist.contracttel":contracttel,"fastcarlist.contractaddress":contractaddress,"fastcarlist.contractidentity":contractidentity,"fastcarlist.insurestart":insurestart,"fastcarlist.insureexp":insureexp,"fastcarlist.applicant":applicant,"fastcarlist.model":models},
   			function(data){
    			if(data=="\"Success\""){
    				alert("信息修改成功！");
    				location.reload();
    			}
   			}, "text");
   			}
   	}
	
	function showInfo(Id,type) {
		carId = Id;
		
		if(type==0){
		var contractname = $("#contractname").val();
		var contracttel = $("#contracttel").val();
		var contractaddress = $("#contractaddress").val();
		var contractidentity = $("#contractidentity").val();
		var insurestart = $("#insurestart").val();
		var business = $("#business").val();
		var traffic = $("#traffic").val();
		var carboat = $("#carboat").val();
		var insureexp = $("#insureexp").val();
		
		
		
		$.post("<%=path%>/admin.action?function=selectfastcarbyid&value1="+carId,
    		function(data) {
     			document.getElementById("carnum").value = data.carnum;
     			document.getElementById("contractname").value = data.contractname;
     			document.getElementById("contracttel").value = data.contracttel;
     			document.getElementById("contractaddress").value = data.contractaddress;
     			document.getElementById("contractidentity").value = data.contractidentity;
     			document.getElementById("business").value = data.business;
     			document.getElementById("traffic").value = data.traffic;
     			document.getElementById("carboat").value = data.carboat;
     			document.getElementById("applicant").value = data.applicant;
     			document.getElementById("insuretype").value = data.insuretype;
     			document.getElementById("models").value = data.model;
     			var date=new Date(data.insurestart);
     			
     			document.getElementById("insurestart").value = date.Format("yyyy-MM-dd");
     			date=new Date(data.insureexp);
     			
     			document.getElementById("insureexp").value = date.Format("yyyy-MM-dd");
     			var discount=1-data.insurediscount;
     			var p=data.business*discount+data.traffic+data.carboat;
     			alert("保险种类："+data.insuretype+","+"我司支付金额："+p+",  "+"保险开始时间为"+data.insurestart.replace('T00:00:00',' ')+"  "+"保险结束时间为"+data.insureexp.replace('T00:00:00',' '));
    		},"json");
		
		
		}
		if(type==1){
		var contractname = $("#contractname").val();
		var contracttel = $("#contracttel").val();
		var contractaddress = $("#contractaddress").val();
		var contractidentity = $("#contractidentity").val();
		var insurestart = $("#insurestart").val();
		var insureexp = $("#insureexp").val();
		
		
		
		$.post("<%=path%>/admin.action?function=selectfastcarbyid&value1="+carId,
    		function(data) {
    		
     			document.getElementById("carnum").value = data.carnum;
     			document.getElementById("contractname").value = data.contractname;
     			document.getElementById("contracttel").value = data.contracttel;
     			document.getElementById("contractaddress").value = data.contractaddress;
     			document.getElementById("contractidentity").value = data.contractidentity;
     			document.getElementById("applicant").value = data.applicant;
     			document.getElementById("models").value = data.model;
     			var date=new Date(data.insurestart);
     			document.getElementById("insurestart").value = date.Format("yyyy-MM-dd");
     			date=new Date(data.insureexp);
     			document.getElementById("insureexp").value = date.Format("yyyy-MM-dd");
     			alert("承包人姓名："+data.contractname+" ； "+"承包人手机号："+data.contracttel+" ； "+"承包人地址："+data.contractaddress+" ； "+"承包人身份证号："+data.contractidentity);
    		},"json");
		
		
		}

	}
	
	function showData(Id,modelname) {
		carId = Id;
		
		tag = 0;
		
		var carnum = $("#carnum").val();
		var framenum = 1;
		var contractname = $("#contractname").val();
		var contracttel = $("#contracttel").val();
		var contractaddress = $("#contractaddress").val();
		var contractidentity = $("#contractidentity").val();
		var insurestart = $("#insurestart").val();
		var insureexp = $("#insureexp").val();
		var applicant = $("#applicant").val();
		var models = $("#models").val();
		var business = $("#business").val();
		var traffic = $("#traffic").val();
		var carboat = $("#carboat").val();
		var insureoffer = $("#insureoffer").val();
		var insurediscount = $("#insurediscount").val();
		
		var userdiscount = $("#userdiscount").val();
		var clientpay = $("#clientpay").val();
		var insuretype = $("#insuretype").val();
		
		var select = document.getElementById("models"); 
		for ( var i = 0; i < select.options.length; i++) {

			if (select.options[i].innerHTML == modelname) {
				select.options[i].selected = true;
				break;
			}
		}
		
		
		
		$.post("<%=path%>/admin.action?function=selectfastcarbyid&value1="+carId,
    		function(data) {
     			document.getElementById("carnum").value = data.carnum;
     			document.getElementById("contractname").value = data.contractname;
     			document.getElementById("contracttel").value = data.contracttel;
     			document.getElementById("contractaddress").value = data.contractaddress;
     			document.getElementById("contractidentity").value = data.contractidentity;
     			document.getElementById("applicant").value = data.applicant;
     			document.getElementById("business").value = data.business;
     			document.getElementById("traffic").value = data.traffic;
     			document.getElementById("carboat").value = data.carboat;
     			document.getElementById("insureoffer").value = data.insureoffer;
     			document.getElementById("insurediscount").value = data.insurediscount;
     			document.getElementById("userdiscount").value = data.userdiscount;
     			document.getElementById("clientpay").value = data.clientpay;
     			document.getElementById("insuretype").value = data.insuretype;
     			document.getElementById("models").value = data.model;
     			var date=new Date(data.insurestart);
     			document.getElementById("insurestart").value = date.Format("yyyy-MM-dd");
     			date=new Date(data.insureexp);
     			document.getElementById("insureexp").value = date.Format("yyyy-MM-dd");
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
		$.post("<%=path%>/admin.action?function=fastfastcarone",{value1:s},
    		function(data) {
     		var a ="data[i][0]";
     			for(var i = 0;i<data.length;i++){
     				var c = "<div id='left' style='width: 10%'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width: 10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:6%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' style='width:6%'>"
							+data[i][11]
							+"</div>"
							+"<div id='middle' style='width: 10%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle' style='width: 12%'>"
							+new Date(data[i][7]).Format("yyyy-MM-dd")
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][8]
							+"</div>"
							+"<div id='right' style='width: 15%'>"
							+"<a href='javascript:showInfo("+data[i][10]+",0);'>查看保险</a>&nbsp&nbsp"
							+"<a href='javascript:showData("+data[i][10]+",\""+data[i][0]+"\");'>修改信息</a>&nbsp&nbsp"
							+"<a href='<%=path%>/fileUpload.action?value1="+data[i][1]+"'>上传</a>"
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
</script>

</html>
