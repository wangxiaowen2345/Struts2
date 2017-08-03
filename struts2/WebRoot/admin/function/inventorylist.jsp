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
		<title>青岛迅比迪汽车服务有限公司</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="<%=path%>/admin/js/jquery.min.js" type="text/javascript"></script>


	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';">
	<p style="margin: 10px"><font size="5">库存单详情</font>
		<a  style="display: block;margin-right: -25%" href="<%=path%>/admin.action?function=warelist&value1=<s:property value="value1" />">
		打印
		</a>
		<div style="width: 100%; height: 50px; margin-left: 2%;">
			
			<!--  <div style="float: left; width: 20%; height: 30px; margin-left: 70%">
				<input id="fast" type="text" onkeyup="fast();"
					style="margin-top: 20px; margin-bottom: 20px; height: 30px; width: 60%;">
				<button onclick="fast();"
					style="width: 30%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
					搜索
				</button>
				
			</div>
			
			<a href="javascript:printout();" style="height:50px;line-height:70px;display: block;">导出</a> &nbsp;&nbsp;&nbsp;-->
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width: 10%">
				<font color="#ffffff">品名</font>
			</div>

			<div id="middle" style="background: #00a5a5; width: 8%">
				<font color="#ffffff">规格</font>
			</div>
			
			<div id="middle" style="background: #00a5a5; width: 9%">
				<font color="#ffffff">进价</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 8%">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 5%">
				<font color="#ffffff">单位</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 8%">
				<font color="#ffffff">售价</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 10%">
				<font color="#ffffff">仓库</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 15%">
				<font color="#ffffff">供应商</font>
			</div>

			<div id="right" style="background: #00a5a5; width: 18%">
				<font color="#ffffff">操作</font>
			</div>


			<div id="content">
				<s:iterator value="InventoryList(page,value1)" var="son" status="index">
					<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
					<s:set name="reco" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
					<div id="left">
						<s:property value="#son.productnumber" />
					</div>
					<div id="middle" style="width: 10%">
						<s:property value="#pro.name" />
					</div>
					<div id="middle" style="width: 8%">
						<s:property value="#pro.specifications" />
					</div>
					
					<div id="middle" style="width: 9%">
						<s:property value="#reco.price" />

					</div>
					<div id="middle" style="width: 8%">
						<s:property value="#son.count" />
					</div>
						<div id="middle" style="width: 5%">
						<s:property value="#pro.unit" />
					</div>
					<div id="middle" style="width: 8%">
					<s:property value="#son.outprice" />
					</div>
					<div id="middle" style="width: 10%">
					<s:property value="WareHouseById(#son.warehouse).name" />		
					</div>
					<div id="middle" style="width: 15%">
					<s:property value="SuppliersById(#pro.suppliers)" />
					</div>
					<div id="right" style="width: 18%">
						<input type="text" id="count<s:property value="#index.index" />" style="width:25%;height:75%;">
						<select style="width:40%;"   id="s<s:property value="#index.index" />">		
							<s:iterator value="AllWareHouse()" var="sson" >
							<option value="<s:property value="#sson.id"/>"><s:property value="#sson.name"/></option>  
							</s:iterator>
						</select>
						<input type="button" onclick="sub(<s:property value="#index.index" />,<s:property value="#son.id" />,<s:property value="#son.count" />);" style="width:30%" value="转出"/>
					</div>
<!--					<script>
					var count=<s:property value="#son.count" />;
					if(count<10){
					alert("货号为<s:property value="#son.productnumber" />的<s:property value="#pro.name" />库存数量为"+count+",请及时添加！");
					}
					</script>-->
				</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom:50px;"></div>
		</div>
	<form id="test" style="display:none">
	<input type="submit" value='提交'>
	<input id="titleid" name="title" >
	<input id="headersid" name="headers" >
	<input id="otherid" name="other" >
	<input id="dataListid" name="dataList" >
	</form>
	</body>
	<script type="text/javascript">
	
			function sub(i,id,wcount){
				var wco=wcount;
				var wid= id;
				var wc = $("#count"+i).val();
				var ww = $("#s"+i).val();
				var house="<s:property value="value1" />";
				if(ww==house){
				 alert("请选择转出仓库！");
				 return;
				}
				if(wc==""){
				 alert("请填写转出数量！");
				 return;
				}
				if(wc>wco){
				 alert("转出数量不能大于库存数量！");
				 return;
				}
				$.post("<%=path %>/admin.action?function=rollout",{value4:wid,value6:wc,value7:ww},
					function(data){
						if(data=="\"Success\"")
							alert("转出成功！");
						else if(data=="\"existence\"")
							alert("材料已存在，若修改数量，请返回撤销出库后重新出库！");
						location.reload();
						
				},"text");
			}
			
			
	function fast(){
		var s = $("#fast").val();
     	document.getElementById("content").innerHTML = "";
		$.post("<%=path%>/admin.action?function=fastinventory",{value1:s,value2:<s:property value="value1" />},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
     						var listWareHouse = new Array();
     						<s:iterator value='AllWareHouse()' var='sson' status='index' >
     					    listWareHouse[<s:property value="#index.index" />] = "<option value='<s:property value='#sson.id'/>'><s:property value='#sson.name'/></option> "
							</s:iterator>
					       var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width: 10%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width: 9%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width: 5%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' style='width: 10%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle' style='width: 15%'>"
							+data[i][7]
							+"</div>"
							+"<div id='right' style='width: 18%'>"
							+"<input type='text' id='count"+i+"' style='width:25%;height:75%;'>"
							+"<select style='width:40%;'   id='s"+i+"'>		"
							+listWareHouse
							+"</select>"
							+"<input type='button' onclick='sub("+i+","+data[i][9]+","+data[i][3]+");' style='width:30%' value='转出'/>"
							+"</div>"

								document.getElementById("content").innerHTML += c;
					    }
    		},"json");
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


	
</script>
</html>
