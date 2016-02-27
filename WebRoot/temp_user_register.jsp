<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<head>
<base href="<%=basePath%>">

<title>UserRegister</title>
</head>
<body>

	<h2>用户注册</h2>
	<hr>
	<center>
	<form action="UserAction!register" method="post">
		<table width="50%" border="1" cellpadding="0"
			bordercolorlight="#999999" bordercolordark="#FFFFFF" cellspacing="0"
			align="center" class="add_table">
			<tr>
				<th align="right">用户名：</th>
				<td><input type="text" name="userName" /></td>
			</tr>

			<tr>
				<th align="right">密码：</th>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<th align="right">确认密码：</th>
				<td><input type="password" name="repassword" /></td>
			</tr>
			<tr>
				<th align="right">电子邮箱：</th>
				<td><input type="text" name="e-mail" /></td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="提交" /> <input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>
