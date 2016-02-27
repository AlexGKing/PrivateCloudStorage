<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<meta name="renderer" content="webkit">



<title>UCAS 云盘</title>
<script type="text/javascript" async="" src="./360index_files/ga.js"></script>
<script type="text/javascript" async="" src="./360index_files/ga(1).js"></script>
<script>var G_start_time = new Date;</script>

<!--[if (lt IE 8.0)]><link type="text/css" rel="stylesheet" href="http://s7.qhimg.com/static/d2d18818ed2f03f2/index.src.css"><![endif]-->
<!--[if (!IE)|(gte IE 8.0)]><!-->
<link type="text/css" rel="stylesheet"
	href="./360index_files/index.src_datauri.css">
<!--<![endif]-->


<script type="text/javascript" src="./360index_files/1141.js"></script>


<!--[if lt IE 9]>
<script type="text/javascript">(function(){
	var e = "abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output,progress,section,time,video".split(','),
		i=0,
		length=e.length;
		while(i<length){
			document.createElement(e[i++])
		}
	})();</script>
<![endif]-->
<script>window.onerror = function(msg, jsurl, line){var s ="/resource/img/blank.gif?msg="+encodeURIComponent(msg)+'&jsurl='+encodeURIComponent(jsurl)+'&url='+encodeURIComponent(location)+'&line='+line+'&t='+Math.random();if(typeof Browser != 'undefined'){var _s = [];for(var i in Browser)_s.push(i+':"'+Browser[i]+'"');s += '&other='+encodeURIComponent('{'+_s.join(',')+'}');}var img = new Image();img.src=s;};var ypDomain = {web : '',api : '',qun: '',clusterid : ''};</script>
</head>

<c:choose>
	<c:when test="${msg!=null}">
		<body onload="alert('${msg}')"   youdao="bind">
	</c:when>
	<c:otherwise>
		<body  youdao="bind">
	</c:otherwise>
</c:choose>


	<div class="header clearfix">
		<div class="container">
			<a href="">
				<!-- <font color="#FFFFFF" size="24" face="Cursive">UCAS</font>
				<font color="#FFFFFF" size="24" face="华文行楷">云盘</font> -->
				<image src="image/logo_UCAS_white.png">
			</a>
			<div class="navbar">
				<div class="nav">
					<ul class="clearfix">
						<li><a href=""
							onclick="try{monitor.btnLog(&#39;36T&#39;)}catch(e){}"
							target="_blank" class="gg">20G免费空间</a></li>
						<li><a
							href="">首页</a>
						</li>
						<li><a href="">下载</a></li>
						<li><a href="http://www.ucas.ac.cn" target="_blank">国科大</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>if(top !== self){
		top.location = location.href;
	}	
	var startTime = new Date(),
		loginInitTime;</script>

	<script type="text/javascript"
		src="./360index_files/index-login.src.js"></script>

	<div class="slide-wrap">
		<div class="container">
			<div class="slide-box" style="left: -674.754172px;">
				<div class="slide" style="left: 0px;">
					<img src="./image/tu3.png" alt=""
						width="800" height="360"> 
				</div>
				<div class="slide" style="left: 0px;">
					<img src="./image/tu2.png" alt=""
						width="800" height="360"> 
				</div>
				<div class="slide" style="left: 0px;">
					<img src="./image/tu1.png" alt=""
						width="800" height="360"> 
				</div>

			</div>
			<div class="slide-point-box">
				<span class="" data-index="0" ></span>
				 <span class="" data-index="1" > </span>
				 <span class="" data-index="2" class="cur-point"></span>
			</div>
			<div class="login-panel login-tab">
				<h1>欢迎使用UCAS云盘！</h1>
				<div id="login">
					<div id="modLoginWrap" class="mod-qiuser-pop">
						<div class="login-error login-error-msg" style="display: none;"></div>
						<iframe style="display:none" name="loginiframe"></iframe>
						<form action="<%=basePath%>UserAction!login" method="post">
							<dl class="login-wrap">
								<dt>
									<span id="loginTitle"></span>
									<div id="infobarNoCookie" class="noCookie"
										style="display: block;">
										浏览器已禁止设置cookie，无法正常登录，请<a
											href="http://i.360.cn/help/opencookie" target="_blank">
											启用cookie </a>?
									</div>
								</dt>
								<dd>
									<div class="quc-clearfix login-item">
										<label for="loginAccount">帐号</label><span
											class="input-bg-focus"><input placeholder="请输入用户名"
											type="text" tabindex="1" id="userName" name="user.userName"
											autocomplete="off" maxlength="100" class="ipt tipinput1"></span><b
											class="tips-wrong icon-loginAccount"></b><span
											id="tips-loginAccount" class="tips-msg "></span>
									</div>
								</dd>
								<dd class="password">
									<div class="quc-clearfix login-item">
										<label for="lpassword">密码</label><span class="input-bg"><input
											placeholder="请输入您的密码" type="password" tabindex="2"
											id="password" name="user.password" maxlength="20"
											autocomplete="off" class="ipt tipinput1"></span><b
											class="tips-wrong icon-lpassword"></b><span
											id="tips-lpassword" class="tips-msg"></span>
									</div>
								</dd>
								<dd class="find">
									<label for="iskeepalive"><input type="checkbox"
										tabindex="4" name="iskeepalive" id="iskeepalive"
										checked="checked"> 下次自动登录</label><a
										href="http://i.360.cn/findpwd/" target="_blank" class="fac"
										id="findPwd">忘记密码？</a>
								</dd>
								<dd class="rem" id="phraseLoginwarp" style="display:none">
									<label for="phraseLogin">验证码</label><span class="verify-code"><input
										type="text" tabindex="3" maxlength="4" placeholder="验证码"
										id="phraseLogin" name="phrase" class="ipt1 tipinput1"
										autocomplete="off"></span><span class="yz"><img
										width="99" height="35" id="lwm" title="点击更换图片"><a
										class="ml8 fac"
										href="file:///C:/Users/Administrator/Desktop/HDFS%E2%80%94NetDisk/360%E4%BA%91%E7%9B%98%20-%20%E5%AE%89%E5%85%A8%E5%85%8D%E8%B4%B9%20%E6%97%A0%E9%99%90%E7%A9%BA%E9%97%B4.htm#nogo"
										id="refreshCaptchaLogin">换一张</a></span>
									<p>
										<b class="tips-wrong  icon-phraseLogin"></b><span
											id="tips-phraseLogin" class="tips-phrase">请输入图中的字母或数字，不区分大小写</span>
									</p>
								</dd>
								<dd class="submit">
									<span><input type="submit" onfocus="this.blur()"
										id="loginSubmit" value="登录" class="btn-login quc-psp-gstat"><a
										href=""
										class="fac reg-new-account">注册新帐号</a></span>
								</dd>
								<dd class="global-tips">
									<div id="error_tips" class=""></div>
								</dd>
							</dl>
						</form>
					</div>
				</div>
				<div class="change">
					<a href="user_register.jsp">注册账号</a>
				</div>
			</div>
		</div>
	</div>
<div class="wrap">
		<div class="download-list">
			<ul class="clearfix">
				<li><a class="wangpan" href=""
					onclick="try{monitor.btnLog(&#39;indexpcdownload&#39;)}catch(e){}"><i
						class="icon"></i><span class="text">PC客户端</span></a></li>

				<li><a class="android" href=""
					onclick="try{monitor.btnLog(&#39;indexandroiddownload&#39;)}catch(e){}"><i
						class="icon"></i><span class="text">Android版</span></a></li>
				<li><a class="iphone"  href=""
					onclick="try{monitor.btnLog(&#39;indexiphonedownload&#39;)}catch(e){}"><i
						class="icon icon-iphone"></i><span class="text">iOS版</span></a></li>				
		
			</ul>
		</div>
	</div>
	</div>
	<div class="mask videoslide-mask" tabindex="-1" unselectable="on"
		style="z-index: 10; display: none;"></div>

	<div class="videoslide-main" style="display:none">
		<div class="videoslide">
			<embed src="" allowfullscreen="true" quality="high" width="640"
				height="360" align="middle" allowscriptaccess="always"
				flashvars="uu=789b624579&amp;vu=927a026566&amp;auto_play=1&amp;gpcflag=1&amp;width=640&amp;height=360"
				type="application/x-shockwave-flash">
		</div>
		<div class="close"></div>
	</div>


	<div class="wrap">
		<div class="footer">
			<p class="links">
				<a href="" target="_blank">使用协议</a> <a href="" target="_blank">隐私保护</a>
				<a href="">更新日志</a> <a href="">帮助中心</a> <a href="" target="_blank">问题反馈</a>
			</p>
			<p class="copyright">Copyright©2014 UCAS All Rights Reserved
			</p>
			<div class="follow-us">
				<a href="" class="item weixin"> <img class="qrcode"
					src="image/erweima.png" alt="">
				</a> <span class="divider"></span> <a href="" class="item weibo"
					target="_blank"></a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="./360index_files/index.src.js"></script>
</body>
</html>