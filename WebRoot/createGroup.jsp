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
    
  <title>UCAS云盘 - 修改密码</title>
<script type="text/javascript">
	function Go() {
		var form = document.getElementById("form1");
		var gn = document.getElementById("groupName");
		var gc = document.getElementById("groupComment");
		if (gn.value!= null) {
			form.action = "GroupAction!createGroup";
			form.submit();
		}
	}
</script>

<script type="text/javascript" async="" src="./register_files/ga.js"></script>

<link type="text/css" rel="stylesheet"
	href="./register_files/pan-reg.src_datauri.css">

<link type="text/css" rel="stylesheet"
	href="./register_files/reg-common_datauri.css">

<script type="text/javascript" src="./register_files/1141.js"></script>
</head>
<c:choose>
   	<c:when test="${msg!=null}">
   		<body onload="alert('${msg}')">
   	</c:when>
   	<c:otherwise>
   		<body>
   	</c:otherwise>
</c:choose>
	<div id="main">
		<h1 class="reg-title">创建共享群</h1>
		<div id="reg">
			<div id="modRegWrap" class="mod-qiuser-pop">
				<iframe src="" name="qucpspregIframe" style="display:none"></iframe>
				<form  method="post" id="form1">
					<dl class="reg-wrap">
						<dt>
							<span id="qucRegGuide"></span>
							<div id="regGlobal_tips"
								class="reg-global-error reg-global-success reg-global-loading"></div>
						</dt>
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">群名称：</label>
								<span class="input-bg">
								<input
									type="text" id="groupName" name="groupName" autocomplete="off"
									class="ipt tipinput" tabindex="1" value="" >
									</span>
									<b class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">群简介：</label>
									<textarea rows="4" cols="55" id="groupComment" name="groupComment">
									</textarea>
									</span><b class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						<div class="submit">
							<input type="button" onfocus="this.blur()" text="提交"
								 value="提交" onclick="Go()">
								<input type="reset" onfocus="this.blur()" text="重置"
								 value="重置"
								>
							</div>
							<dd>
							</dd>

					</dl>
		
				</form>
			</div>
		</div>

		</div>

	</div>
			
</body>
</html>
