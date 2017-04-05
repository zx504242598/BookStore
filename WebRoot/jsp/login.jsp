<%@ page language="java" pageEncoding="utf-8"%>
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
<title>用户登录</title>
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
</head>
<body>
	<h1>登录</h1>
	<div id="regist-main">
		<form id="registForm" action="lo.action" method="post">
			<ol>
				<li><label for="username"> </label>
				<li><label for="username"> </label>
				<li><label for="username">用户名： <span
						class="kitjs-validator" for="@username"
						rules="[{notNull:true, message:'用户名不能为空'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="uname"
					data-valmsg-replace="true"></span> <input id="uname" name="username"
					type="text" value=""></li>
				<li><label for="username"> </label>
				<li><label for="username"> </label>
				<li><label for="password">密码： <span
						class="kitjs-validator" for="@password"
						rules="[{notNull:true, message:'密码不能为空'},{minLength:'6',message:'密码长度最短为6位'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="password"
					data-valmsg-replace="true"></span> <input id="passwd" name="password"
					type="password"></li>
			</ol>
			<div class="registError"></div>
			<input type="submit" value="登录" class="btn-submit">
		</form>
	</div>
</body>
</html>