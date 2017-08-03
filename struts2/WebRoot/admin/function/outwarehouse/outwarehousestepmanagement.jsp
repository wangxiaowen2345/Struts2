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
		<title>商品出库</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
			<SCRIPT type="text/javascript">
				var c= new Array();
				var t;
			</SCRIPT>


	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
			
			<div style="margin-left: 2%;width:100% ;height:20px;"> 
				 
				<span style="font-size:25px;">商品出库</span>
			</div>
			
			
			

		<div id="div1" style="margin-left: 2%; margin-top: 20px;">
			<div id="left" style="background: #00a5a5;">
				<font color="#ffffff">序号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">价格</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">仓库</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">最后更新时间</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">出库数量</font>
			</div>

			<div id="content">
			<s:iterator value="GetOneWareRecordList(value1)" var="son" status="index">
				<div id="left">
					<s:property value="#index.index+1" />
				</div>
				<div id="middle">
					<s:property value="#son.outprice" />
				</div>
				<div id="middle">
					<s:property value="#son.count" />
					<SCRIPT type="text/javascript">
						t = new Array("<s:property value="#son.count" />","<s:property value="value1" />","<s:property value="#son.outprice" />","<s:property value="#son.warehouse" />","<s:property value="#session.adminuser.username" />","<s:property value="value4" />","<s:property value="value3" />");
						c[<s:property value="#index.index" />] = t;
						
					</SCRIPT>
				</div>
				<div id="middle">
					<s:property value="WareHouseById(#son.warehouse).name" />
				</div>
				<div id="middle">
					<s:property value='DateFormat("yyyy-MM-dd hh:mm:ss",#son.time)' />
				</div>
				<div id="right">
					<input type="text" id="count<s:property value="#index.index" />" style="width:60%;height:30px;margin:0px;">
					<input type="button" onclick="sub(<s:property value="#index.index" />);" style="width:30%" value="出库"/>				
				</div>
			</s:iterator>
			</div>

			<div id="bottom"></div>
		</div>
		<SCRIPT type="text/javascript">
			
			function sub(i){
				
				var cc = $("#count"+i).val();
				var reg=/^[0-9]*$/; 
				
				
				if(cc==""){
					alert("出库数量必须填写！");
					$("#count"+i).val("");
					return;
				}     
				if(isNaN(cc) || cc<0)
				{
				    alert("出库数量必须输入数字！");
         			$("#count"+i).val("");
         			return;
					}
      			if(cc==0){
					alert("出库数量不能为0！");
					$("#count"+i).val("");
					return;
				}
				if(parseInt(cc)>parseInt(c[i][0])){
					alert("库存不足！");
					$("#count"+i).val("");
					return;
				}
      					
				$.post("<%=path %>/admin.action?function=postoutware",
				{"ow.productnum":c[i][1],"ow.docount":cc,"ow.price":c[i][2],"ow.warehouseid":c[i][3],"ow.douser":c[i][4],"ow.getuser":c[i][5],"ow.type":c[i][6]},
					function(data){
						if(data=="\"DoType Error!\"")
							alert("请求错误！");
						else if(data=="\"existence\"")
							alert("材料已存在，若修改数量，请返回撤销出库后重新出库！");
						else
							alert("出库成功！");
						window.close(); 
						window.opener.location.href="admin.action?function=outware&value1=<s:property value="value3" />&value2=<s:property value="value4" />";
				},"text");
			}
			
		
		</SCRIPT>
		
	</body>
	
	
</html>
