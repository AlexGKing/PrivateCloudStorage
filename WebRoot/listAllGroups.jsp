<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  <title>listGroups.jsp</title>
    <link href="js_css/yu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js_css/yu.js"></script>
  
 <script type="text/javascript">
  function intoGroup(gid){
  str = "<%=request.getContextPath()%>/GroupAction!openGroup?gId="+ gid;
	window.top.main.location = str;
  }
  function joinGroup(gid){
  str = "<%=request.getContextPath()%>/GroupAction!openGroup?gId="+ gid;
	window.top.main.location = str;
  }
 function showIcon(i){
  var d1=document.getElementById("operator"+i);
	var t1=document.getElementById("tr"+i);
  d1.style.display="";
  t1.style.backgroundColor="#f0f8fd";

 }
  function hiddenIcon(i){
  var d1=document.getElementById("operator"+i);
  var t1=document.getElementById("tr"+i);
  d1.style.display="none";
  t1.style.backgroundColor="#fff";
 }
</script>
  
  
 <style type="text/css">
table{
font: 12px normal Arial, Helvetica, sans-serif;
text-align:center;
margin:5px 0px 0px 0px;
}
th{
background: #f0f8fd;
boder:1px;
padding:3px;
height:32px;
}
td{
padding:3px;
}
h2{
padding:0px;
margin:0px;
font-family: "KaiTi", "Helvetica", "sans-serif","FangSong","DFKai-SB","MingLiU","Microsoft YaHei","SimHei", ;
}
</style>
</head>
<body >

<h2>其他共享群</h2>
<hr />
 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
 <% int i=0; %>
      <tr >
      <th height="32" bgcolor="#FFFFFF" width="30px" >序号</th>
        <th height="32" bgcolor="#FFFFFF" width="30%">群组名</th>
         <th height="32" bgcolor="#FFFFFF" >创建者</th>
        <th height="32" bgcolor="#FFFFFF" >用户数</th>
        <th height="32" bgcolor="#FFFFFF" width="300px">群简介</th>
      </tr>
 <c:forEach items="${otherGroups}" var="group">    
       <%i++; %>
      <tr onMouseover="showIcon(<%=i %>)" onMouseout="hiddenIcon(<%=i %>);"  id="tr<%=i%>">
      <td height="22" width="30px"><%=i %></td>
      <td height="22" align="left" >
      <span style="cursor:pointer;" onclick="joinGroup(${group.id})">
   		&nbsp;&nbsp;
   		<image src="image/groupIcon.png" width="30" height="30"  align="bottom">
   		</image>
		${group.groupName}</td>
    	<c:choose>
		<c:when test="${group.ownnerId==user.id}">
		<td height="22" >我</td>
		<td height="22" >${group.userCount}</td>
      	<td height="22" >
      	<div id="operator<%=i%>" style="display: none" >
      		<!--  【退出】
      	<a href="">【解散】</a>-->
      	${group.comment }
      	</div>
		</c:when>
		<c:otherwise>
		<td height="22" >${group.ownnerId}</td>
		<td height="22" >${group.userCount}</td>
      	<td height="22" width="300px">
      	<div id="operator<%=i%>" style="display: none" >
      		<!--  <a href="GroupAction!joinGroup?gId=${group.id}">【加入】</a>
      		【解散】-->
      			${group.comment }
     	</div>
		</c:otherwise>
		</c:choose>
      </td>
      </tr>
     </c:forEach>
    </table>
</body>
</html>