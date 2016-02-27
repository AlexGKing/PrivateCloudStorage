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
#biaoti{
padding:0px;
margin:0px;
font-family: "KaiTi", "Helvetica", "sans-serif","FangSong","DFKai-SB","MingLiU","Microsoft YaHei","SimHei", ;
}
</style>

<script type="text/javascript">

function intoGroup(gid){
str="<%=request.getContextPath() %>/GroupAction!openGroup?gId="+gid;
 window.location.href=str;
}



function joinGroup(gid){
str="<%=request.getContextPath() %>/GroupAction!joinGroup?gId="+gid;
ui.confirm('你确定要加入该群组吗?',function(z){
        if(z){
                //ui.success('删除成功！');
                 //a1.href="GroupAction!dimissGroup?gId="+gid;    
                 window.location.href=str;
        }else{
                //ui.alert('没有删除！');      
        }
},true);
}



function dimissConfirm(i,gid){
var a1=document.getElementById("a"+i);
str="<%=request.getContextPath() %>/GroupAction!dimissGroup?gId="+gid;
ui.confirm('你确定要解散该群组吗?这将删除有关该群组的所有记录！',function(z){
        if(z){
                //ui.success('删除成功！');
                 //a1.href="GroupAction!dimissGroup?gId="+gid;    
                 window.location.href=str;
        }else{
                //ui.alert('没有删除！');      
        }
},true);
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
 
  function othershowIcon(j){
  var d2=document.getElementById("comment"+j);
	var t2=document.getElementById("othertr"+j);
  d2.style.display="";
  t2.style.backgroundColor="#f0f8fd";
 }
  function otherhiddenIcon(j){
  var d2=document.getElementById("comment"+j);
  var t2=document.getElementById("othertr"+j);
  d2.style.display="none";
  t2.style.backgroundColor="#fff";
 }
 
 
</script>
</head>
<body>
<h2 id="biaoti">我的共享群</h2>
<hr />
 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
 <% int i=0; %>
      <tr >
      <th height="32" bgcolor="#FFFFFF" width="30px">序号</th>
        <th height="32" bgcolor="#FFFFFF" width="30%">群组名</th>
         <th height="32" bgcolor="#FFFFFF" >创建者</th>
        <th height="32" bgcolor="#FFFFFF" >用户数</th>
        <th height="32" bgcolor="#FFFFFF" width="200px" >操作</th>
      </tr>
 <c:forEach items="${myGroups}" var="myGroup">
      <%i++; %>
      <tr onMouseover="showIcon(<%=i %>)" onMouseout="hiddenIcon(<%=i %>);"  id="tr<%=i%>">
      <td height="22" ><%=i %></td>
    <td height="22" align="left">
    <span style="cursor:pointer;" onclick="intoGroup(${myGroup.id})">
   	&nbsp;&nbsp;
   	<image src="image/groupIcon.png" width="30" height="30"  align="bottom"></image>
    ${myGroup.groupName}
    </span>
    </td>

    		<c:choose>
		<c:when test="${myGroup.ownnerId==user.id}">
		<td height="22" >我</td>
		<td height="22" >${myGroup.userCount}</td>
      	<td height="22" >
      	<div id="operator<%=i%>" style="display: none" >
      		【退出】
      	<span style="cursor:pointer; color:blue;"><a onclick="dimissConfirm(<%=i%>,${myGroup.id})"  id="a<%=i%>">【解散】</a></span>
      	</div>
		</c:when>
		<c:otherwise>
		<td height="22" >${myGroup.ownnerId}</td>
		<td height="22" >${myGroup.userCount}</td>
      	<td height="22" >
      	<div id="operator<%=i%>" style="display: none" >
      		<a  href="GroupAction!exitGroup?gId=${myGroup.id}">【退出】</a>
      		【解散】
     	</div>
		</c:otherwise>
		</c:choose>
      </td>
      </tr>
     </c:forEach>
    </table>
     <hr />
    
    
    <br />
 <br />
<h2>其他共享群</h2>
<hr />
 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
 <% int j=0; %>
      <tr >
      <th height="32" bgcolor="#FFFFFF" width="30px" >序号</th>
        <th height="32" bgcolor="#FFFFFF" width="30%">群组名</th>
         <th height="32" bgcolor="#FFFFFF" >创建者</th>
        <th height="32" bgcolor="#FFFFFF" >用户数</th>
        <th height="32" bgcolor="#FFFFFF" width="300px">群简介</th>
      </tr>
 <c:forEach items="${otherGroups}" var="group">    
       <%j++; %>
      <tr onMouseover="othershowIcon(<%=j %>)" onMouseout="otherhiddenIcon(<%=j %>);"  id="othertr<%=j%>">
      <td height="22" width="30px"><%=j %></td>
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
      	<div id="operator<%=j%>" style="display: none" >
      	${group.comment }
      	</div>
		</c:when>
		<c:otherwise>
		<td height="22" >${group.ownnerId}</td>
		<td height="22" >${group.userCount}</td>
      	<td height="22" width="300px">
      	<div id="comment<%=j%>" style="display: none" >
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