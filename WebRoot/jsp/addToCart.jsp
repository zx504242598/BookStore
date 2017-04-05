<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>加入购物车</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>
<body>
 	<%
		String bookid=request.getParameter("bookid");
		String quantity=request.getParameter("quantity");
		%>
		<s:action name="addToCart" executeResult="false" >
			<s:param name="bookid" value=""><%=bookid %></s:param>
			<s:param name="quantity"><%=quantity %></s:param>
		</s:action>
       <%response.sendRedirect("shoppingCart.jsp"); %>
</body>
</html>
