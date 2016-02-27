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
  <title>main.jsp</title>
  <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
   <script type="text/javascript" src="js/jquery.dialog.js"></script>
  <link href="js_css/yu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js_css/yu.js"></script>

<!-- 定义弹出层样式 -->

<style type="text/css">
{margin:0;
padding:0;
list-style:none;}
img {
	border: 0;
}

body {
	font-size: 12px;
	font-family: Tahoma, Arial, Verdana, Helvetica, sans-serif;
	color: #353535;
}
/* 弹出层 */
.dialog-box {
	position: absolute;
	z-index: 1001
}

.dialog-popup {
	filter: progid:DXImageTransform.Microsoft.gradient(enabled='true',
		startColorstr='#7F333333', endColorstr='#7F333333' );
	position: relative;
	z-index: 29;
	zoom: 1;
	background: rgba(51, 51, 51, 0.5);
	padding: 10px;
}

.dialog-popup .dialog-title-bar {
	height: 30px;
	background-color: #CDCDCD;
	position: relative;
}

.dialog-popup .dialog-title-bar h2 {
	line-height: 30px;
	padding-left: 10px;
	font-size: 14px;
	font-weight: 700
}

.dialog-popup .dialog-title-bar a.close-dialog {
	position: absolute;
	top: 5px;
	right: 10px;
	background-color: #FFFFFF;
	border: 1px solid #FF3300;
	font-size: 14px;
	font-weight: 700;
	display: block;
	height: 18px;
	width: 18px;
	line-height: 18px;
}

.dialog-popup .dialog-title-bar a.close-dialog {
	text-decoration: none;
	color: #555555;
	text-align: center;
}

.dialog-popup .dialog-title-bar a.close-dialog:hover {
	text-decoration: none;
	color: #333333
}

.dialog-content {
	background-color: #FFFFFF;
	padding: 10px
}

.dialog-iframe-mask {
	position: absolute;
	left: 0;
	top: 0;
	border: none;
}

.boxy-modal-blackout {
	position: absolute;
	left: 0;
	top: 0;
	border: none;
	background-color: #333333;
	overflow: hidden;
	z-index: 999
}
</style>







 
	
<script type="text/javascript">
		function uploadfile() {
				str = "<%=request.getContextPath()%>/uploadifyTest.jsp";
				    window.top.main.location = str;
			}
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

function deletecfn(fid){
ui.confirm('你确认要删除吗？',function(z){
        if(z){
        		str = "<%=request.getContextPath()%>/UserAction!deleteFile?id="+fid;
			    window.top.main.location = str;
			    //ui.success('fid='+fid);
                ui.success('删除成功！');    
        }else{
                ui.alert('没有删除！');      
        }
},true);
}
 	function fn1(fileid1,opr1){
 	alert("fileid="+fileid1);
 	window.fileid=fileid1;
 	window.opr=opr1; 	
 	}
 function showIcon(i){
  var d1=document.getElementById("operator"+i);
	var t1=document.getElementById("tr"+i);
  d1.style.display="";
  t1.style.backgroundColor="#f0f8fd";

 }
  function hiddenIcon(i){
  var d1=document.getElementById("operator"+i);
  var t1=document.getElementById("tr"+i);
  d1.style.display="none";
  t1.style.backgroundColor="#fff";

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



<script type="text/javascript"> 
$(document).ready(function(){

	$("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled - Adds empty span tag after ul.subnav
	
	$("ul.topnav li span").click(function() { //When trigger is clicked...
		
		//Following events are applied to the subnav itself (moving subnav up and down)
		$(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click

		$(this).parent().hover(function() {
		}, function(){	
			$(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up
		});

		//Following events are applied to the trigger (Hover events for the trigger)
		}).hover(function() { 
			$(this).addClass("subhover"); //On hover over, add class "subhover"
		}, function(){	//On Hover Out
			$(this).removeClass("subhover"); //On hover out, remove class "subhover"
	});

});
</script>



<style type="text/css">
body {
	margin: 0; padding: 0;
	font: 10px normal Arial, Helvetica, sans-serif;
}
table{
font: 10px normal Arial, Helvetica, sans-serif;
text-align:center;
margin:5px 0px 0px 0px;
padding:0px;
}
th{
background: #f0f8fd;
boder:1px;
padding:3px;
height:32px;
}
td{
padding:3px;
}
.styleNav
{
	margin: 2px 0px 2px 5px;
	padding: 0;
	font: 16px  Microsoft YaHei ,Arial, Helvetica, sans-serif;

}

 a:link { text-decoration: none;}
　　 a:active { text-decoration:blink;}
　　 a:hover { text-decoration:underline;} 
　　 a:visited { text-decoration: none;}
.container {
	width: 960px;
	margin: 0 auto;
	position: relative;
}
#header {
	background: url() no-repeat center top;
	padding-top: 120px;
}
#header .disclaimer {
	color: #999;
	padding: 100px 0 7px 0;
	text-align: right;
	display: block;
	position: absolute;
	top: 0; right: 0;
}
#header .disclaimer a {	color: #ccc;}
ul.topnav {
	list-style: none;
	padding: 0 0px;	
	margin: 0;
	float: right;
	width: 92px;
	background: #222;
	font-size: 1.2em;
	background: url(image/topnav_bg.gif) repeat-x;
}
ul.topnav li {
	float: left;
	margin: 0;	
	padding: 0 15px 0 0;
	position: relative; /*--Declare X and Y axis base--*/
}
ul.topnav li a{
	padding: 10px 5px;
	color: #fff;
	display: block;
	text-decoration: none;
	float: left;
}
ul.topnav li a:hover{
	background: url(image/topnav_hover.gif) no-repeat center top;
}
ul.topnav li span { /*--Drop down trigger styles--*/
	width: 17px;
	height: 35px;
	float: left;
	background: url(image/subnav_btn.gif) no-repeat center top;
}
ul.topnav li span.subhover {background-position: center bottom; cursor: pointer;} /*--Hover effect for trigger--*/
ul.topnav li ul.subnav {
	list-style: none;
	position: absolute; /*--Important - Keeps subnav from affecting main navigation flow--*/
	left: 0; top: 35px;
	background: #333;
	margin: 0; padding: 0;
	display: none;
	float: left;
	width: 100px;
	-moz-border-radius-bottomleft: 5px;
	-moz-border-radius-bottomright: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-webkit-border-bottom-right-radius: 5px;
	border: 1px solid #111;
}
ul.topnav li ul.subnav li{
	margin: 0; padding: 0;
	border-top: 1px solid #252525; /*--Create bevel effect--*/
	border-bottom: 1px solid #444; /*--Create bevel effect--*/
	clear: both;
	width: 100px;
}
html ul.topnav li ul.subnav li a {
	float: left;
	width: 92px;
	background: #333 url(image/dropdown_linkbg.gif) no-repeat 5px center;
	padding-left: 0px;
}

html ul.topnav li ul.subnav li a:hover { /*--Hover effect for subnav links--*/
	background: #222 url(image/dropdown_linkbg.gif) no-repeat 10px center; 
}
#header img {
	margin: 20px 0 10px;
}
</style>





</head>
  
<c:choose>
   	<c:when test="${message!=null}">
   		<body>
   		<script type="javascript">
			ui.success("共享成功！"); 
		</script>
   	</c:when>
   	<c:otherwise>
   		<body>
   	</c:otherwise>
</c:choose>


<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" >
	<tr height="30px">
	<td width="75%" align="left">
	
	<!-- 引入导航条 -->
<div class="styleNav">
		<c:choose>
		<c:when test="${curFolder.fileName!=user.userName}">
		<span style="cursor:pointer; valign="bottom">
		<a href="<%=request.getContextPath() %>/UserAction!goUpper">
		&nbsp;返回上一级|
		</a>
		</span>
		</c:when>
		<c:otherwise>
		<span>&nbsp;返回上一级|</span>
		</c:otherwise>
		</c:choose>

<c:forEach items="${navigation}" var="folder">
	<span style="cursor:pointer; valign="bottom">
		<a href="<%=request.getContextPath() %>/UserAction!renavigation?folderid=${folder.id}">
		
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
		</a>
		</span>
		</c:forEach>
		
</div>
	</td>
	<td width="300px" align="right">
	<!-- 引入工具栏-->
<span style="cursor:pointer;margin:0px;padding:0px;">&nbsp;&nbsp;<image style="margin:0px;padding:0px;" src="image/uploadfileIcon.png" onclick="uploadfile()"></span>
<span style="cursor:pointer;margin:0px;padding:0px;">&nbsp;&nbsp;<image style="margin:0px;padding:0px;" src="image/newfolderIcon.png" onclick="newFolder()"></span>
	 
	</td>
	</tr>
</table>




 <hr />
<center>

     
	<c:choose>
	<c:when test="${files==null}">
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<center><img src="image/emptyFolder.png" margin="30px"></center>
	</c:when>
	<c:otherwise>
	
   <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"   >
 	<% int i=0; %>
      <tr >
      <th height="32" bgcolor="#FFFFFF" >序号</th>
        <th height="32" bgcolor="#FFFFFF" width="40%">文件名</th>
         <th height="32" bgcolor="#FFFFFF" >类型</th>
        <th height="32" bgcolor="#FFFFFF" >大小</th>
        <th height="32" bgcolor="#FFFFFF" >上传日期</div></th>
        <th height="32" bgcolor="#FFFFFF" width="300px">操作</th>
      </tr>
	
	
	
      <c:forEach items="${files}" var="file">
      <%i++; %>
      <tr onMouseover="showIcon(<%=i %>)" onMouseout="hiddenIcon(<%=i %>);"  id="tr<%=i%>">
       <td height="22" ><%=i %></td>
       							<c:choose>
									<c:when test="${file.fileType==1}">
   										<td height="22"  width="40%" align="left">
   											 &nbsp; <image src="image/fileIco.jpg" width="20" height="20" vspace="10">
   											 </image>
   											<div id="sourceTxt<%=i %>">
   											&nbsp;&nbsp;${file.fileName}
   											</div>   										
   											<div id="rename<%=i %>" style="display:none" >
   											<input type="text" id="newname<%=i %>" value="${file.fileName}">
   											<span style="cursor:pointer;"  onclick="gorename(<%=i %>,${file.id})">
   											<image src="image/OKIco.jpg" width="20">
   											</image>
   											</span>
   											<span style="cursor:pointer;" onclick="rename(<%=i %>)">
   											<image src="image/cancelIco.jpg" width="20">
   											</image>
   											</span>
   											</div>
   										</td>
   									</c:when>
									<c:otherwise>
   									<td height="22"  width="40%" align="left">
   									<span style="cursor:pointer;" onclick="window.location.href='<%=request.getContextPath() %>/UserAction!listfolderfiles?fileId=${file.id}'">
   									&nbsp;&nbsp;<image src="image/folderIcon.jpg" width="30" height="30"  align="bottom">
   									</image>
   				
   									<div id="sourceTxt<%=i %>">
   									&nbsp;&nbsp;${file.fileName}
   									</div >
   									</span>
   									<div id="rename<%=i %>" style="display:none">
   									<input type="text" id="newname<%=i %>" value="${file.fileName}" >
   									<span style="cursor:pointer;"  onclick="gorename(<%=i %>,${file.id})">
   									<image src="image/OKIco.jpg" width="20">
   									</image>
   									</span>
   									<span style="cursor:pointer;" onclick="rename(<%=i %>)">
   									<image src="image/cancelIco.jpg" width="20">
   									</image>
   									</span>
   									</div>
   									
   									
   									</td>
   									</c:otherwise>
								</c:choose> 

				<td height="22" >
					<div align="center">
						<span>
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
   									<td height="22">${file.fileSize}&nbsp;KB</td>
   									</c:when>
									<c:otherwise>
									<td height="22" >
									<fmt:formatNumber value="${file.fileSize/1024}" pattern="#0.00" />
								 	MB</td>
   									</c:otherwise>
									</c:choose> 
   								
   									</c:when>
									<c:otherwise>
   										<td height="22">—</td>
   									</c:otherwise>
								</c:choose> 
					
				
        <td height="22">${file.uploadTime }</td>
        <td height="22"  width="300px">
        	
        <div id="operator<%=i%>" style="display: none" >
        <span style="cursor:pointer;"><a href="<%=request.getContextPath() %>/UserAction!downloadFile?id=${file.id}" target="main"><image src="image/downloadfile.png" width="30" height="30" title="下载"></image></a></span>
         &nbsp;&nbsp;
         <span style="cursor:pointer;"><a href="uploadifyTest.jsp" target="main"><image src="image/uploadfile.png" width="30" height="30"  title="上传"></a></span>
         &nbsp;&nbsp;
         <span style="cursor:pointer;" ><a href="share2MyGroups.jsp?fileid=${file.id}"><image src="image/sharefile.png" width="30" height="30"  title="分享"></image></a></span>
        <ul class="topnav">
            <li>
               <a>&nbsp; &nbsp;more...</a> 
                <ul class="subnav">
                   <!--  <li><span style="cursor:pointer;"><a id="move"  onclick="fn1(${file.id},"move")">移动到</a></span></li>
                   		<li><span style="cursor:pointer;"><a id="copy" >复制到</a></span></li>
                   -->
                    <li><span style="cursor:pointer;"><a id="move"  href="folderTreeTest.jsp?fileid=${file.id}&opr='move'">移动到</a></span></li>
                    <li><span style="cursor:pointer;"><a id="move"  href="folderTreeTest.jsp?fileid=${file.id}&opr='copy'">复制到</a></span></li>
                    <li> <span style="cursor:pointer;" ><a onclick="rename(<%=i %>)">重命名</a></span></li>
                    <li> <span style="cursor:pointer;" ><a onclick="deletecfn(${file.id})" >删除</a></span></li>
                </ul>
            </li>
        </ul>
        
        </div>
            <!--  <div align="center">
            	<span style="cursor:pointer;" onclick="window.open('<%=request.getContextPath() %>/UserAction!downloadFile?id=${file.id}');">【下载】</span>
                <span style="cursor:pointer;"  onclick="window.location.href='<%=request.getContextPath() %>/UserAction!deleteFile?id=${file.id}'">【删除】</span>
                <span style="cursor:pointer;"  onclick="rename(<%=i %>)">【重命名】</span>
                <span style="cursor:pointer;"  onclick="Block()">【移动】</span>
                <span style="cursor:pointer;"  onclick="window.location.href='<%=request.getContextPath() %>/UserAction!copyFile?id=${file.id}'" target="_blank">【复制】</span>
                </div>-->
        </td>
      </tr>
</c:forEach>



	</c:otherwise>
	</c:choose>
    </table>
   </center>
 
 <script type="text/javascript">
    /*$("#move").click(function() {
        Dialog.frame("fuckYou","folderTreeTest.jsp?opr='move'", {
            "width":"350px",
	    	"height":"382px",
            "title":"文件目录!",
            'modal':true,
            "closeModal":false,
            "dTopNum":"50px"
        });
    });
        $("#copy").click(function() {
        Dialog.frame("fuckYou","folderTreeTest.jsp?fileid=${file.id}&opr='copy'", {
            "width":"312px",
	    	"height":"362px",
            "title":"文件目录!",
            'modal':true,
            "closeModal":false,
            "dTopNum":"50px"
        });
    });*/
</script>
 
  </body>

</html>