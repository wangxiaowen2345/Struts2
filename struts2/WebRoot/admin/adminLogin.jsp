<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<html>	
<head>
<title><s:property value="getSystemValue('sitenameen')" />管理系统登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="admin/css/adminloginstyle.css" rel='stylesheet' type='text/css' />
<!--webfonts
<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>-->
<!--//webfonts-->
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<script>
$(document).ready(function(c) {
	$('.close').on('click', function(c){
		if(confirm("您确定要关闭本页吗？")){
			window.opener=null;
			window.open('','_self');
			window.close();
		}
		//$('.login-form').fadeOut('slow', function(c){
	  	//	$('.login-form').remove();
		//});
	});	  
});
</script>
 <!--SIGN UP-->
 <h1><s:property value="getSystemValue('sitename')" /></h1>
 
<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar" style="display:none;">
		<img src="admin/images/aaa.png" style="width:300px;height:200px"/>
		<br><br><p><font color="red"><s:property value="getMsg()"></s:property></font><p>
	</div>
			<form action="<%=path %>/admin.action" method="post">
					<input type="text" class="text" name="aus.username" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" >
						<div class="key">
					<input type="password" name="aus.password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
						</div>
						
		
	<div class="signin">
		<input type="submit" value="Login" >
	</div>
		</form>
</div>
 <!-- <div class="copy-rights">
					<p>Copyright &copy; 2015.Company name All rights reserved.</p>
			</div>
 -->
</body>
</html>