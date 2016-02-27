<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<frameset rows="80,*,55" framespacing="0" border="no" frameborder="0">
	<frame src="top.jsp" name="top" scrolling="no">
	<frameset cols="180,*" framespacing="0">
		<frame src="left.jsp" name="left" scrolling="no">
		<frame src="main.jsp" name="main">
	</frameset>
	<frame src="bottom.jsp" name="bottom" scrolling="no">
</frameset>
</html>
