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
    
  <title>UCAS云盘 - 用户信息</title>

 
<script type="text/javascript" async="" src="./register_files/ga.js"></script>

<link type="text/css" rel="stylesheet"
	href="./register_files/pan-reg.src_datauri.css">
<link type="text/css" rel="stylesheet"
	href="./register_files/reg-common_datauri.css">



<script type="text/javascript" src="./register_files/1141.js"></script>

<script>window.onerror = function(msg, jsurl, line){var s ="/resource/img/blank.gif?msg="+encodeURIComponent(msg)+'&jsurl='+encodeURIComponent(jsurl)+'&url='+encodeURIComponent(location)+'&line='+line+'&t='+Math.random();if(typeof Browser != 'undefined'){var _s = [];for(var i in Browser)_s.push(i+':"'+Browser[i]+'"');s += '&other='+encodeURIComponent('{'+_s.join(',')+'}');}var img = new Image();img.src=s;};var ypDomain = {web : '',api : '',qun: '',clusterid : ''};</script>
</head>
<body>
	<div id="main">
		<h1 class="reg-title">个人信息</h1>
		<div id="reg">
			<div id="modRegWrap" class="mod-qiuser-pop">
				<iframe src="" name="qucpspregIframe" style="display:none"></iframe>
				<form action="UserAction!register" method="post">
					<dl class="reg-wrap">
						<dt>
							<span id="qucRegGuide"></span>
							<div id="regGlobal_tips"
								class="reg-global-error reg-global-success reg-global-loading"></div>
						</dt>
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">用户名</label><span class="input-bg"><input
									type="text" id="userName" name="userName" autocomplete="off"
									class="ipt tipinput" tabindex="1" value="${user.userName }" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">邮箱</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="2" value="${user.email }" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						
						
							<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">空间容量</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="3" value="${user.space } KB" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						
						
						
						
								<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">已用容量</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="4" value="${user.usedSpace } KB" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
								<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">创建时间</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="5" value="${user.createTime }" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>

								<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">文件数</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="6" value="${user.fileCount }" readonly="true"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
	
					</dl>
					
				</form>
			</div>
		</div>

		</div>

	</div>
</body>
</html>
