<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'left.jsp' starting page</title>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
	<script type="text/javascript">


		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('title');

		var myAccordion = new fx.Accordion(toggles, contents, {
			opacity : true,
			duration : 400
		});
		myAccordion.showThisHideOpen(contents[0]);
		
		
		
		function newFolder() {
			ui.prompt('请输入文件夹名称:', function(z) {
				if (z) {
					//ui.alert('你输入的信息是：' + z);
					str = "<%=request.getContextPath()%>/UserAction!newFolder?foldername="+ z;
				    window.top.main.location = str;
				} else {
					ui.alert('你没有输入信息！');
				}
			}, true);
			//当取消时 z===false
		}
		
		
		/*
		function newFolder() {
			var foldername = prompt("请输入文件夹名称:");
			document.write(foldername);
			if (foldername != null) {
				str = "/UserAction!newFolder?foldername="+ foldername;
				//window.location.href=str;
				window.top.main.location = str;
			}
		}*/
	</script>
	
	<style type="text/css">
	body {
	font-family: "Microsoft YaHei","SimHei", "KaiTi", "Helvetica", "sans-serif","FangSong","DFKai-SB","MingLiU",;
	margin:0px 0px 0px 0px;
	}
	 </style>
	
  </head>


<body bgcolor="#005d5f">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  >
<tr>
	<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" onClick="clickItem()" align="center">
	<tr>
	<td align="center">
	<br/> <br/> <br/>
	<div id="container">
		<H1 class="title"><A href="javascript:void(0)"><a href="main.jsp" target="main"><font size="4" color=#FFFFFF >首&nbsp;&nbsp;&nbsp;&nbsp;页</font></a></a></H1>
		<div class="content">
		</div>
		<p></p>
		<p></p>
		<H1 class="title"><A href="javascript:void(0)"><font size="4" color=#FFFFFF>用户管理</font></a></H1></H1>
		<div class="content">
			<p>&nbsp;&nbsp;<a href="userinfo.jsp" target="main"><font size="3" color=#FFFFFF>个人信息</font></a></p>
			<p>&nbsp;&nbsp;<a href="changepassword.jsp" target="main"><font size="3" color=#FFFFFF>修改密码</font></a></p>
		</div>
		<H1 class="title"><A href="javascript:void(0)"><a href="main.jsp" target="main"><font size="4" color=#FFFFFF>文件管理</font></a></a></H1>
		<div class="content">
			<p>&nbsp;&nbsp;<a href="uploadifyTest.jsp" target="main"><font size="3" color=#FFFFFF>文件上传</font></a></p>
			<p>&nbsp;&nbsp;<a href="GroupAction!listMyShareFile" target="main" ><font size="3" color=#FFFFFF>我的共享</font></a></p>
		</div>
		
		<H1 class="title"><A href="javascript:void(0)"><font size="4" color=#FFFFFF>共享群组</font></a></H1>
		
		<div class="content">
			<p>&nbsp;&nbsp;<a href="GroupAction!listGroups" target="main"><font size="3" color=#FFFFFF>共享群列表</font></a></p>
		    
		    <p>&nbsp;&nbsp;<a href="createGroup.jsp" target="main"><font size="3" color=#FFFFFF>创建共享群</font></a></p>
		</div>

		
	</div>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
	<script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('title');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
</body>
</html>
