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
		<title>出库记录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/css/styleForm.css">
		<script src="<%=path%>/admin/js/jquery.min.js" type="text/javascript"></script>
		<SCRIPT type="text/javascript">
		var t;
		var departmentname= new Array();
		var dataList= new Array()
		</SCRIPT>

	</head>

	<body style="text-align: center; font-family: 'Microsoft YaHei';"><br/>
		<p style="margin: 0px;"><font size="5">出库单详情</font>
		<a  style="display: block;margin-right: -25%" href="<%=path%>/admin.action?function=outlist">
		打印
		</a>
		</p>
		<div style="width: 100%; height: 50px; margin-left: 2%;">

			
		<button onclick="suball();" style="float:left;width: 10%;margin-left:1%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
				打印选中
		</button>
		<button onclick="delall();" style="float:left;width: 10%;margin-left:1%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; height: 30px;">
				删除选中
		</button><br/><br/>
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">品名</font>
			</div>

			<div id="middle" style="background: #00a5a5; width: 6%">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 8%">
				<font color="#ffffff">出库类型</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 8%">
				<font color="#ffffff">维修单号或员工</font>
			</div>

			<div id="middle" style="background: #00a5a5; width: 6%">
				<font color="#ffffff">进价</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 6%">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 5%">
				<font color="#ffffff">单位</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 6%">
				<font color="#ffffff">部门</font>
			</div>
			<div id="right" style="background: #00a5a5; width: 12%">
				<font color="#ffffff">仓库</font>
			</div>
			<div id="right" style="background: #00a5a5; width: 10%">
				<font color="#ffffff">时间</font>
			</div>
			<div id="middle" style="background: #00a5a5; width: 6%">
				<font color="#ffffff">操作</font>
			</div>


			<div id="content">
				<s:iterator value="OutWareListByDotype(page)" var="son" status="index">
					<s:set name="pro" value="WaresByNumber(#son.productnumber)" />
					<s:set name="reco"
						value="GetOneEnterWareRecordByOrderNumAndProductNum(#son.ordernumber,#son.productnumber)" />
						
						<s:set name="order" value="OrderListByProductNumberAndNumber(#son.productnumber,#son.ordernumber)" />
					<div id="left">
						<input type="checkbox" value="<s:property value="#son.id" />"> 
						<s:property value="#son.productnumber" />
					</div>
					<div id="middle">
						<s:property value="#pro.name" />
					</div>
					<div id="middle" style="width: 6%">
						<s:property value="#pro.specifications" />
					</div>
					<div id="middle" style="width: 8%">
						<s:if test="#son.dotype==1">
							维修订单出库
						</s:if>
						<s:if test="#son.dotype==2">
							损耗出库
						</s:if>
					</div>
					<div id="middle" style="width: 8%">
						<s:if test="#son.dotype==1">
							<a href="javascript:open<s:property value="#son.getuser" />();"> <s:property
									value="#son.getuser" /> </a>
							<script>
								
								var timer<s:property value="#son.getuser" />;
								var winOpen<s:property value="#son.getuser" />;
								function IfWindowClosed<s:property value="#son.getuser" />() {
									if (winOpen<s:property value="#son.getuser" />.closed == true) {
										location.reload();
										window.clearInterval(timer<s:property value="#son.getuser" />);
									}
								}

								function open<s:property value="#son.getuser" />()
　								{
　　									winOpen<s:property value="#son.getuser" /> = window.open("<%=path%>/admin.action?function=repairinfo&value2=<s:property value="#son.getuser" />&value3=<s:property value="function" />", "newwin", "height=600, width=1000,toolbar=no,scrollbars="+scroll+",menubar=no");
									timer<s:property value="#son.getuser" />=window.setInterval("IfWindowClosed<s:property value="#son.getuser" />()",500); 
								}
								
							</script>
						</s:if>
						<s:if test="#son.dotype==2">
							<s:property value="AdminByUsername(#son.getuser).name" />
						</s:if>

					</div>
					<div id="middle" style="width: 6%">
						<s:property value="#order.price" />
					</div>

					<div id="middle" style="width: 6%">
						<s:property value="#son.docount" />
					</div>
					<div id="middle" style="width: 5%">
						<s:property value="#pro.unit" />
					</div>
					<div id="middle" style="width: 6%">
						<s:property value="DepartmentById(#son.department).departmentname" />
					</div>

					<div id="right" style="width: 12%">
						<s:property value="WareHouseById(#reco.warehouse).name" />
					</div>
					<div id="right" style="width: 10%">
						<s:date name="time" format="yyyy-MM-dd HH:mm" nice="false"  />
						<s:property value="#time" />
					</div>
					<div id="middle" style="width: 6%">
						<a href="<%=path%>/admin.action?function=outlist&value1=<s:property value="#son.id" />">打印</a> 
						 &nbsp; &nbsp; 
		 				<a href="javascript:printout(<s:property value="#index.index" />);">导出</a> 
					</div>
					<SCRIPT type="text/javascript">
								departmentname[<s:property value="#index.index" />] = "部门：<s:property value="DepartmentById(#son.department).departmentname" />";
								t = new Array("<s:property value="#son.productnumber" />","<s:property value="#pro.name" />","<s:property value="#pro.specifications" />","<s:property value="ModelsById(#pro.models).name" />","<s:property value="#pro.madein" />","<s:property value="#son.docount" />","<s:property value="#pro.unit" />",<s:property value="#order.price" />,"<s:property value="WareHouseById(#son.warehouse).name" />","<s:property value='DateFormat("yyyy-MM-dd",#son.time)' />","无");
								dataList[<s:property value="#index.index" />] = t;
					</SCRIPT>
				</s:iterator>
			</div>

			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>

	</body>
	<script type="text/javascript">
		function printout(id){
		var title="青岛迅比迪汽车服务有限公司  领料单";
		var headers=new Array("货号","品名","规格","车型","生产厂家","数量","单位","进价","仓库","出库日期","备注");
		var other=new Array(departmentname[id],"电话：0532-67768266","单位：元").join(',');
		
		window.location.href="<%=path%>/exportExcel.action?p.title="+title+"&p.headers="+headers+"&p.other="+other+"&p.dataList="+dataList[id];
		
    		}
    </script>
   	<script type="text/javascript">
   	function suball(){
   	
                var a = [];// 创建数组
				$("input[type=checkbox]").each(function(){
                        if(this.checked){
							a.push($(this).val()); 
                        }
                    });
                    window.location.href="<%=path%>/admin.action?function=outlist&value1=array&value2="+a;
			}
			
	function delall(){
 	
                var a = [];// 创建数组
                
				$("input[type=checkbox]").each(function(){
		                      if(this.checked){
							a.push($(this).val()); 
		                      }
		                  });
                  var jsona = JSON.stringify(a); 
                  $.post("<%=path%>/admin.action?function=delall",{value1:jsona},
		    		function(data) {
		    			alert(data);
		    			location.reload();
		    		},"json")
	}
	
	function fast(){
		var s = $("#fast").val();
     	document.getElementById("content").innerHTML = "";
		$.post("<%=path%>/admin.action?function=fastoutwarelist",{value1:s},
    		function(data) {
    		
     			for(var i = 0;i<data.length;i++){
     			
     			    var a ;
     			    var num ;
     			    if(data[i][3]==1)
     			    a="维修订单出库";
     			    else
     			    a="损耗出库";
     			    var reg = /^\d+$/;
   			        if (!data[i][4].match(reg)){
					       var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+a
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][4]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][9]
							+"</div>"
							+"<div id='right' style='width: 17%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+"<a href='javascript:printout("+i+");'>导出</a>"
							+"</div>"
								document.getElementById("content").innerHTML += c;
					    }
					    else{    
					       var c = "<div id='left'>"
							+data[i][0]
							+"</div>"
							+"<div id='middle'>"
							+data[i][1]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][2]
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+a
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+"<a href='<%=path%>/admin.action?function=repairinfo&value2="+data[i][4]+"&value3=<s:property value="function" />'>"+data[i][4]+"</a>"
							+"</div>"
							+"<div id='middle' style='width: 8%'>"
							+data[i][5]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][6]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][8]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+data[i][9]
							+"</div>"
							+"<div id='right' style='width: 17%'>"
							+data[i][7]
							+"</div>"
							+"<div id='middle' style='width: 6%'>"
							+"<a href='javascript:printout("+i+");'>导出</a>"
							+"</div>"
								document.getElementById("content").innerHTML += c;
					    } 
	     			
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
