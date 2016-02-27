<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'loginsuccessed.jsp' starting page</title>

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
	<br /> <br />
	<h1>Welcome to UCAS PrivateCloudStorage!</h1>
	<hr>
	<form action="UploadFileAction!execute" method="post"
		enctype="multipart/form-data">
		请选择需要上传的文件：<input type="file" multiple id="dofile" name="file" /><br />
		<input type="submit" id="btnupload" name="btnupload" value="开始上传">
	</form>


</center>
</body>
</html>
