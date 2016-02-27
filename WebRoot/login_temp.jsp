<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="alexking.domain.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Welcome to UCAS YunPan --Login</title>
</head>
<c:choose>
	<c:when test="${msg!=null}">
		<body onload="alert('${msg}')">
	</c:when>
	<c:otherwise>
		<body>
	</c:otherwise>
</c:choose>
<center>
	<h1>Welcome to UCAS YunPan!</h1>
	<hr />
	<form action="<%=basePath%>UserAction!login" method="post">
		UserName:<input type="text" name="user.userName" id="userName" />
		Password:<input type="password" name="user.password" id="password" />
		<br /> <input type="submit" value="Go" id="submit" name="submit" />
		<input type="reset" value="Reset" id="reset" name="reset" />
	</form>
	<br />
	<a href="user_register.jsp">Go Register</a>
</center>
</body>
</html>
