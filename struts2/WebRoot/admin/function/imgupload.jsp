<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

  <head>

    <base href="<%=basePath%>">

    

    <title>图片上传</title>

    

     <meta http-equiv="expires" content="0">    
     <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
     <meta http-equiv="description" content="This is my page">
     <meta http-equiv="pragma" content="no-cache">
	 <meta http-equiv="cache-control" content="no-cache">
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
 

  </head>

  

  <body>
             <center>
				
                  <s:form action ="fileUpload" method ="POST" enctype ="multipart/form-data" >
                  <s:fielderror />
				  <input name="caridnum" value='<s:property value='value1' />' id="car" style="display:none"/>
                  <s:file name ="myFile" label ="图片1"/>

                  <s:file name ="myFile" label ="图片2"/>

                  <s:file name ="myFile" label ="图片3"/>
                  
                  <s:file name ="myFile" label ="图片4"/>

                  <s:file name ="myFile" label ="图片5"/>

                  <s:file name ="myFile" label ="图片6"/>

 				  <s:file name ="myFile" label ="图片7"/>
 				  

					<s:submit/>

                    </s:form>  
                    

              </center>
           <s:iterator value="PicByCar(value1)"  var="son">                                                    
 			<div  style="padding: 2px;width:50%;height:auto;"> 
 				                    
 				<img src='UploadImages<s:property value ="#son.path" /> ' style="margin:2px" id=<s:property value ="#son.id" />/> <br />
 				<a href='javascript:delData(<s:property value='#son.id' />);'>删除</a> <br />
 				                              
 				                                                                                             
 			</div>                                                                                               
		</s:iterator>   
		<SCRIPT type="text/javascript">
		function delData(id){
		
			var delid=id;
			alert(delid);
			$.post("<%= path%>/admin.action?function=deletepic", 
			{ value5:delid},
   			function(data){
   			alert(delid);
    			if(data=="\"Success\""){
    				alert("删除成功！");
    				location.reload();
    			}
    			
    		}, "text");
			}
		</SCRIPT>
  </body>

</html>

 
