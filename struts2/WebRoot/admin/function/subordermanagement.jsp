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
		<title>订单详情</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/styleForm.css">
		<script
			src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script type="text/javascript">
			var c = 0;
		</script>

	</head>

	<body style="align: center; font-family: 'Microsoft YaHei';">
		<form action="<%=path %>/admin.action?function=enterwarehouse&value1=<s:property value="getValue1()"/>&value2=<s:property value="#session.adminuser.username"/>" method="post" id="formaction"> 
		<!-- ><button onclick="javascript:location.href='<%=path %>/admin.action?function=newordermanagement';"
			style="margin-top: 20px; margin-left: 2%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			添加新订单
		</button> -->
		<br/>
		<div style="margin-left: 2%;;">
		订单编号：<s:property value="OrderByNumber(value1).number"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		供应商：<s:property value="SuppliersById(OrderByNumber(value1).suppliers)"/>
		<br/>
		订单时间：<s:property value="DateFormat('yyyy-MM-dd',OrderByNumber(value1).time)"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		订单金额：<s:property value="OrderByNumber(value1).alltotalprice"/>元
		<button onclick="sub();"
			style="margin-left: 75%; background: #00a5a5; border: 0px; color: #ffffff; font-size: 15px; width: 150px; height: 30px;">
			确认入库
		</button>
		
		</div>
		<div id="div1" style="margin-left: 2%; margin-top: 10px;">
			<div id="left" style="background: #00a5a5;width:7%;">
				<font color="#ffffff">货号</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">品名</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:14%;">
				<font color="#ffffff">规格</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%;">
				<font color="#ffffff">进价</font>
			</div>
			<div id="middle" style="background: #00a5a5;width:10%;">
				<font color="#ffffff">数量</font>
			</div>
			<div id="middle" style="background: #00a5a5;">
				<font color="#ffffff">售价</font>
			</div>
			<div id="right" style="background: #00a5a5;">
				<font color="#ffffff">仓库</font>
			</div>

			<s:iterator value="OrderListByNumber(value1)" var="son" status="index">
				<div id="left" style="width:7%;">
					<s:property value="#son.productnumber" />
					<input type="hidden" name="wrlist[<s:property value="#index.index" />].productnumber" id="pn<s:property value="#index.index" />" value='<s:property value="#son.productnumber" />'/>
				</div>
				<div id="middle">
					<s:property value="WaresByNumber(#son.productnumber).name" />
				</div>
				<div id="middle" style="width:14%;">
					<s:property value="WaresByNumber(#son.productnumber).specifications" />
				</div>
				<div id="middle" style="width:10%;">
					<s:property value="#son.price" />
				</div>
				<div id="middle" style="width:10%;">
					<s:property value="#son.count" />
				</div>
				<div id="middle">
					<input type="text" value="<s:if test="SelectOneWareByNumberOrderByTimeDesc(#son.productnumber)==null">0.00</s:if><s:else><s:property value="SelectOneWareByNumberOrderByTimeDesc(#son.productnumber).outprice"/></s:else>" name='wrlist[<s:property value="#index.index" />].outprice' id="p<s:property value="#index.index" />" onblur="checknum(<s:property value="#index.index" />);" style="width:80%;height:30px;">
				</div>
				<div id="right">
					<select style="width:80%;height:30px;"  name="wrlist[<s:property value="#index.index" />].warehouse" class="myselected" onchange="showMsged(this)">
						<s:iterator value="AllWareHouse()" var="sson" >
    					<option value="<s:property value="#sson.id"/>" selected="selected" ><s:property value="#sson.name"/></option>  
    					</s:iterator>
  					</select>  
					
				</div>
				<script type="text/javascript">
					c = <s:property value="#index.index" />;
				</script>
			</s:iterator>


			<div id="bottom" style="margin-bottom: 50px"></div>
		</div>
		</form>
		
		
	</body>
	<script type="text/javascript">
			 
			function showMsg(obj) {
		    var opt = obj.options[obj.selectedIndex];
		    $(".mySelect").val(opt.value)
		 }
		 	function showMsged(obj) {
		    var opt = obj.options[obj.selectedIndex];
		    $(".mySelected").val(opt.value)
		 }
			c=c+1;
			
			function checkRateint(input){
     			var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
     			if (!re.test(input))
    			{
        			return false;
     			}
    			return true;
			}
			
			function checknum(i){
				if(!checkRateint($("#p"+i).val())){
					alert("请正确输入金额！");
					$("#p"+i).val("0.00");
					return;
				}
				$("#p"+i).val(parseFloat($("#p"+i).val()).toFixed(2)) ;
			}
			
	
	
			function sub(){
				var result =confirm("确定入库吗?");
				if(result == true){
					for(var i = 0;i<c;i++){
        				if($("#p"+i).val()==""){
        					alert("请完整填写表单！");
        					return;
        				}
        				if($("#p"+i).val()=="0.00"){
        					if(window.confirm('有产品价格为0.00，确定要继续提交吗？')){
                 				continue;
             				 }else{
                 				return;
             				}
        				}
        			}
        			var a = $("#formaction");
        			a.submit();
				}
				else{
					return ;
				}
        	}
	
	
	
	

</script>
</html>
