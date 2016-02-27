<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'folderTreeTest.jsp' starting page</title>
	<link rel="stylesheet" href="zTree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="zTree/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="zTree/js/jquery.ztree.excheck-3.5.js"></script>
	
	<script type="text/javascript">
		var setting = {
			check : {
				enable : true,
				chkStyle : "radio",
				radioType : "all"
			},
			data : {
				simpleData : {
					enable : true
				}
			}
		};
		function getFolderTreeStr(str){
			window.zNodes=eval(str);
			return window.zNodes;
		}
		var fileid=<%=request.getParameter("fileid")%>;
		var opr=<%=request.getParameter("opr")%>;
		var code;
		function go(){
			var b1=document.getElementById("confirm");
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);		
			var folderid=nodes[0].id;
			if(opr=="move"){
				window.location.href="<%=request.getContextPath()%>/UserAction!moveFile?fileid="+fileid+"&folderid="+folderid;
			}else if(opr=="copy"){
				window.location.href="<%=request.getContextPath()%>/UserAction!copyFile?fileid="+fileid+"&folderid="+folderid;
			}else{
				window.location.href="<%=request.getContextPath()%>/GroupAction!colletFile?fileid="+fileid+"&folderid="+folderid;
			}
			//alert(nodes[0].name);
		}
		//alert("opr="+opr);
		function setCheck() {
			var type = $("#level").attr("checked") ? "level" : "all";
			setting.check.radioType = type;
			showCode('setting.check.radioType = "' + type + '";');
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		}
		function showCode(str) {
			if (!code)
				code = $("#code");
			code.empty();
			code.append("<li>" + str + "</li>");
		}
		$(document).ready(function() {
			setCheck();
			$("#level").bind("change", setCheck);
			$("#all").bind("change", setCheck);
		});
	</script>
  </head>
  <body>
<!--  <div class="content_wrap">-->
	<div class="zTreeDemoBackground center">
		<ul id="treeDemo" class="ztree"></ul>
		<input id="confirm" type="button" value="提交" onclick="go()">
	</div>


<script type="text/javascript">
getFolderTreeStr(${folderTreeStr});
</script>
<div>
</div>
  </body>
</html>
