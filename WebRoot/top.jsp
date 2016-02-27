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
    
    <title>My JSP 'top.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	
	<style>
#sddm
{	margin: 2px  30px  55px;
	padding: 0;
	z-index: 10000;
	background-color:#F4F4F4;
	width: 50px;
	height:10px;}

#sddm li
{	margin:0;
	z-index: 10000;
	padding: 0;
	list-style: none;
	float: left;
	font: bold 12px arial}

#sddm li a
{	display: block;
	z-index: 10000;
	margin: 0 1px 0 0;
	padding: 4px 10px;
	width: 60px;
	background: #5970B2;
	color: #FFF;
	text-align: center;
	text-decoration: none}

#sddm li a:hover
{	background: #49A3FF}

#sddm div
{	position: absolute;
	z-index: 10000;
	visibility: hidden;
	margin: 0;
	padding: 0;
	background: #EAEBD8;
	border: 1px solid #5970B2}

	#sddm div a
	{	position: relative;
		display: block;
		margin: 0;
		padding: 5px 10px;
		width: auto;
		white-space: nowrap;
		text-align: left;
		text-decoration: none;
		background: #EAEBD8;
		color: #2875DE;
		font: 12px arial}

	#sddm div a:hover
	{	background: #49A3FF;
		color: #FFF}
</style>
<!-- dd menu -->
<script type="text/javascript">
<!--
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 
// -->
</script>
  </head>
  <body  background="image/topbg1.png">
   <div align="left" valign="bottom">
  				 <image src="image/logo_UCAS_white.png" align="left">
  				 <!-- <span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!newFolder'">${user.userName }</span>
            	<span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.open('<%=request.getContextPath() %>/UserAction!uploadFile');"><image src="image/uploadButton.png"></span> 
                <span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!logout'"><image src="image/logoutButton.png"></span>-->
   </div>
 
  
   
   <div align="right" valign="bottom">
   <ul id="sddm">
	<li><a href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()">${user.userName }</a>
		<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
		<a href="userinfo.jsp" target="main">个人资料</a>
		<a href="<%=request.getContextPath() %>/UserAction!logout" target=top>注销</a>
		</div>
	</li>
</ul>
</div>
   
 <hr>
  </body>
</html>
