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
		<title>员工损耗</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script src="<%=path %>/admin/js/jquery.min.js"></script>
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
				border-bottom: 1px solid #000;}
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
				var cc=0;
				var c= new Array();
				var t;
			</SCRIPT>
		
	</head>
	
	
	
	<body style="text-align: center;font-family: 'microsoft yahei';">
	<br/>
		<p style="margin: 0px;"><font size="5">员工出库单详情</font>
		<a  style="display: block;margin-right: -25%" href="<%=path%>/admin.action?function=employeeout&value1=<s:property value="value2" />">
		打印
		</a>
		</p>
<!--		-->
<!--		<div style="width: 100%; height: 50px; margin-left: 1%;">-->
<!--			-->
<!--			<div style="float: left; width: 20%; height: 30px; margin-left: 70%">-->
<!--			-->
<!--			<input id="fast" type="text" onkeyup="fast();"-->
<!--				style="margin-top: 20px; margin-bottom: 20px; height: 25px; width: 60%;">-->
<!--			<button onclick="fast();"-->
<!--				style="width: 30%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">-->
<!--				搜索-->
<!--			</button>-->
<!--			</div>-->
<!--		</div>-->
		<button onclick="suball();" style="float:left;width: 10%;margin-left:1%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
					全部损耗
		</button><br/>

		<div id="div1" style="margin-left:1%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:6%">
				<font color="#ffffff">单号</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:6%">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">单位</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">进价</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">产品名称</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%">
				<font color="#ffffff">仓库</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:8%">
				<font color="#ffffff">损耗部门</font>
			</div>
			
			<div id="right" style="background: #00a5a5;width:18%">
				<font color="#ffffff">损耗数量</font>
			</div>
			

			<div id="content">
			<s:iterator value="GetWareRecordList(value3)" var="son" status="index">
			<s:set name="reco" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
				<div id="left">
				<input type="checkbox" value="<s:property value="#index.index" />"> 
				<s:property value="#son.productnumber" />
				</div>
				<div id="middle" style="width:6%">
				<s:property value="#son.ordernumber" />
				</div>
				<div id="middle" style="width:6%">
				<s:property value="#son.count" />
					<SCRIPT type="text/javascript">
						t = new Array("<s:property value="#son.count" />","<s:property value="#son.productnumber" />","<s:property value="#reco.price" />","<s:property value="#son.warehouse" />","<s:property value="#son.douser" />","<s:property value="SelectAdminUserById(value2).username" />","<s:property value="value1" />","<s:property value="#son.ordernumber" />");
						c[<s:property value="#index.index" />] = t;
					</SCRIPT>
				</div>
				<s:set value="WaresByNumber(#son.productnumber)" name="wn"></s:set>
				
				<div id="middle" style="width:10%">
				<s:property value="#wn.unit" />
				</div>
				<div id="middle" style="width:8%">
				<s:property value="#wn.specifications" />
				</div>
				<div id="middle" style="width:8%">
				<s:property value="#reco.price" />
				</div>
				<div id="middle" >
				<s:property value="#wn.name" />
				</div>
				<div id="middle" style="width:10%">
				<s:property value="WareHouseById(#son.warehouse).name" />
				</div>
				<div id="middle" style="width:8%;">
					<select style="width:80%;height:30px;" id="departmentname<s:property value="#index.index" />"  class="myselect">
						<s:iterator value="AllDepartment()" var="sson" >
    					<option value="<s:property value="#sson.id"/>"  ><s:property value="#sson.departmentname"/></option>  
    					</s:iterator>
  					</select>
				</div>
				<div id="right" style="width:18%">
				<input type="text" id="count<s:property value="#index.index" />" style="width:60%;height:20px;margin:0px;">
				<input type="button" onclick="sub(<s:property value="#index.index" />);" style="width:30%" value="确认损耗"/>
				</div>
				</s:iterator>
				</div>

			<div id="bottom" style="margin-bottom: 20px"></div>
		</div>
		
	</body>
	<SCRIPT type="text/javascript">
		function showMsg(obj) {
		    var opt = obj.options[obj.selectedIndex];
		    $(".myselect").val(opt.value);
		 }
		function fast(){
		var s = $("#fast").val();
     	document.getElementById("content").innerHTML = "";
		var id="<s:property value="value2" />";
		var wh="<s:property value="value3" />";
		$.post("<%=path%>/admin.action?function=fastconsumption",{value1:s,value2:id,value3:wh},
    		function(data) {
     			for(var i = 0;i<data.length;i++){
					       var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width: 10%'>"
							+data[i][3]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle' style='width:10%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width:8%'>"
							+"<select style='width:80%;height:30px;' id='departmentname"+i+"' >"
							+"<s:iterator value='AllDepartment()' var='sson' >"
    						+"<option value='<s:property value="#sson.id"/>'  ><s:property value="#sson.departmentname"/></option>"
    					    +"</s:iterator>"
  						    +"</select>"
							+"</div>"
							+"<div id='right' style='width: 18%'>"
							+"<input type='text' id='count"+i+"' style='width:60%;height:20px;margin:0px;'>"
							+"<input type='button' onclick='sub("+i+");' style='width:30%' value='确认损耗'/>"
							+"</div>"
							document.getElementById("content").innerHTML += c;
							}
    		},"json");
	}
			function suball(){
				$("input[type=checkbox]").each(function(){
                        if(this.checked){
                           sub($(this).val());
                        }
                    });
			}
			
			function sub(i){
				
				var cc = $("#count"+i).val();
				var obj = $("#departmentname"+i).get(0);//索引
				var opt = obj.options[obj.selectedIndex];
				var ovalue=opt.value;
				console.log(ovalue);
				var reg=/^[0-9]*$/; 
				if(cc==""){
					alert("损耗数量必须填写！");
					$("#count"+i).val("");
					return;
				}     
				if(isNaN(cc) || cc<0)
				{
         			alert("损耗数量必须输入数字！");
         			$("#count"+i).val("");
         			return;
      			}
      			if(cc==0){
					alert("损耗数量不能为0！");
					$("#count"+i).val("");
					return;
				}
				if(parseInt(cc)>parseInt(c[i][0])){
					alert("库存不足！");
					$("#count"+i).val("");
					return;
				}
		
      					
				$.post("<%=path %>/admin.action?function=postoutwarebydouser",
				{"ow.productnum":c[i][1],"ow.ordernum":c[i][7],"ow.docount":cc,"ow.department":ovalue,"ow.price":c[i][2],"ow.warehouseid":c[i][3],"ow.douser":c[i][4],"ow.getuser":c[i][5],"ow.type":c[i][6]},
					function(data){
						if(data=="\"DoType Error!\"")
							alert("请求错误！");
						else if(data=="\"existence\"")
							alert("材料已存在，若修改数量，请返回撤销出库后重新出库！");
						else
							alert("员工损耗单填写成功！");
						location.reload();
						
				},"text");
			}
			
		
		</SCRIPT>
	

</html>