package alexking.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.List;


import alexking.domain.FileInfo;
import alexking.domain.User;
import alexking.service.FileInfoService;
import alexking.service.UserService;
import alexking.common.HdfsUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadFileAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// public class uploadAction extends ActionSupport {
	
	private HdfsUtil hdfsUtil;
	private String msg;
	private FileInfoService fileInfoService;
	private UserService userService;
	// 上传文件存放路径
	// 上传文件集合
	private List<File> file;
	// 上传文件名集合
	private List<String> fileFileName;
	// 上传文件内容类型集合
	private List<String> fileContentType;
	
	/*
	 * getters and setters
	 */
	public List<File> getFile() {
		return file;
	}
	
	public HdfsUtil getHdfsUtil() {
		return hdfsUtil;
	}

	public void setHdfsUtil(HdfsUtil hdfsUtil) {
		this.hdfsUtil = hdfsUtil;
	}

	public FileInfoService getFileInfoService() {
		return fileInfoService;
	}

	public void setFileInfoService(FileInfoService fileInfoService) {
		this.fileInfoService = fileInfoService;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	/*
	 * The real methods
	 * 
	 */

	public String execute() throws Exception {
		
		
//		fileTypeExts: "*.jpg;*.png;*.txt",             // 扩展名
//        fileTypeDesc: "请选择 jpg png txt 文件",     // 文件说明
		System.out.println(this.getFileFileName());
		for (int i = 0; i < file.size(); i++) {
			// 循环上传每个文件
			uploadFile(i);
		}
		msg="文件已上传！";
		return "success";
	}

	// 执行上传功能
	private void uploadFile(int i) throws  URISyntaxException {
		 User user = (User)ActionContext.getContext().getSession().get("user");
		 FileInfo curFolder=(FileInfo)ActionContext.getContext().getSession().get("curFolder");
		 
		try {
			String fileName = this.getFileFileName().get(i);
//			String hdfsPath = File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName()+File.separator +fileName;
			String hdfsPath=curFolder.getFilePath()+File.separator +fileName;
			hdfsUtil.uploadFile(file.get(i).toString(), hdfsPath);
			
			//将上传的文件信息写入数据库中
			FileInfo fileInfo = new FileInfo();
			fileInfo.setUserId(user.getId());
	        fileInfo.setFileName(fileName);
	        
	        //普通文件时设文件类型值为1,文件夹是设文件类型为0,目前未能实现上传文件夹的功能，所以默认文件类型为普通文件
	        fileInfo.setFileType(1);
	        //根目录为0
	        fileInfo.setFolderId(curFolder.getId());
	        Date time= new java.sql.Date(new java.util.Date().getTime());
	        fileInfo.setUploadTime(time);
	        fileInfo.setFilePath(curFolder.getFilePath()+File.separator+fileName);
	        File fileTemp = file.get(i);
	        int fileSize=(int) ((fileTemp.length() / 1024) > 1 ? (int)(fileTemp.length() / 1024) : 1);
	        fileInfo.setFileSize(fileSize);
	        int usedSpace=user.getUsedSpace()+fileSize;
	        int fileCount=user.getFileCount()+1;
	        user.setUsedSpace(usedSpace);
	        user.setFileCount(fileCount);
	        userService.update(user);
	        fileInfoService.add(fileInfo);
	        
		} catch (FileNotFoundException ex) {
			System.out.println("上传失败!");
			ex.printStackTrace();
		} catch (IOException ex) {
			System.out.println("上传失败!");
			ex.printStackTrace();
		}		
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
