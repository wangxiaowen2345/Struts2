<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.haojie.pojo.Admin"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<ul>
	<li>
		<s:property value="getSystemValue('sitenameen')" />
		欢迎您！
	</li>
	<li>
		<a href=""><s:property value="#session.adminuser.username" />
		</a>
	</li>
	<li>
		<a href="javascript:ReUserPassword();">修改密码</a>
	</li>
	<li>
		<a href="<%=path%>/admin.action?function=outLogin">退出</a>
	</li>
</ul>



