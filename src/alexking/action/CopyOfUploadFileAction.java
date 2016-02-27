package alexking.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import alexking.common.DeleteFile;
import alexking.domain.FileInfo;
import alexking.domain.User;
import alexking.service.FileInfoService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CopyOfUploadFileAction extends ActionSupport {
	// public class uploadAction extends ActionSupport {

	private DeleteFile delFile;
	private FileInfoService fileInfoService;
	
	// 上传文件存放路径
	private final static String UPLOADDIR = File.separator+"upload";
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

	public void setDelFile(DeleteFile delFile) {
		this.delFile = delFile;
	}

	public DeleteFile getDelFile() {
		return delFile;
	}
	
	
	/*
	 * The real methods
	 * 
	 */

	public String execute() throws Exception {
		System.out.println(this.getFileFileName());
		for (int i = 0; i < file.size(); i++) {
			// 循环上传每个文件
			uploadFile(i);
		}
		return "success";
	}

	// 执行上传功能
	private void uploadFile(int i) throws FileNotFoundException, IOException {
		 User user = (User)ActionContext.getContext().getSession().get("user");
		 
		try {
			InputStream in = new FileInputStream(file.get(i));
			String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR)+File.separator+user.getUserName();
//			String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR);
//			System.out.println("The dir is :"+dir);			
			File fileLocation = new File(dir);
			// 此处也可以在应用根目录手动建立目标上传目录
			if (!fileLocation.exists()) {
				boolean isCreated = fileLocation.mkdir();
				if (!isCreated) {
					// 目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。
					System.out.println("目标上传目录创建失败!");
					return;
				}
			}
			String fileName = this.getFileFileName().get(i);
			File uploadFile = new File(dir, fileName);
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[10240 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			in.close();
			out.close();

			/*
			 * 上传至Hadoop集群
			 */
			String path = dir +File.separator+ fileName;
			System.out.println("The Path is : "+path);
			Process process;
			process = Runtime.getRuntime().exec(
					"java -jar http://192.168.80.102/root/hdfs-api.jar upload " + path
							+ " hdfs://hadoop0:9000/user/root/upload/"
							+ user.getUserName() + "/" + fileName);
			InputStreamReader ir = new InputStreamReader(
					process.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			String line;
			while ((line = input.readLine()) != null)
				System.out.println(line);
			
			FileInfo fileInfo = new FileInfo();
	        
			fileInfo.setUserId(user.getId());
	        fileInfo.setFileName(fileName);
	        //普通文件时设文件类型值为1,文件夹是设文件类型为0
	        fileInfo.setFileType(1);
	        fileInfo.setUploadTime((new Date()));
	        fileInfo.setFilePath("hdfs://hadoop0:9000/user/root/upload/" + user.getUserName() + "/" + fileName);
	        File fileTemp = new File(path);
	        fileInfo.setFileSize((int) ((fileTemp.length() / 1024) > 1 ? (int)(fileTemp.length() / 1024) : 1));
	        fileInfoService.add(fileInfo);
	        delFile.deleteFile(dir+File.separator+fileName);
	        
		} catch (FileNotFoundException ex) {
			System.out.println("上传失败!");
			ex.printStackTrace();
		} catch (IOException ex) {
			System.out.println("上传失败!");
			ex.printStackTrace();
		}		
	}

}
