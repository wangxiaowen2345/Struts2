<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="left_menu">
	<ul id="nav_dot">

		<s:iterator value="getMenu()" var="son">
			<li>
				<h4 class="M<s:property value="#son.id"/>">
					<span></span><s:property value="#son.navname"/>
				</h4>
				<div class="list-item none">
					<s:iterator value="#son.son" var="sson">
						<a href='<%=path %>/admin.action?function=<s:property value="#sson.function"/>' target="sonleft"><s:property value="#sson.navname"/></a>
					</s:iterator>
				</div>
			</li>
		</s:iterator>

	</ul>
</div>