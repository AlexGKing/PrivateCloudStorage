<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<script type="text/javascript" src="resources/uploadify/jquery-1.7.2.js"></script>
<script type="text/javascript" src="resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="resources/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/uploadify/uploadify.css">	
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
<body>
        <!-- <input type="file" name="uploadify" id="uploadify" /> -->
        <input type="file" name="file" multiple id="uploadify" />
        <a href="javascript:$('#uploadify').uploadify('cancel')">清除第一个文件</a>
        <a href="javascript:$('#uploadify').uploadify('cancel', '*')">清除所有文件</a>
        <a href="javascript:$('#uploadify').uploadify('upload', '*')">上传所有文件</a>
        <a href="main.jsp">返回</a>
</body>
   </html>