<%@ page language="java" import="java.util.*,org.model.Book" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%

	Book book=(Book)request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<title>商品详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/another_style.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/imagezoom.js"></script>
<script type="text/javascript" src="js/memenu.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script type="text/javascript">
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
		menu_ul.hide();
		menu_a.click(function(e) {
			e.preventDefault();
			if (!$(this).hasClass('active')) {
				menu_a.removeClass('active');
				menu_ul.filter(':visible').slideUp('normal');
				$(this).addClass('active').next().stop(true, true).slideDown(
						'normal');
			} else {
				$(this).removeClass('active');
				$(this).next().stop(true, true).slideUp('normal');
			}
		});

	});
</script>
<script type="text/javascript">
	function editHref() {
		var number = document.getElementById("buyNumber").value;
		if (number >
<%=book.getNumber()%>
	) {
			alert("要购买的数量大于库存，请重新选择");
			return false;
		}
		document.getElementById("carthref").href = document
				.getElementById("carthref").href
				+ number;
	}
</script>
</head>
<body>
	<s:action name="catalogs" executeResult="true"></s:action>
	<s:action name="latestBooks" executeResult="false"></s:action>
	<div class="single">
		<div class="container">
			<div class="col-md-9">
				<div class="col-md-5 grid">
					<div class="flexslider">
						<ul class="slides">
							<%
								if (book.getPicture() != null & book.getPicture().length() > 0) {
									
							%>
							
							<li data-thumb="images/<%=book.getPicture()%>">
								<div class="thumb-image">
									<img src="images/<%=book.getPicture()%>" data-imagezoom="true"
										class="img-responsive"/>
								</div>
							</li>
							<%
								
								}
							%>
						</ul>
					</div>
				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para simpleCart_shelfItem">
						<h1><%=book.getBookname()%></h1>
						<p><%=book.getDescribed()%></p>
						<div class="star-on">
							<div class="review">
								<a>出版社：<%=book.getProducer()%></a> <br>
								 <a>库存：<%=book.getNumber()%></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<label class="add-to item_price"><%=book.getPrice()%>元</label>
						<div class="available">
							<h6>购买数量 :</h6>
							<input name="buyNumber" type="number" min="1" max=<%=book.getNumber()%>
								value="1" id="buyNumber">
						</div>
						<a id="carthref" href="addToCart.action?bookid=<%=book.getBookid()%>&quantity="
							class="cart item_add" onclick="return editHref()">加入购物车</a>
					</div>
				</div>
			</div>
			   <div class="col-md-3 product-bottom">
				<div class="product-bottom">
					<h3 class="cate">最新商品</h3>
					<%
						List books=(List)request.getAttribute("books");
						if ( books != null & books.size()> 0) {
						Iterator it=books.iterator();
							while(it.hasNext()) {
								Book latestBook=(Book)it.next();
								String bookHref = "readBook.action?bookid="
										+latestBook.getBookid();
								String bookPicture = "images/" + latestBook.getPicture();
								
					%>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href=<%=bookHref%> target="_blank"> <img
								class="img-responsive " src=<%=bookPicture%> alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href=<%=bookHref%> target="_blank"><%=latestBook.getBookname()%></a>
							</h6>
							<span class=" price-in1"> <%=latestBook.getPrice()%>元
							</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>