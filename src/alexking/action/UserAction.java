package alexking.action;
//这是测试通过的版本

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import alexking.common.HdfsUtil;
import alexking.domain.*;
import alexking.service.FileInfoService;
import alexking.service.UserService;

import com.opensymphony.xwork2.ActionContext;

public class UserAction {
private UserService userService;
private FileInfoService fileInfoService;
private List<FileInfo> files;
private FileInfo file;
private User user;
private String msg;
private HdfsUtil hdfsUtil;
private int fileId;
private  List<FileInfo> filesForNavigation = new ArrayList<FileInfo>();
private  List<FileInfo> folderTree = new ArrayList<FileInfo>();

public String login() {
	user=userService.login(user);
	if(user!=null){
		String rootPath=File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName();
		ActionContext.getContext().getSession().put("user", user);
		ActionContext.getContext().getSession().put("curFolder", fileInfoService.findByPath(rootPath));
		if(fileInfoService.findByPath(rootPath)!=null){
			Navigation(fileInfoService.findByPath(rootPath));
			ActionContext.getContext().getSession().put("navigation", filesForNavigation);
		}
		return init();
	}else{
		msg="用户名或密码错误！请重新输入！";
		return "back";
	}
}

public void Navigation(FileInfo curFolder){
	filesForNavigation.clear();
	if(curFolder!=null){
		filesForNavigation.add(curFolder);
		
	}
	FileInfo tempFile=fileInfoService.findById(curFolder.getFolderId());
		while(tempFile!=null){
			filesForNavigation.add(tempFile);
			tempFile=fileInfoService.findById(tempFile.getFolderId());		
		}
	Collections.reverse(filesForNavigation);
}
public String renavigation(){
	msg=null;
	int fid=Integer.parseInt(ServletActionContext.getRequest().getParameter("folderid"));
	ActionContext.getContext().getSession().put("curFolder", fileInfoService.findById(fid));
	listfiles();
	return "main";
}
public String goUpper(){
	FileInfo oldcurFolder=(FileInfo)ActionContext.getContext().getSession().get("curFolder");
	FileInfo curFolder=fileInfoService.findById(oldcurFolder.getFolderId());
	ActionContext.getContext().getSession().put("curFolder", curFolder);
	listfiles();
	return "main";
}
public String init(){
	msg=null;
	createFolderTree();
	listfiles();	
	return "successed";
}
public String changepassword(){
	msg=null;
	User user = (User)ActionContext.getContext().getSession().get("user");
	String oldpassword=ServletActionContext.getRequest().getParameter("oldpassword");
	String newpassword=ServletActionContext.getRequest().getParameter("newpassword");
	if(user.getPassword().equals(oldpassword)){
		user.setPassword(newpassword);
		userService.update(user);
	}
	msg="密码修改成功！";
	return "changepassword";
	
}
public String register() throws IllegalArgumentException, IOException, URISyntaxException{
	msg=null;
	String tempUserName=ServletActionContext.getRequest().getParameter("userName");
	String tempPassword=ServletActionContext.getRequest().getParameter("password");
	String tempEmail=ServletActionContext.getRequest().getParameter("email");
	User tempUser =  new User();
	Date time= new java.sql.Date(new java.util.Date().getTime());
	tempUser.setUserName(tempUserName);
	tempUser.setPassword(tempPassword);
	tempUser.setEmail(tempEmail);
	tempUser.setCreateTime(time);
	tempUser.setUsedSpace(0);
	tempUser.setSpace(20971520);
	tempUser.setFileCount(0);
	userService.add(tempUser);
	
	//为用户创建根目录
	String hdfsPath = File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator;
	FileInfo rootFolder=new FileInfo();
	rootFolder.setFileName(tempUserName);
	String path=hdfsPath+tempUserName;
	path.trim();
	rootFolder.setFilePath(path);
	rootFolder.setFileType(0);
	//用户根目录的上层目录为虚拟的顶级目录其id=0	
	rootFolder.setFolderId(0);
	rootFolder.setUserId(userService.findByUserName(tempUserName).getId());
	rootFolder.setUploadTime(time);
	fileInfoService.add(rootFolder);
	hdfsUtil.makeDiretory(hdfsPath+tempUserName);
	
	
	//为每个新建用户建立5个标准常用文件夹
	for(int i=0;i<5;i++){
		String folderName="";
		if(i==0){
			folderName="Other";
		}
		if(i==1){
			folderName="Document";
		}
		if(i==2){
			folderName="Music";
		}
		if(i==3){
			folderName="Picture";
		}if(i==4){
			folderName="Movie";
		}
		Date time1= new java.sql.Date(new java.util.Date().getTime());
		FileInfo tempFile=new FileInfo();
		tempFile.setUserId(rootFolder.getUserId());
		tempFile.setFileName(folderName);
		tempFile.setFilePath(path+File.separator+folderName);
		tempFile.setFileType(0);
		tempFile.setFolderId(rootFolder.getId());
		tempFile.setUploadTime(time1);
		fileInfoService.add(tempFile);
		hdfsUtil.makeDiretory(hdfsPath+tempUserName+File.separator+folderName);
	}
	msg="用户注册成功，请登录！";
	return "back";
}
public void listfiles(){
	msg=null;
    User user = (User)ActionContext.getContext().getSession().get("user");
    FileInfo rootFolder = (FileInfo)ActionContext.getContext().getSession().get("curFolder");
    Navigation(rootFolder);
    ActionContext.getContext().getSession().put("navigation", filesForNavigation);
    System.out.println("The userId is :"+user.getId());
    System.out.println("The folderId is :"+rootFolder.getId());
    files=fileInfoService.queryFileList(user.getId(), rootFolder.getId());
    ActionContext.getContext().getSession().put("files", files);
}

public String listfolderfiles(){
	msg=null;
    User user = (User)ActionContext.getContext().getSession().get("user");
    files=fileInfoService.queryFileList(user.getId(), fileInfoService.findById(fileId).getId());
    if(user!=null){
  		ActionContext.getContext().getSession().put("curFolder", fileInfoService.findById(fileId));
  		 Navigation(fileInfoService.findById(fileId));
  		ActionContext.getContext().getSession().put("navigation", filesForNavigation);
  		ActionContext.getContext().getSession().put("files", files);
  	}
    return "main";
}


public String downloadFile() throws IOException, URISyntaxException{
		msg=null;
		// 获取用户信息
//		User user = (User) ActionContext.getContext().getSession().get("user");
		// 查出要下载的文件信息
		String id = ServletActionContext.getRequest().getParameter("id");
		System.out.println("The fileId is :" + id);
		FileInfo tempFileInfo = fileInfoService.findById(Integer.parseInt(id));

		
		//定义本地下载路径
		String localDir = "D:/Downloads";
		File fileLocation = new File(localDir);
		// 此处也可以在应用根目录手动建立目标上传目录
		if (!fileLocation.exists()) {
			boolean isCreated = fileLocation.mkdir();
			if (!isCreated) {
				// 目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。
				System.out.println("目标目录创建失败!");
			}
		}

		hdfsUtil.downloadFile(tempFileInfo.getFilePath(), localDir+"/"+tempFileInfo.getFileName());
		msg="下载完成！";
    return "main";
}



public String deleteFile() throws IOException, URISyntaxException{
	msg=null;
	User user = (User)ActionContext.getContext().getSession().get("user");
    //查出要删除的文件信息
	String id = ServletActionContext.getRequest().getParameter("id");
	FileInfo tempFileInfo = fileInfoService.findById(Integer.parseInt(id));
	hdfsUtil.deleteFile(tempFileInfo.getFilePath());
	
	//更新用户已使用空间容量的值
	int fileSize=tempFileInfo.getFileSize();
	int fileCount=user.getFileCount()-1;
	int usedSpace=user.getUsedSpace()-fileSize;
	user.setUsedSpace(usedSpace);
	user.setFileCount(fileCount);
	userService.update(user);
    //从数据库删除
    fileInfoService.deleteById(Integer.parseInt(id));
    msg="文件已删除！";
    listfiles();
    return "main";
}


public void getMenu(FileInfo root){
	folderTree.add(root);
	List<FileInfo> tempfiles=new ArrayList<FileInfo>();
	tempfiles=fileInfoService.getChildren(root.getId());
	if(tempfiles!=null){
		for(int i=0;i<tempfiles.size();i++){
			getMenu(tempfiles.get(i));
		}
	}
}
public void createFolderTree(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	String rootPath=File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName();
	FileInfo rootFolder=fileInfoService.findByPath(rootPath);
	folderTree.clear();
	getMenu(rootFolder);
	ActionContext.getContext().getSession().put("folderTree", folderTree);
	
	//拼装JSON字符串
	StringBuilder builder=new StringBuilder();
	builder.append("[");
	for(int i=0;i<folderTree.size();i++){
	if(i!=folderTree.size()-1){
		builder.append("{");
		builder.append("id:");
		builder.append(folderTree.get(i).getId());
		builder.append(",pId:");
		builder.append(folderTree.get(i).getFolderId());
		
		builder.append(",isParent:");
		builder.append("true");
		
		builder.append(",name:\"");
		builder.append(folderTree.get(i).getFileName());
		builder.append("\"},");
		}else{
			builder.append("{");
			builder.append("id:");
			builder.append(folderTree.get(i).getId());
			builder.append(",pId:");
			builder.append(folderTree.get(i).getFolderId());
			
			builder.append(",isParent:");
			builder.append("true");
			
			builder.append(",name:\"");
			builder.append(folderTree.get(i).getFileName());
			builder.append("\"}");
		}
	}
	builder.append("]");
	ActionContext.getContext().getSession().put("folderTreeStr", builder);
}

public String moveFile(){
	String folderid = ServletActionContext.getRequest().getParameter("folderid");
	String fileid = ServletActionContext.getRequest().getParameter("fileid");
//	System.out.println("folderid:"+folderid);
//	System.out.println("fileid:"+fileid);
	FileInfo tempFile=fileInfoService.findById(Integer.parseInt(fileid));
	tempFile.setFolderId(Integer.parseInt(folderid));
	fileInfoService.update(tempFile);
	//hdfsUtil.rename(tempFileInfo.getFilePath());
	listfiles();
	return "main";
}
public String copyFile(){
	String folderid = ServletActionContext.getRequest().getParameter("folderid");
	String fileid = ServletActionContext.getRequest().getParameter("fileid");
	FileInfo tempFile=fileInfoService.findById(Integer.parseInt(fileid));
	tempFile.setFolderId(Integer.parseInt(folderid));
	fileInfoService.add(tempFile);
	listfiles();
	return "main";
}


public String newFolder() throws IllegalArgumentException, IOException, URISyntaxException{
	msg=null;
	User user = (User)ActionContext.getContext().getSession().get("user");
	FileInfo curFolder=(FileInfo)ActionContext.getContext().getSession().get("curFolder");
	
//	String hdfsPath = File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName()+File.separator;
	Date time= new java.sql.Date(new java.util.Date().getTime());
//	String folderName="新建文件夹"+(int)(Math.random()*100);
	String folderName = ServletActionContext.getRequest().getParameter("foldername");
	folderName = new String(folderName.getBytes( "iso-8859-1" ), "UTF-8" );  
	hdfsUtil.makeDiretory(curFolder.getFilePath()+File.separator+folderName);
	
	//将上传的文件信息写入数据库中
	FileInfo fileInfo = new FileInfo();
	fileInfo.setUserId(user.getId());
    fileInfo.setFileName(folderName);
    
    //普通文件时设文件类型值为1,文件夹是设文件类型为0
    fileInfo.setFileType(0);
    fileInfo.setFolderId(curFolder.getId());
    fileInfo.setUploadTime(time);
    fileInfo.setFilePath(curFolder.getFilePath()+File.separator+folderName);
    fileInfoService.add(fileInfo);

    listfiles();
    return "main";
}
public String rename() throws IOException, URISyntaxException{
	msg=null;
    //查出要修改的文件信息
	String id = ServletActionContext.getRequest().getParameter("id");
	String newName = ServletActionContext.getRequest().getParameter("newName");

	newName = new String(newName.getBytes( "iso-8859-1" ), "UTF-8" );  

	FileInfo tempFileInfo = fileInfoService.findById(Integer.parseInt(id));
	hdfsUtil.rename(tempFileInfo.getFileName(), newName);
    //修改数据库信息
	tempFileInfo.setFileName(newName);
    fileInfoService.update(tempFileInfo);
    listfiles();
    return "main";
}
public String logout() {
	User tmp = (User)ActionContext.getContext().getSession().get("user");
	if(tmp!=null) {
		ActionContext.getContext().getSession().put("user", null);
		ActionContext.getContext().getSession().put("curFolder", null);
		ActionContext.getContext().getSession().put("myGroups", null);
		ActionContext.getContext().getSession().put("groups", null);
		ActionContext.getContext().getSession().put("navigation", null);
		ActionContext.getContext().getSession().put("files", null);
	}
	msg=null;
	return "back";
}
public String uploadFile(){
	
	return "upload";
}



/*
 * Getters and Setters
 */
public UserService getUserService() {
	return userService;
}
public void setUserService(UserService userService) {
	this.userService = userService;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public List<FileInfo> getFiles() {
	return files;
}
public void setFiles(List<FileInfo> files) {
	this.files = files;
}
public FileInfoService getFileInfoService() {
	return fileInfoService;
}
public void setFileInfoService(FileInfoService fileInfoService) {
	this.fileInfoService = fileInfoService;
}
public void setFile(FileInfo file) {
	this.file = file;
}
public FileInfo getFile() {
	return file;
}
public HdfsUtil getHdfsUtil() {
	return hdfsUtil;
}
public void setHdfsUtil(HdfsUtil hdfsUtil) {
	this.hdfsUtil = hdfsUtil;
}
public int getFileId() {
	return fileId;
}
public void setFileId(int fileId) {
	this.fileId = fileId;
}
public List<FileInfo> getFilesForNavigation() {
	return filesForNavigation;
}
public void setFilesForNavigation(List<FileInfo> filesForNavigation) {
	this.filesForNavigation = filesForNavigation;
}

public List<FileInfo> getFolderTree() {
	return folderTree;
}

public void setFolderTree(List<FileInfo> folderTree) {
	this.folderTree = folderTree;
}
}
