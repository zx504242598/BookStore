<%@ page language="java" import="java.util.*,org.vo.Cart,org.model.Orderitem,org.model.Book,org.model.User" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/another_style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/memenu.js"></script>
<script type="text/javascript" src="js/simpleCart.min.js"></script>
<script type="text/javascript">
	function confirmBuy() {
		return confirm("确定支付吗？");
	}
	function confirmDelete() {
		return confirm("确认删除订单吗");
	}
</script>
</head>
<body>
<%User user=(User)session.getAttribute("user");
if(user==null){
	response.sendRedirect("login.jsp");
}
 %>
	<s:action name="catalogs" executeResult="true"></s:action>
	<div class="container">
		<div class="check-out">
			<h1>所有订单</h1>
			<table>
				<tr>
					<th>商品</th>
					<th>数量</th>
					<th>价格</th>
					<th>总价</th>
					<th>操作</th>
				</tr>
				<%
					Cart cart=(Cart)session.getAttribute("cart");

					if (cart!= null&&user!=null) {
					Map<Integer, Orderitem>	items=(Map<Integer, Orderitem>)cart.getItems();
						for (Iterator it=items.values().iterator();it.hasNext(); ) {
							Orderitem orderitem=(Orderitem) it.next();
							Book book=orderitem.getBook();
							String picture="images/"+book.getPicture();
							
				%>
				<tr>
					<td class="ring-in"><a
						href="readBook.action?bookid=<%=book.getBookid()%>"
						class="at-in"> <img src="<%=picture%>"
							class="img-responsive" alt="">
					</a>
						<div class="sed">
							<h5>
								商品名：<%=book.getBookname()%></h5>
							<br>
							<%-- <p>
								加入购物车时间：<%=cart.getSdate()%></p> --%>
						</div>
						<div class="clearfix"></div></td>
					<td><%=orderitem.getQuantity()%></td>
					<td><%=book.getPrice()%>元</td>
					
					<td><%=orderitem.getTotal()%>元</td>
					<td><a
						href="deleteCart.action?bookid=<%=book.getBookid() %>"
						onclick="return confirmDelete()">删除</a></td>
				</tr>
				<%
					}
					
				%>
			</table>
			<p>收货地址:<%=user.getAddress() %>
			&nbsp;&nbsp;&nbsp;
			<a href="jsp/showMessage.jsp">修改</a>
			<br/><br/>
			<a >总计：<%=cart.getTotalPrice()%>元</a> 
			<%}
			 %>
			&nbsp;&nbsp;&nbsp;
		   <%
				if (cart!= null&&user!=null ) {
			%>
			<a href="checkout.action" class="to-buy"
				onclick="return confirmBuy()">&nbsp;&nbsp;&nbsp;支付&nbsp;&nbsp;&nbsp;</a>
			<%
				}%>
		</div>
	</div>
</body>
</html>