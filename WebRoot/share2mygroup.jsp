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
    <title>文件共享至</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	function ck(){
		 var value ="";
		$("input:checked[name=cb]").each(function(){
			value += $(this).val()+" "; 
		});
		alert(value);
	}
</script>
  </head>
  
  <body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"   >
	<tr>
		<td></td>
		<td>群名称</td>
	</tr>
 <c:forEach items="${myGroups}" var="myGroup">
	<tr>
		<td>	
			<input type="checkbox" name="cb" value="${myGroup.groupName}" onchange="ck();">
		</td>
		<td>${myGroup.groupName}</td>
	</tr>
 </c:forEach>

</table>
  </body>
</html>
