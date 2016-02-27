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
  <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
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

	var fileid=<%=request.getParameter("fileid")%>;
	function ck(){
	
		 var value ="";
		$("input:checked[name=cb]").each(function(){
			value += $(this).val()+" "; 
		});
		//alert(value);
		str="<%=request.getContextPath() %>/GroupAction!shareFile?fileid="+fileid+"&groupIds="+value;
		window.location.href=str;
	}

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
<h1 id="biaoti">共享至. . .</h1>
<hr />
<%int i=0; %>
	<table width="100%" border="0" cellpadding="0" cellspacing="0"
		bgcolor="#ffffff">
		<tr>
			<th height="32" bgcolor="#FFFFFF" width="50px">选择</th>
			<th height="32" bgcolor="#FFFFFF" width="">群组名</th>
		</tr>
		<c:forEach items="${myGroups}" var="myGroup">
			<%i++; %>
			<tr onMouseover="showIcon(<%=i %>)" onMouseout="hiddenIcon(<%=i %>);"
				id="tr<%=i%>">
				<td><input type="checkbox" name="cb"
					value="${myGroup.id}" "></td>
				<td height="22" align="left"><image src="image/groupIcon.png"
						width="30" height="30" align="bottom"></image>
					${myGroup.groupName} </span></td>
			</tr>
		</c:forEach>
	</table>
	<hr />
	<input type="button" id="submit" name="submit" value="提交" align="center" onclick="ck();">
</body>
</html>