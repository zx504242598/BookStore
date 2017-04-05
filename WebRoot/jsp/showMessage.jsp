<%@ page language="java" import="org.model.User" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	User user=(User) session.getAttribute("user");
	if(user==null) response.sendRedirect("index.jsp");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="js/kit.js"></script>
<!--[if IE]>
		<script src="js/ieFix.js"></script>
		<![endif]-->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-30210234-1' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
<script src="js/dom.js"></script>
<script src="js/form.js"></script>
<link rel="stylesheet" href="css/css.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/validator.css" />
<!--validator-->
<script src="js/validator.js"></script>
<script src="js/autowired.validator.js"></script>
<style>
table td {
	font-size: 19px;
}

label {
	cursor: pointer;
	margin-right: 1em;
}
</style>

<script type="text/javascript">
	function editInfo() {
		if (document.getElementById("submit").value == "编辑个人信息") {
			document.getElementById("email").disabled = false;
			document.getElementById("password").disabled = false;
			document.getElementById("address").disabled = false;
			document.getElementById("submit").value = "确认修改";
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<h1>个人信息</h1>
	<div id="regist-main">
		<form id="registForm" action="updateUser.action" method="post">
			<ol>

				<li><label for="username">用户名： <span
						class="kitjs-validator" for="@username"
						rules="[{notNull:true, message:'用户名不能为空'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="username"
					data-valmsg-replace="true"></span> <input id="username"
					name="username" type="text" value="<%=user.getUsername()%>"
					disabled="true"></li>

				<label></label>



				<li><label for="password">密码： <span
						class="kitjs-validator" for="@password"
						rules="[{notNull:true, message:'密码不能为空'},{minLength:'6',message:'密码长度最少为6位'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="password"
					data-valmsg-replace="true"></span> <input id="password"
					name="password" type="password" value="<%=user.getPassword()%>"
					disabled="true"></li>

				<label></label>
					
				<li><label for="email">邮箱地址： <span
						class="kitjs-validator" for="@email"
						rules="[{notNull:true, message:'电子邮件不能为空'},{isEmail:true,message:'电子邮件格式不正确'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="email"
					data-valmsg-replace="true"></span> <input id="email" name="email"
					type="text" value="<%=user.getEmail()%>" disabled="true"></li>

				<label></label>
				<li><label for="address">收货地址： <span
						class="kitjs-validator" for="@address"
						rules="[{notNull:true, message:'收货地址不能为空'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="address"
					data-valmsg-replace="true"></span> <input id="address" name="address"
					type="text" value="<%=user.getAddress()%>" disabled="true"></li>

				<label></label>

			</ol>
			<div class="registError"></div>
			<input id="submit" type="submit" value="编辑个人信息" class="btn-submit"
				onclick="return editInfo()">
		</form>
	</div>
</body>
</html>