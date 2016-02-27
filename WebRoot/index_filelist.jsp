<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>My JSP 'index_filelist.jsp' starting page</title>
    <script type="text/javascript" src="resources/uploadify/jquery-1.7.2.js"></script>
<script type="text/javascript" src="resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="resources/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/uploadify/uploadify.css">	
    <style type="text/css">

.STYLE1 {font-size: 12px}
.STYLE2 {color: #B22222; font-size: 12px; }
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
    margin-top: 0px;
    margin-bottom: 0px;
}
.STYLE7 {font-size: 12}

</style>
  </head>
  
<script type="text/javascript">
$(function () {
    $('#uploadify').uploadify({
        uploader: 'UploadFileAction!execute',       // 服务器端处理地址
		swf: 'resources/uploadify/uploadify.swf',    // 上传使用的 Flash
        width: 60,                          // 按钮的宽度
        height: 23,                         // 按钮的高度
        buttonText: "上传",                 // 按钮上的文字
        buttonCursor: 'hand',                // 按钮的鼠标图标
       fileObjName: 'file',           // 上传参数名称 后台<span style="color:#ff0000;">action里面的属性uploadify</span>
		
        auto: false,                // 选择之后，自动开始上传
        multi: true,               // 是否支持同时上传多个文件
        queueSizeLimit: 5          // 允许多文件上传的时候，同时上传文件的个数
    });
});
</script>
  
  
<c:choose>
   	<c:when test="${msg!=null}">
   		<body onload="alert('${msg}')">
   	</c:when>
   	<c:otherwise>
   		<body>
   	</c:otherwise>
</c:choose>

   <div align="right" valign="bottom">
  				 <image src="image/logo_UCAS.png" align="left">
            	<span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.open('<%=request.getContextPath() %>/UserAction!uploadFile');"><image src="image/uploadButton.png"></span>
                <span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!logout'"><image src="image/logoutButton.png"></span>
  				<span style="cursor:pointer;" class="STYLE2" valign="bottom" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!newFolder'">【新建文件夹】</span>
   </div>
   
   
 
   		<input type="file" name="file" multiple id="uploadify" />
        <a href="javascript:$('#uploadify').uploadify('cancel')">清除第一个文件</a>
        <a href="javascript:$('#uploadify').uploadify('cancel', '*')">清除所有文件</a>
		<a href="javascript:$('#uploadify').uploadify('upload', '*')">上传所有文件</a>
   
   
   <hr>
   <center>
   <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
 
      <tr>
      <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">序号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF" width="50%"><div align="center"><strong><span class="STYLE1">文件名</span></strong></div></td>
         <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">类型</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">大小</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">上传日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
	<%int i=0; %>
      <s:iterator value="files" var="file">
      <%i++; %>
      <tr>
       <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=i %></span></div></td>
       
       
       
       							<c:choose>
									<c:when test="${file.fileType==1}">
   										<td height="22" bgcolor="#FFFFFF" width="50%"> &nbsp; <image src="image/fileIco.jpg" width="35" vspace="10"><span class="STYLE3">&nbsp;&nbsp;<s:property value="fileName" /></span></td>
   									</c:when>
									<c:otherwise>
   									<td height="22" bgcolor="#FFFFFF" width="50%">
   									<span style="cursor:pointer;" class="STYLE3"  onclick="window.location.href='<%=request.getContextPath() %>/UserAction!listfolderfiles?fileId=${file.id}'">&nbsp;&nbsp;<image src="image/folderIco1.jpg" width="35"  vspace="10">&nbsp;&nbsp;<s:property value="fileName" /></span>
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
   									<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="fileSize" />&nbsp;KB</span></div></td>
   									</c:when>
									<c:otherwise>
   										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">——</span></div></td>
   									</c:otherwise>
								</c:choose> 
					
				
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property  value="uploadTime"  /></span></div></td>
        <td height="22" bgcolor="#FFFFFF">
            <div align="center">
            	<span style="cursor:pointer;" class="STYLE2" onclick="window.open('<%=request.getContextPath() %>/UserAction!downloadFile?id=<s:property value="id" />');">【下载】</span>
                <span style="cursor:pointer;" class="STYLE2" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!deleteFile?id=<s:property value="id" />'">【删除】</span>
                
                </div>
        </td>
      </tr>
       </s:iterator>

 
    </table>
   </center>
  </body>
</html>
