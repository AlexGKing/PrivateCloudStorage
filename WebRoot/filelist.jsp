<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
    margin-top: 0px;
    margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
</head>
 
<c:choose>
   	<c:when test="${msg!=null}">
   		<body onload="alert('${msg}')">
   	</c:when>
   	<c:otherwise>
   		<body>
   	</c:otherwise>
</c:choose>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                   <!--  <td class="STYLE1"><div align="center">
                        <input type="checkbox" name="checkbox62" value="checkbox" />
                    </div></td>-->
                    <td class="STYLE1" onclick="window.location.href='<%=request.getContextPath() %>/wangpan-web/goPicPage'"><div align="center" style="cursor:pointer;">图片列表</div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                  <!--   <td class="STYLE1"><div align="center"><img src="<%=request.getContextPath() %>/images/001.gif" width="14" height="14" /></div></td> -->
                    <td class="STYLE1" onclick="window.location.href='<%=request.getContextPath() %>/wangpan-web/goUploadPage'"><div align="center" style="cursor:pointer;">上传文件</div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                   <!--  <td class="STYLE1"><div align="center"><img src="<%=request.getContextPath() %>/images/114.gif" width="14" height="14" /></div></td> -->
                    <td class="STYLE1" onclick="window.location.href='<%=request.getContextPath() %>/wangpan-web/right'"><div align="center" style="cursor:pointer;">文件列表</div></td>
                  </tr>
              </table></td>
              <!--
              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="<%=request.getContextPath() %>/images/083.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
                  </tr>
              </table></td>
               -->
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
 
      <tr>
        <td height="22" bgcolor="#FFFFFF" width="50%"><div align="center"><strong><span class="STYLE1">文件名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">大小</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">上传日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
 
      <s:iterator value="page.result" var="file">
      <tr>
        <td height="22" bgcolor="#FFFFFF" width="50%"><div align="center"><span class="STYLE3"><s:property value="fileName" /></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:property value="fileSize" />&nbsp;KB</span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><s:date name="createTime" format="yyyy-MM-dd HH:mm" /></span></div></td>
        <td height="22" bgcolor="#FFFFFF">
            <div align="center">
                <span style="cursor:pointer;" class="STYLE3" onclick="window.location.href='<%=request.getContextPath() %>/wangpan-web/deleteFile?fileId=<s:property value="fileId" />'">删除</span>
                <span style="cursor:pointer;" class="STYLE3" onclick="window.open('<%=request.getContextPath() %>/wangpan-web/downloadFile?fileId=<s:property value="fileId" />');">下载</span>
                </div>
        </td>
      </tr>
      </s:iterator>
 
    </table></td>
  </tr>
  <tr>
    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap"><table width="342" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="44%" class="STYLE1">当前页：1/2页 每页
              <input name="textfield2" type="text" class="STYLE1" style="height:14px; width:25px;" value="15" size="5" />            </td>
            <td width="14%" class="STYLE1"><img src="<%=request.getContextPath() %>/images/sz.gif" width="43" height="20" /></td>
            <td width="42%" class="STYLE1"><span class="STYLE7">数据总量 15 </span></td>
          </tr>
        </table></td>
        <td width="75%" valign="top" class="STYLE1"><div align="right">
            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="62" height="22" valign="middle"><div align="right"><img src="<%=request.getContextPath() %>/images/page_first_1.gif" width="48" height="20" /></div></td>
                <td width="50" height="22" valign="middle"><div align="right"><img src="<%=request.getContextPath() %>/images/page_back_1.gif" width="55" height="20" /></div></td>
                <td width="54" height="22" valign="middle"><div align="right"><img src="<%=request.getContextPath() %>/images/page_next.gif" width="58" height="20" /></div></td>
                <td width="49" height="22" valign="middle"><div align="right"><img src="<%=request.getContextPath() %>/images/page_last.gif" width="52" height="20" /></div></td>
                <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                <td width="25" height="22" valign="middle"><span class="STYLE7">
                  <input name="textfield" type="text" class="STYLE1" style="height:10px; width:25px;" size="5" />
                </span></td>
                <td width="23" height="22" valign="middle">页</td>
                <td width="30" height="22" valign="middle"><img src="<%=request.getContextPath() %>/images/go.gif" width="26" height="20" /></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>