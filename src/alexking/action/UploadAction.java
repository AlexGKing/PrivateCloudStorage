package alexking.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class UploadAction extends ActionSupport {
 
private File uploadify; 
private String uploadifyFileName;
 
 @SuppressWarnings("deprecation")
 public String uploadFile() throws Exception {
  
  String extName = "";//扩展名  
  String newFileName= "";//新文件名
  
  String nowTime = new SimpleDateFormat("yyyymmddHHmmss").format(new Date());//当前时间
  
  String savePath = ServletActionContext.getRequest().getRealPath("");
  
  savePath = savePath +"/uploads/";
  HttpServletResponse response = ServletActionContext.getResponse();
  response.setCharacterEncoding("utf-8");
  System.out.println("The method uploadFile() has been called!");
  //获取扩展名
  if(uploadifyFileName.lastIndexOf(".")>=0){
   extName = uploadifyFileName.substring(uploadifyFileName.lastIndexOf("."));
  }
  newFileName = nowTime+extName;
  
  uploadify.renameTo(new File(savePath+newFileName));
  
  response.getWriter().print(uploadifyFileName+"上传成功");
  
       return null; //这里不需要页面转向，所以返回空就可以了
 }

 public File getUploadify() {
  return uploadify;
 }

 public void setUploadify(File uploadify) {
  this.uploadify = uploadify;
 }

 public String getUploadifyFileName() {
  return uploadifyFileName;
 }

 public void setUploadifyFileName(String uploadifyFileName) {
  this.uploadifyFileName = uploadifyFileName;
 }
}