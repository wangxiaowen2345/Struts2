<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>






<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>新订单</title>
		
		<script src="<%=path %>/admin/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path %>/admin/js/json2.js" type="text/javascript"></script>
		<style type=  "text/css">
		
#fullbg {
	background-color: gray;
	height:100%;
	left: 0;
	opacity: 0.5;
	position: absolute;
	top: 0;
	z-index: 3;
	filter: alpha(opacity =                 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
}
#dialog {
    background-color: #fff;
    border: 5px solid rgba(0, 0, 0, 0.4);
    
    left: 50%;
    margin: -200px 0 0 -200px;
    padding: 1px;
    position: fixed !important;
    /* 浮动对话框 */
    position: absolute;
    top: 50%;
    width: 400px;
    z-index: 5;
    border-radius: 5px;
    display: none;
}
#dialog p {
    margin: 0 0 12px;
    height: 24px;
    line-height: 24px;
    background: #CCCCCC;
}
#dialog p.close {
    text-align: right;
    padding-right: 10px;
}
#dialog p.close a {
    color: #fff;
    text-decoration: none;
}
body {
    padding: 0px;
    margin: 0px;
    font-size:14px;
}
#left {
    float: left;
    width: 5%;
    height: 30px;
    list-style-type: none;
    border-left: 1px solid;
    border-top: 1px solid;
    border-right: 1px solid;
    text-align: center;
    line-height: 30px;
    border-color: #00a5a5;
}
#middle {
    float: left;
    width: 23%;
    height: 30px;
    border-top: 1px solid;
    border-right: 1px solid;
    text-align: center;
    line-height: 30px;
    border-color: #00a5a5;
}
#right {
    float: left;
    width: 20%;
    height: 30px;
    border-top: 1px solid;
    border-right: 1px solid;
    text-align: center;
    line-height: 30px;
    border-color: #00a5a5;
}
#bottom {
    float: left;
    width: 95%;
    height: 0px;
    border-left: 1px solid;
    border-top: 1px solid;
    border-right: 1px solid;
    border-bottom: 0px solid;
    text-align: center;
    border-color: #00a5a5;
}

		</style>
		
		
		
	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';margin-bottom: 100px;">
			<div style="width:100%;margin-left: 1%;">
			<font size="5">供应商：<s:property value='SuppliersById(value1)' /></font>
			</div>
			<div style="width:100%;margin-left: 1%; margin-top: 20px;">
				
				
			<div style="width:49% ;float: left;height:20px;"> 
				 
				<span style="font-size:25px;">备选区域</span>
				<div style="float: right;margin-right:5%;margin-top: 10px">
					
					<input type="text" id="fasttext" style="width:50%" onkeyup="javascript:fastwares();"/><button onclick="javascript:fastwares();" style="width:40%">快速搜索</button>
					
				</div>
				
			</div>
			
			<div style="width:49%;margin-left: 1%; float: left;height:20px;">
				<span style="font-size:25px;" id="msgt">下单区域</span>
				<div style="float: right;margin-right:6%;margin-top: 10px">
					订单编号：
					<input type='text' id='ordernumber' value='<s:property value='GetOrderNumber()' />' disabled='true'>
				</div>
			</div>
			
			</div>
		
			<div id="div1" style="width:49%;margin-left: 1%; margin-top: 20px;float: left;">
				<div id="left" style="background: #00a5a5;">
					
				</div>
				<div id="middle" style="background: #00a5a5;width:12%"> 
					<font color="#ffffff">货号</font>
				</div>
				<div id="middle" style="background: #00a5a5;">
					<font color="#ffffff">品名</font>
				</div>
				<div id="middle" style="background: #00a5a5;width:11%">
					<font color="#ffffff">单位</font>
				</div>
				<div id="middle" style="background: #00a5a5;">
					<font color="#ffffff">车型</font>
				</div>
				
				<div id="right" style="background: #00a5a5;">
					<font color="#ffffff">规格</font>
				</div>
				
				
				
				<!--
                	作者：mahaojie299@163.com
                	时间：2015-11-01
                	描述：以下容器用于备选区数据
                -->
                
                
				<div style="height:400px;width:100%;overflow-y:scroll;overflow-x: hidden;" id="leftcontent">
				</div>	
				
				
				<div style="width: 100%;">
						
					<button onclick="javascript:ckall();" style="width: 20%;margin-top: 30px;height: 30px;">全选/取消</button>
					
					<button onclick="javascript:Addnewwares();" style="margin-left:10%;width: 30%;margin-top: 30px;height: 30px;">添加新商品</button>
					
					<button onclick="javascript:lefttoright();" style="margin-left:8%;width: 28%;margin-top: 30px;height: 30px;">添加至订单</button>
					
				</div>

				
				
			</div>
			
			
			<div id="div2" style="width:49%;margin-left: 1%; margin-top: 20px;float: left;">
				<div id="left" style="background: #00a5a5;width: 8%;">
					<font color="#ffffff">货号</font>
				</div>
				
				<div id="middle" style="background: #00a5a5;width: 30%;">
					<font color="#ffffff">品名</font>
				</div>
				<div id="middle" style="background: #00a5a5;width: 10%;">
					<font color="#ffffff">规格</font>
				</div>
				
				<div id="middle" style="background: #00a5a5;width: 10%;">
					<font color="#ffffff">数量</font>
				</div>
				<div id="middle" style="background: #00a5a5;width: 12%;">
					<font color="#ffffff">进价</font>
				</div>
				
				<div id="middle" style="background: #00a5a5;width: 15%;">
					<font color="#ffffff">小计</font>
				</div>
								
				<div id="right" style="background: #00a5a5;width: 9%;">
					<font color="#ffffff">操作</font>
				</div>
				
				
				<!--
                	作者：mahaojie299@163.com
                	时间：2015-11-01
                	描述：以下容器用于承载购物车数据
                -->
				<div style="height:400px;width:100%;overflow-y:scroll;overflow-x: hidden;" id="rightcontent">
					
				
				
				</div>	
				
				
				
				
				<div style="width: 100%; height:100px;">
						
					<button onclick="javascript:deleteall();" style="width: 20%;margin-top: 30px;height: 30px;">删除所有</button>
					
					<input type='text' id='allprice' style='margin-left: 20%;height: 24px;width:30%; margin-top: 30px;' value='' disabled='true'>
					
					<button onclick="javascript:sub();" style="width: 20%;margin-top: 30px;height: 30px;">提交订单</button>
				
				</div>
				</div>
				
				
				
				
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
						品名：
						<br />
						单位：
						<br />
						车型：
						<br />
						规格：
						<br />
						生产商：
						<br />
					</div>
					<div
						style="width: 65%; float: right; display: inline; text-align: left; line-height: 30px;">
						<input type="text" id="nmt" style="width: 70%">
						</br>
						<input type="text" id="unit" style="width: 70%">
						</br>
						<select style="width: 70%" id="mdk">

								<s:iterator value="AllModels()" var="son">
								
								<option value="<s:property value='#son.id'/>"><s:property value='#son.name'/></option>
								</s:iterator>
							
						</select>
						</br>
						<input type="text" id="spt" style="width: 70%">
						</br>
						<input type="text" id="mdt" style="width: 70%">
						</br>

					</div>
					
					<button onclick="Add();">提交</button>

				</div>
			</div>
		</div>
		<br /><br /><br /><br /><br />
			
			
		</body>
		
		
		
		
		<script type="text/javascript">
			var cktag=false;
			function ckall(){
				cktag = !cktag;
				for(var i = 0 ; i < left.length ; i++){
					document.getElementById("ck"+left[i][0]).checked=cktag;
				}
				
			}
			
			var left = new Array();
			
			<s:iterator value="SelectWaresBySuppliers(value1)" var="son" status="index">
			addLeft(<s:property value='#son.id'/>,"<s:property value='#son.number'/>","<s:property value='#son.name'/>","<s:property value='ModelsById(#son.models).name'/>","<s:property value='#son.specifications'/>","<s:property value='#son.unit'/>");
			</s:iterator>
			
			
			
			function addLeft(id , number , name , models , sp,unit){
				var arr = new Array(id,number+"" , name+"" ,models+"" , sp+"", unit+"");
				left[left.length] = arr;
			}
			
			function getLeftinfo(i){
				return "<div id='left' style='overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+"<input type='checkbox' id='ck"+left[i][0]+"'>"
						+"</div>"
						+"<div id='middle' style='width:12%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+left[i][1]
						+"</div>"
						+"<div id='middle' style='width:23%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+left[i][2]
						+"</div>"
						+"<div id='middle' style='width:14%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+left[i][5]
						+"</div>"
						+"<div id='middle' style='width:20%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+left[i][3]
						+"</div>"
						+"<div id='right' style='width:22%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
						+left[i][4]
						+"</div>"
						+"<div id='bottom'></div>"
			}
			
			
			function reloadLeft(){
				document.getElementById("leftcontent").innerHTML = "";
				for(var i = 0;i<left.length;i++){
					document.getElementById("leftcontent").innerHTML += getLeftinfo(i);
				}
			}
			
			reloadLeft();
			
			
			function addproduct(number,name,specifications,count,price,id){
				var arr = new Array(number,name,specifications,count,price,parseFloat(count*price).toFixed(2),id);
				right[right.length] = arr;
			}
						
			function getRightinfo(i){
				return "<div id='right"+i+"' style='width: 100%;margin:0px;'>"
				+"<div id='left' style='width: 10%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+ right[i][0] 
				+"</div>"
				+"<div id='middle' style='width: 30%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+ right[i][1] 
				+ "</div>"
				+"<div id='middle' style='width: 10%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+ right[i][2] 
				+ "</div>"
				+"<div id='middle' style='width: 10%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+"<input type='text' value='"+right[i][3]+"' id='count"+i+"' onblur='javascript:reloadPrice("+i+");' style='margin-left:5%;width:70%' />&nbsp;"
				+"</div>"
				+"<div id='middle' style='width: 12%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+"<input type='text' value='"+right[i][4]+"' id='price"+i+"' onblur='javascript:reloadPrice("+ i +");' style='margin-left:5%;width:60%' />元" 
				+"</div>"
				+"<div id='middle' style='width: 15%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+ "<input type='text' id='ap"+i+"' style='width:60%;' value='"+right[i][5]+"' disabled='true'>元"
				+"</div>"
				+"<div id='right' style='width: 10%;overflow: hidden; text-overflow:ellipsis;white-space:nowrap;'>"
				+"<a href='javascript:deleteone("+i+")'>删除</a>"
				+"</div>"
				+"<div id='bottom'></div>"
				+"</div>";
			}
			
			function checkRateint(input)
			{
     			var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
     			if (!re.test(input))
    			{
        			return false;
     			}
    			return true;
			}
			
			/**
			 * 计算第i个商品价格
			 * @param {Object} i
			 */
			function reloadPrice(i){
			
				var count = document.getElementById("count"+i).value;
				
				var price = document.getElementById("price"+i).value;
				
				var name = right[i][1];
				
				
				if(!checkRateint(count)){
					alert(name+"的数量格式填写错误！已重置为1");
					document.getElementById("count"+i).value = 1;
					count = 1;
				}
				document.getElementById("count"+i).value = count;
				right[i][3] = count;
				
				if(!checkRateint(price)){
					alert(name+"的价格格式填写错误！已重置为1.00元");
					document.getElementById("price"+i).value = 1;
					price = 1;
				}
				document.getElementById("price"+i).value = parseFloat(price).toFixed(2);
				right[i][4] = parseFloat(price).toFixed(2);

				var all = parseFloat(price).toFixed(2)*count;
				
				right[i][5] = parseFloat(all).toFixed(2);
				var aprice = document.getElementById("ap"+i);
				
				aprice.value = right[i][5];
				
				reallprice();
			}
			
			/**
			 * 计算总价格
			 */
			function reallprice(){
				var rall = 0.00;
				
				for(var j = 0;j<right.length;j++){
					rall = parseFloat(right[j][5]) + parseFloat(rall);
				}
				
				document.getElementById("allprice").value = "合计："+ rall + "元";
			}
			
			var right = new Array();
			
			function isrightexistence(number){
				for(var j = 0 ; j<right.length;j++){
					if(right[j][0]==number)
						return true;	
   				}
   				return false;
			}
		
			function lefttoright(){
				document.getElementById("msgt").innerHTML += "&nbsp;<font color='red'>正在添加</font>";
				var aaa = new Array();
				for(var i = 0 ; i < left.length ; i++){
					if(document.getElementById("ck"+left[i][0]).checked){
						if(isrightexistence(left[i][1]))
							continue;
						aaa[aaa.length]=new Array(right.length,left[i][1]);
   						addproduct(left[i][1],left[i][2],left[i][4],1,0,left[i][0]);
   						
					}
				}
				reloadform();
				for(var j = 0 ; j<aaa.length;j++){
				
					$.ajax({
 						type: "POST",
 						url: "<%=path %>/admin.action",
 						async : false,//是否为同步
 						data: "function=SelectOrderListByNumberOrderByTimeDesc&value1="+aaa[j][1],
 						success: function(data){
   								p = data.price;  
   								document.getElementById("price"+aaa[j][0]).value=p+"";	
   								reloadPrice(aaa[j][0]);					
   						},
 						dataType: "json"
					});
				}


				
				document.getElementById("msgt").innerHTML = "下单区域";
				
			}
			
			function deleteone(i){
				right.splice(i,1);
				reloadform();
			}
			
			function deleteall(){
				right = new Array();
				reloadform();
			}
			
			function reloadform(){
				document.getElementById("rightcontent").innerHTML = "";
				for(var i = 0;i<right.length;i++){
					document.getElementById("rightcontent").innerHTML += getRightinfo(i);
				}
				reallprice();
			}
			
			
			
			
			
			
			
			function Addnewwares(){
				$("#nmt").val("");
				$("#spt").val("");
				$("#mdt").val("");
				$("#unit").val("");
				showBg();
			}
			
			function Add(){
				var nmt = $("#nmt").val();
				var unit = $("#unit").val();
				var mdk = $("#mdk").val();
				var spt = $("#spt").val();
				var mdt = $("#mdt").val();
				
				
				if(nmt==""){
					alert("品名不能为空");
					return;
				}
				if(unit==""){
					alert("单位不能为空");
					return;
				}
				
				$.post("<%=path %>/admin.action?function=addwares", 
					{ "wares.name":nmt,"wares.unit":unit,"wares.specifications":spt,"wares.madein":mdt,"wares.models":mdk ,"wares.suppliers":<s:property value='value1' />},
   					function(data){
   						alert("添加或搜索成功！");
    					$("#fasttext").val(data.number);
    					fastwares();
    					closeBg();
   					}, "json");
			}
			
			function fastwares(){
				var fast = $("#fasttext").val();
				$.post("<%=path %>/admin.action?function=fastwares", 
					{ value1:fast ,value2:<s:property value='value1' />},
   					function(data){
   						left = new Array();
    					for(var i = 0;i<data.length;i++){
    						addLeft(data[i][0] , data[i][1] ,data[i][2] , data[i][4] , data[i][3], data[i][5]);
    					}
    					reloadLeft();
   					}, "json");
			}
			
			function sub(){
				
				if(right.length==0){
					alert("订单商品不能为空！");
					return;
				}
				
				for(var i = 0 ;i < right.length ; i++){
					if((right[i][3]+"")=="0"){
						alert(right[i][1]+"的数量填写错误，不能为0！请确认数量");
						return;
					}
				}
				console.log(right);
				var jsondata = JSON.stringify(right);      //订单数据  json
				var ordernumber = $("#ordernumber").val(); //订单编号  六位数字
				
				$.post("<%=path %>/admin.action?function=addorder", 
					{ value1:jsondata,value3:ordernumber,value2:<s:property value='value1' />},
					
   					function(data){
   						if(data=="\"existence\"")
   							alert("请勿重复提交订单！");
   						else{
   							alert("订单提交成功！");
   							location.reload();
   						}
    					
   					}, "text");
			}
			
			//显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css( {
			height : "auto",
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