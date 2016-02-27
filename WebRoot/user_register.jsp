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
    
  <title>UCAS云盘 - 免费注册</title>

 
<script type="text/javascript" async="" src="./register_files/ga.js"></script>

<link type="text/css" rel="stylesheet"
	href="./register_files/pan-reg.src_datauri.css">


<link type="text/css" rel="stylesheet"
	href="./register_files/reg-common_datauri.css">



<script type="text/javascript" src="./register_files/1141.js"></script>
<!--  
<script>window.onerror = function(msg, jsurl, line){var s ="/resource/img/blank.gif?msg="+encodeURIComponent(msg)+'&jsurl='+encodeURIComponent(jsurl)+'&url='+encodeURIComponent(location)+'&line='+line+'&t='+Math.random();if(typeof Browser != 'undefined'){var _s = [];for(var i in Browser)_s.push(i+':"'+Browser[i]+'"');s += '&other='+encodeURIComponent('{'+_s.join(',')+'}');}var img = new Image();img.src=s;};var ypDomain = {web : '',api : '',qun: '',clusterid : ''};</script>
-->
</head>
<body>
	<div class="header clearfix">
		<div class="container">
			<a href="" class="logo1"><image src="image/logo_UCAS_white.png">
			<!--<font color="#FFFFFF" size="24" face="Cursive">UCAS云盘</font>  --></a>
			<div class="navbar">


				<div class="nav">
					<ul class="clearfix">
						<li><a href=""
							onclick=""
							target="_blank" class="gg">20G免费空间</a></li>
						<li><a href="">首页</a></li>
						<li><a href="">下载</a></li>
						<li><a href="http://www.ucas.ac.cn" target="_blank">国科大</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="main">
		<h1 class="reg-title">欢迎注册UCAS云盘</h1>
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
									class="ipt tipinput" tabindex="1"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
						</dd>
						
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="loginEmail">邮箱</label><span class="input-bg"><input
									type="text" id="email" name="email" maxlength="100"
									autocomplete="off" class="ipt tipinput" tabindex="2"></span><b
									class="icon-loginEmail icon-wrong"></b>
							</div>
							<!--  <span id="tips-loginEmail"
								class="text-tips tips-loginEmail reg-tips-wrong">请输入您的常用邮箱，<a
								target="_blank" class="fac"
								href="http://reg.email.163.com/mailregAll/reg0.jsp"> 没有邮箱？</a></span>-->
						</dd>
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="password">密码</label><span class="input-bg"><input
									type="password" id="password" name="password" autocomplete="off"
									class="ipt tipinput" tabindex="3"></span><b
									class="icon-password icon-wrong"></b>
							</div>
							<!--  <span id="tips-password"
								class="text-tips tips-password reg-tips-wrong">密码应为6-20个字符，（区分大小写）</span>-->
						</dd>
						<dd>
							<div class="quc-clearfix reg-item">
								<label for="rePassword">确认密码</label><span class="input-bg"><input
									type="password" id="rePassword" autocomplete="off"
									class="ipt tipinput" tabindex="4"></span><b
									class="icon-rePassword  icon-wrong"></b>
							</div>
							<!--  <span id="tips-rePassword"
								class="text-tips tips-rePassword reg-tips-wrong">两次输入的密码不一样，请重新输入</span>-->
						</dd>
						<!--  <dd class="rem" id="phraseLi" style="display: none;">
							<label for="phrase">验证码</label><span class="verify-code"><input
								type="text" maxlength="4" id="phrase" name="phrase"
								class="ipt1 tipinput" autocomplete="off" tabindex="5"></span><span
								class="yz"><img width="99" height="35"
								style="cursor: pointer;" id="wm"><a class="fac ml8"
								href="http://yunpan.360.cn/reg#nogo" id="refreshCaptcha">换一张</a></span><b
								class="icon-phrase"></b>
							<p class="phrase-tips">
								<span id="tips-phrase" class="tips-phrase">请输入图中的字母或数字，不区分大小写</span>
							</p>
						</dd>-->
						<dd class="submit">
							<input type="submit" onfocus="this.blur()" text="立即注册"
								id="regSubmitBtn" value="立即注册"
								class="btn-register quc-psp-gstat">
						</dd>
						<dd class="rules">
							<label style="" for="is_agree"><input type="checkbox"
								name="is_agree" id="is_agree" tabindex="5" checked="checked"
								value="1">我已经阅读并同意</label><a
								href="" class="fac"
								target="_blank">《用户服务条款》</a>
						</dd>
					</dl>
					<input id="srcreg" type="hidden" value="pcw_cloud" name="src"><input
						id="loginEmailActiveFlag" type="hidden" value="0"
						name="loginEmailActiveFlag"><input id="pageType"
						type="hidden" value="utf-8" name="charset"><input
						id="accoutType" type="hidden" value="1" name="acctype"><input
						id="pwdmethod" type="hidden" value="1" name="pwdmethod"><input
						id="proxy" type="hidden"
						value="http://yunpan.360.cn/psp_jump.html" name="proxy"><input
						id="topassword" type="hidden" value="" name="password"><input
						id="torePassword" type="hidden" value="" name="rePassword"><input
						id="callback" type="hidden"
						value="parent.QHPass.regUtils.submitCallback" name="callback"><input
						id="captchaFlag" type="hidden" value="0" name="captchaFlag"><input
						id="captchaAppId" type="hidden" value="i360" name="captchaAppId">
				</form>
			</div>
		</div>
		<div id="actPanel" style="display: none;">
			<form action="http://yunpan.360.cn/reg#"
				onsubmit="return comReg.checkAct();">
				<div class="phrase-box"></div>
				<input type="submit" text="立即激活云盘" value="立即激活云盘" class="act-submit">
				<div class="other-login">
					<a href="" onclick="return false;">用其它帐号登录</a>
				</div>
			</form>
			<p class="tips">请输入验证码激活云盘帐号</p>
		</div>
		<div id="autoPanel">
			<div class="auto-tip">激活云盘中...</div>
		</div>
	</div>

	<div class="wrap">
		<div class="footer">
			<p class="links">
				<a href=""
					target="_blank">使用协议</a> <a
					href="" target="_blank">隐私保护</a>
				<a href="">更新日志</a> <a
					href="">帮助中心</a> <a
					href=""
					target="_blank">问题反馈</a>
			</p>
			<p class="copyright">Copyright©2014 UCAS All Rights
				Reserved</p>
			<div class="follow-us">
				<a href="" class="item weixin"> <img class="qrcode"
					src="" alt="">
				</a> <span class="divider"></span> <a href=""
					class="item weibo" target="_blank"></a>
			</div>
		</div>
	</div>




</body>
</html>