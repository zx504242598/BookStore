<%@page import="org.model.Catalog"%>
<%@page import="java.util.*,org.model.*"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%User user=(User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/another_style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/responsiveslides.min.js"></script>
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script type="text/javascript">
	function key() {
		return confirm("确定退出吗？");
	}
</script>
<%-- <script>
	function showtime() {
		var myDate = new Date();
		document.getElementById("time").innerHTML = myDate.getHours() + "点"
				+ myDate.getMinutes() + "分" + myDate.getSeconds() + "秒";
		setTimeout("showtime()", 1000);
	}
</script> --%>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="col-sm-4 world">
					<ul>
						<li></li>
					</ul>
				</div>
				<div class="col-sm-4 logo">
					<a href="index.jsp"><img src="images/logo.png" alt=""></a>
				</div>
				<div class="col-sm-4 header-left">
					<p class="log">
						<%
							if (user!= null) {
												out.print("<a href=\"jsp/showMessage.jsp\" target=\"_blank\">" + user.getUsername() + "</a>");
												out.print("<a href=\"logout.action\" onClick=\"return key()\">"
														+ "注销" + "</a>");
											} else {
												out.print("<a href=\"jsp/login.jsp\">登录</a>");
												out.print("<a>or</a>");
												out.print("<a href=\"jsp/register.jsp\">注册</a>");
											}
						%>
						<%-- <a id="time"><script type="text/javascript">
							showtime();
						</script> </a> --%> 
					</p>
					<div class="cart box_1">
						<a href="jsp/shoppingCart.jsp"> <img src="images/cart.png"
							alt="" />
							<h3>购物车</h3>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="col-sm-8 h_menu4">
					<ul class="memenu skyblue">
						<li class=" grid"><a href="index.jsp">首页</a></li>
						<li><a>分类</a>
							<div class="mepanel">
								<div class="row">
									<%	
										List list=(List)request.getAttribute("catalogs");
	 								 	Iterator it=list.iterator();
											while(it.hasNext()){
											Catalog catalog=(Catalog)it.next();								
									%>
									  <s:action name="browseBook" executeResult="flase">
    	                            <s:param name="catalogid" ><%=catalog.getCatalogid()%></s:param>
   									 </s:action>
 									  <div class="col1">
										<div class="h_nav">
											<h4><%=catalog.getCatalogname()%></h4>
											<ul>
												<%
													List books=(List)request.getAttribute("books");
													Iterator i=books.iterator();
													while(i.hasNext()){
														Book book=(Book)i.next();
														
																	
												%>
												<li><a
													href="readBook.action?bookid=<%=book.getBookid()%>"
													target="_blank"><%=book.getBookname()%></a></li>
												<%
													}
																
												%>
											</ul>
										</div>
									</div>
									<%
										}
											
										
									%>
								</div>
							</div></li>
						<li><a href="jsp/shoppingCart.jsp">购物车</a></li>
						<li><a href="jsp/alreadyBuy.jsp">已购买</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>