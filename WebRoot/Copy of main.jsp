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
  <title>jQuery funkyUI plugin</title>
		<link href="ext/resources/css/ext-all.css" rel="stylesheet">
		<link href="ext/resources/css/xtheme-gray.css"	rel="stylesheet">
		<script type="text/javascript"	src="ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="ext/ext-all.js"></script>
		<script type="text/javascript" src="ext/build/locale/ext-lang-zh_CN.js"></script>
	<script type="text/javascript" src="modalDialog/jquery-1.2.6.js"></script>
<script type="text/javascript" src="modalDialog/jquery.funkyUI.js"></script>
		
<style type="text/css">
.STYLE1 {
	font-size: 12px
}

.STYLE2 {
	color: #B22222;
	font-size: 12px;
}

.STYLE3 {
	color: #707070;
	font-size: 12px;
}

.STYLE5 {
	color: #0a6e0c;
	font-size: 12px;
}
.STYLE7 {
	font-size: 12x;
	color: #4B0082;

}
.STYLE8 {
	font-size: 12x;
	color: #D3D3D3;

}

body {
	margin-top: 0px;
	margin-bottom: 0px;
}
	 a:link { text-decoration: none;color: 4B0082}
　　 a:active { text-decoration:blink}
　　 a:hover { text-decoration:underline;color: red} 
　　 a:visited { text-decoration: none;color: green}

 a.main {
	a:link {background-color:#ffffff;}    /* 未被访问的链接 */
	a:visited {background-color:#FFFF85;} /* 已被访问的链接 */
	a:hover {background-color:#f0f8fd;}   /* 鼠标指针移动到链接上 */
	a:active {background-color:#FF704D;}  /* 正在被点击的链接 */

}

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	});
	
	function Block(){
		$.funkyUI({
			url:"folderTreeTest.jsp",
			OKEvent:okEvent,
			css:{width:"700",height:"500"}
		});
	}
	function Block2(){
		$.funkyUI({
			showDialog:false
		});
	}
	function okEvent(){
		alert('ok被点击');
	}
	function Alert(){
		
		$.alert("这是警告窗口")
	}
	function Confirm(){
		$.confirm("这是个Boolean窗口");
	}
	function onalert(){
		alert("没有block");
	}
	function block(){
		$('#blocked').block();
	}
	function unblock(){
		$('#blocked').unblock();
	}
 function rename(i){
  var v1=document.getElementById("rename"+i);
  var v2=document.getElementById("sourceTxt"+i);
  if(v1.style.display=="block"){
  	v1.style.display="none";
  	v2.style.display="block";
  }else{
  	v1.style.display="block";
  	v2.style.display="none";
  }
 }
 function gorename(i,fid){
  var nn=document.getElementById("newname"+i);
  var newFileName=nn.value;
  str="<%=request.getContextPath() %>/UserAction!rename?id="+fid+"&newName="+newFileName;
  window.location.href=str;
 }
</script>
</head>
  
<c:choose>
   	<c:when test="${msg!=null}">
   		<body onload="alert('${msg}')">
   	</c:when>
   	<c:otherwise>
   		<body>
   	</c:otherwise>
</c:choose>


	<div id="main" name="main">
</div>&amp;&amp;
		<div id="sub" name="sub">
			123
	</div>
<div>Have a nice day!</div>
<input type="button" value="click1" onclick="Block()" />
<input type="button" value="click2" onclick="Alert()" />
<input type="button" value="click3" onclick="Confirm()" />
<input type="button" value="click7" onclick="Block2()" />

</br>
<div>Have a nice day!</div>
</br>
</br>
<input type="button" value="click4" onclick="block()" />
<input type="button" value="click5" onclick="unblock()" />
<div id="blocked" >
	<input type="button" value="click6" onclick="onalert()" />
	</div>


<!-- 引入导航栏 -->
		<c:choose>
		<c:when test="${curFolder.fileName!=user.userName}">
		<span style="cursor:pointer; valign="bottom" class="STYLE7">
		<a href="<%=request.getContextPath() %>/UserAction!goUpper" class="STYLE7">
		返回上一级|
		</a>
		</span>
		</c:when>
		<c:otherwise>
		<span class="STYLE8">返回上一级|</span>
		</c:otherwise>
		</c:choose>

<c:forEach items="${navigation}" var="folder">
	<span style="cursor:pointer; valign="bottom" class="STYLE7">
		<a href="<%=request.getContextPath() %>/UserAction!renavigation?folderid=${folder.id}" class="style7">
		
		<c:choose>
		<c:when test="${folder.fileName==user.userName}">
		全部文件>
		</c:when>
		<c:otherwise>
			<c:choose>
			<c:when test="${folder.fileName!=curFolder.fileName}">
				${folder.fileName}> 
			</c:when>
			<c:otherwise>
				${folder.fileName}
			</c:otherwise>
			</c:choose>
		</c:otherwise>
		</c:choose>
		
		</a></span>
</c:forEach>
<center>
   
   <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9"   >
 <% int i=0; %>
      <tr onmouseover="this.style.background='#f0f8fd'; " onmouseout ="this.style.background=''; this.style.borderColor=''" >
      <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">序号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF" width="50%"><div align="center"><strong><span class="STYLE1">文件名</span></strong></div></td>
         <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">类型</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">大小</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">上传日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
	
      <c:forEach items="${files}" var="file">
      <%i++; %>
      <a href="" class="main">
      <tr onmouseover="this.style.background='#f0f8fd'; " onmouseout ="this.style.background=''; this.style.borderColor=''" >
       <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=i %></span></div></td>
       							<c:choose>
									<c:when test="${file.fileType==1}">
   										<td height="22" bgcolor="#FFFFFF" width="50%">
   											 &nbsp; <image src="image/fileIco.jpg" width="25" vspace="10">
   											 </image>
   											<span class="STYLE3">
   											<div id="sourceTxt<%=i %>">
   											&nbsp;&nbsp;${file.fileName}
   											</div>
   											</span>
   											<div id="rename<%=i %>" style="display:none" >
   											<input type="text" id="newname<%=i %>" value="${file.fileName}">
   											<span style="cursor:pointer;" class="STYLE3" onclick="gorename(<%=i %>,${file.id})">
   											<image src="image/OKIco.jpg" width="20">
   											</image>
   											</span>
   											<span style="cursor:pointer;" class="STYLE3"  onclick="rename(<%=i %>)">
   											<image src="image/cancelIco.jpg" width="20">
   											</image>
   											</span>
   											</div>
   										</td>
   									</c:when>
									<c:otherwise>
   									<td height="22" bgcolor="#FFFFFF" width="50%">
   									<span style="cursor:pointer;" class="STYLE3"  onclick="window.location.href='<%=request.getContextPath() %>/UserAction!listfolderfiles?fileId=${file.id}'">
   									&nbsp;&nbsp;<image src="image/folderIco1.jpg" width="25"  vspace="10">
   									</image>
   				
   									<div id="sourceTxt<%=i %>">
   									&nbsp;&nbsp;${file.fileName}
   									</div >
   									</span>
   									<div id="rename<%=i %>" style="display:none">
   									<input type="text" id="newname<%=i %>" value="${file.fileName}" >
   									<span style="cursor:pointer;" class="STYLE3"  onclick="gorename(<%=i %>,${file.id})">
   									<image src="image/OKIco.jpg" width="20">
   									</image>
   									</span>
   									<span style="cursor:pointer;" class="STYLE3" onclick="rename(<%=i %>)">
   									<image src="image/cancelIco.jpg" width="20">
   									</image>
   									</span>
   									</div>
   									
   									
   									</td>
   									</c:otherwise>
								</c:choose> 

				<td height="22" bgcolor="#FFFFFF">
					<div align="center">
						<span class="STYLE3">
								<c:choose>
									<c:when test="${file.fileType==1}">
   										 文件
   									</c:when>
									<c:otherwise>
   										目录
   									</c:otherwise>
								</c:choose> 
							</span>
					</div></td>
					<c:choose>
						<c:when test="${file.fileType==1}">
									<c:choose>
									<c:when test="${file.fileSize<1024}">
   									<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${file.fileSize}&nbsp;KB</span></div></td>
   									</c:when>
									<c:otherwise>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">
									<fmt:formatNumber value="${file.fileSize/1024}" pattern="#0.00" />
								 	MB</span></div></td>
   									</c:otherwise>
									</c:choose> 
   								
   									</c:when>
									<c:otherwise>
   										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">——</span></div></td>
   									</c:otherwise>
								</c:choose> 
					
				
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${file.uploadTime }</span></div></td>
        <td height="22" bgcolor="#FFFFFF">
            <div align="center">
            	<span style="cursor:pointer;" class="STYLE2" onclick="window.open('<%=request.getContextPath() %>/UserAction!downloadFile?id=${file.id}');">【下载】</span>
                <span style="cursor:pointer;" class="STYLE2" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!deleteFile?id=${file.id}'">【删除】</span>
                <span style="cursor:pointer;" class="STYLE2" onclick="rename(<%=i %>)">【重命名】</span>
                <span style="cursor:pointer;" class="STYLE2" onclick="Block()">【移动】</span>
                <span style="cursor:pointer;" class="STYLE2" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!copyFile?id=${file.id}'" target="_blank">【复制】</span>
                </div>
        </td>
      </tr>
      </a>
</c:forEach>
    </table>
   </center>
  </body>

</html>