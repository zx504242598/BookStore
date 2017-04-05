<%@ page language="java" import="org.model.*,java.util.*" pageEncoding="utf-8"%>
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
<title>已购买</title>
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
		return confirm("确定支付订单吗？");
	}
</script>
</head>
<body>
	<s:action name="catalogs" executeResult="true"></s:action>
	<s:action name="alreadyBuy" executeResult="false"></s:action>
	<div class="container">
		<div class="check-out">
			<h1>购买历史</h1>
			<table>
				<tr>
					<th>商品</th>
					<th>数量</th>
					<th>价格</th>
					<th>总价</th>
					<th>购买时间</th>
					<th>收货地址</th>
				</tr>
				<%
					List orderList=(List)request.getAttribute("orderList");
					if (orderList != null & orderList.size() > 0) {
						Iterator it=orderList.iterator();
						while(it.hasNext()){
							Orders orders=(Orders)it.next();
							Integer orderId=orders.getOrderid();
							Date orderDate=orders.getOrderdate();
							Set orderitems=orders.getOrderitems();
							String address=orders.getAddress();
							Iterator it1=orderitems.iterator();
							while(it1.hasNext()){
							Orderitem orderitem=(Orderitem)it1.next();
							Book book=orderitem.getBook();
							
							String picture = "images/" + book.getPicture();
							Integer price =book.getPrice();
							Integer quantity=orderitem.getQuantity();
							int totalPrice = quantity * price;
							
				%>
				<tr>
					<td class="ring-in"><a
						href="readBook.action?bookid=<%=book.getBookid()%>"
						class="at-in"> <img src="<%=picture%>"
							class="img-responsive" alt="">
					</a>
						<div class="sed">
							<h5>
								<%=book.getBookname()%></h5>
							<br>
						</div>
						<div class="clearfix"></div></td>
					<td><%=quantity%></td>
					<td><%=price%>元</td>

					<td><%=totalPrice%>元</td>
					<td><%=orderDate%></td>
					<td><%=address%></td>
				</tr>
				<%
					}
					}
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>