<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Upload Successfully Page</title>
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
   		<br />
   		<br />
   		<br />
   		<h1>Congratulation! </h1>
   		<h2>The files has been uploaded successfully!</h2> 
   		<br />
   		<br />
   		<a href="<%=basePath%>/UserAction!listfiles">[Go Home]</a>
   		<a href="<%=basePath%>/PrivateCloudStorage/uploadfile.jsp">[Upload Continue...]</a>
   		
   		<br />
   		<br />
   		<br />
   		<br />
   		<br />
   		<br />
   		<br />
   		<pre>
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		</pre>
   		<h1>UCAS YunPan</h1>
   </center>
  </body>
</html>
