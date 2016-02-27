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

import com.opensymphony.xwork2.ActionContext;

import alexking.common.HdfsUtil;
import alexking.domain.*;
import alexking.service.*;



public class GroupAction {

private GroupService groupService;
private GroupUsersService groupUsersService;
private GroupAdminsService groupAdminsService;
private ShareFileService shareFileService;
private  List<ShareFile> sharefolderTree = new ArrayList<ShareFile>();

private FileInfoService fileInfoService;

private List<Group> groups ;
private List<Group> myGroups;
private List<Group> otherGroups;
private List<GroupUsers> groupUsers;
private List<ShareFile> shareFiles;
private List<ShareFile> myshareFiles;
private ShareFile shareFile;
private User user;
private String msg;
private HdfsUtil hdfsUtil;
private int fileId;
private  List<ShareFile> filesForNavigation = new ArrayList<ShareFile>();
private  List<ShareFile> folderTree = new ArrayList<ShareFile>();
private  boolean isMember;


public String listGroups(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	groups=groupService.list();
	List<Group> myGroups=new ArrayList<Group>();
	myGroups.clear();
	int uid=user.getId();
	groupUsers = groupUsersService.listByUserId(uid);
	if(groupUsers!=null){
		for(int i=0;i<groupUsers.size();i++){
			myGroups.add(groupService.findById(groupUsers.get(i).getGroupId()));
		}
		ActionContext.getContext().getSession().put("myGroups", myGroups);
	}
	System.out.println("The size of groups is :"+groups.size());
	
	//从全部群组列表中去除我所加入的群组
	for(int i=0;i<myGroups.size();i++){
		for(int j=0;j<groups.size();j++){
			if(myGroups.get(i).getId()==groups.get(j).getId()){
				groups.remove(j);
			}
		}
	}
	//groups.removeAll(myGroups);
	System.out.println("The size of groups is :"+groups.size());
	
	ActionContext.getContext().getSession().put("otherGroups", groups);
	return "listMyGroups";
}



//列出全部群组
public String listAllGroups(){
	//List<Group> groups=new ArrayList<Group>();
	//groups.clear();
	groups=groupService.list();
	ActionContext.getContext().getSession().put("groups", groups);
	return "listAllGroups";
}

//列出我的群组
public String listMyGroups(){
	//makeMyGroups();
	User user = (User)ActionContext.getContext().getSession().get("user");
	List<Group> myGroups=new ArrayList<Group>();
	myGroups.clear();
	int uid=user.getId();
	groupUsers = groupUsersService.listByUserId(uid);
	if(groupUsers!=null){
		for(int i=0;i<groupUsers.size();i++){
			myGroups.add(groupService.findById(groupUsers.get(i).getGroupId()));
		}
		ActionContext.getContext().getSession().put("myGroups", myGroups);
	}
	return "listMyGroups";
}

//创建群组
public String createGroup() throws IllegalArgumentException, IOException, URISyntaxException{
	User user = (User)ActionContext.getContext().getSession().get("user");
	String gn=ServletActionContext.getRequest().getParameter("groupName");
	String gc=ServletActionContext.getRequest().getParameter("groupComment");
	System.out.println("The groupComment is:"+gc);
	Date time= new java.sql.Date(new java.util.Date().getTime());
	Group g1= new Group();
	GroupUsers gu1= new GroupUsers();
	GroupAdmins ga1 = new GroupAdmins();
	ShareFile sf1 = new ShareFile();
	ShareFile sf2 = new ShareFile();
	String hdfsPath = File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+gn;
	hdfsUtil.makeDiretory(hdfsPath);
	
	//添加群组记录
	g1.setGroupName(gn);
	g1.setOwnnerId(user.getId());
	g1.setCreateTime(time);
	g1.setFileCount(0);
	g1.setUsedSpace(0);
	g1.setUserCount(1);
	g1.setSpace(20971520);
	g1.setComment(gc);
	groupService.add(g1);
	
	//添加群组成员记录
	gu1.setGroupId(g1.getId());
	gu1.setUserId(user.getId());
	groupUsersService.add(gu1);
	
	
	//添加群组管理员记录
	ga1.setAdminId(user.getId());
	ga1.setGroupId(g1.getId());
	groupAdminsService.add(ga1);
	
	
	//将群组作为根目录添加到共享文件表中
	sf1.setFileName(gn);
	sf1.setFileSize(0);
	sf1.setFileType(0);
	sf1.setFolderId(0);
	sf1.setGroupId(g1.getId());
	sf1.setUserId(user.getId());
	sf1.setUploadTime(time);
	shareFileService.add(sf1);
	
	hdfsUtil.makeDiretory(hdfsPath+File.separator+"审核区");
	//将审核区文件夹添加到共享文件表中
	sf2.setFileName("审核区");
	sf2.setFileSize(0);
	sf2.setFileType(0);
	sf2.setFolderId(sf1.getId());
	sf2.setGroupId(g1.getId());
	sf2.setUserId(user.getId());
	sf2.setUploadTime(time);
	shareFileService.add(sf2);
	
	return listMyGroups();
}

//加入群组
public String joinGroup(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	int gId=Integer.parseInt(ServletActionContext.getRequest().getParameter("gId"));
	GroupUsers gu1= new GroupUsers();
	//更新群组的用户数
	Group g1=groupService.findById(gId);
	int uc=g1.getUserCount()+1;
	g1.setUserCount(uc);
	groupService.update(g1);
	//在t_group_users表中增加一条记录
	gu1.setGroupId(gId);
	gu1.setUserId(user.getId());
	groupUsersService.add(gu1);
	return listGroups();
}

//退出群组
public String exitGroup(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	int gId=Integer.parseInt(ServletActionContext.getRequest().getParameter("gId"));
	//更新群组的用户数
	Group g1=groupService.findById(gId);
	int uc=g1.getUserCount()-1;
	g1.setUserCount(uc);
	groupService.update(g1);
	//在t_group_users表中删除一条记录
	GroupUsers gu1= groupUsersService.findByGidUid(gId, user.getId());
	groupUsersService.delete(gu1);
	return listGroups();
}

//解散群组
public String dimissGroup(){
	int gId=Integer.parseInt(ServletActionContext.getRequest().getParameter("gId"));
	Group g1=groupService.findById(gId);
	//删除群组记录，数据库默认是级联删除，将自动删除依赖此记录的其他表的所有记录
	groupService.delete(g1);
	return listGroups();
}



public void getMenu(ShareFile root){
	sharefolderTree.add(root);
	List<ShareFile> tempfiles=new ArrayList<ShareFile>();
	tempfiles=shareFileService.getChildren(root.getId());
	if(tempfiles!=null){
		for(int i=0;i<tempfiles.size();i++){
			getMenu(tempfiles.get(i));
		}
	}
}

//public void createFolderTree(){
//	User user = (User)ActionContext.getContext().getSession().get("user");
//	String rootPath=File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName();
//	ShareFile rootFolder=shareFileService.findByPath(rootPath);
//	folderTree.clear();
//	getMenu(rootFolder);
//	ActionContext.getContext().getSession().put("folderTree", folderTree);
//	
//	//拼装JSON字符串
//	StringBuilder builder=new StringBuilder();
//	builder.append("[");
//	for(int i=0;i<folderTree.size();i++){
//	if(i!=folderTree.size()-1){
//		builder.append("{");
//		builder.append("id:");
//		builder.append(folderTree.get(i).getId());
//		builder.append(",pId:");
//		builder.append(folderTree.get(i).getFolderId());
//		
//		builder.append(",isParent:");
//		builder.append("true");
//		
//		builder.append(",name:\"");
//		builder.append(folderTree.get(i).getFileName());
//		builder.append("\"},");
//		}else{
//			builder.append("{");
//			builder.append("id:");
//			builder.append(folderTree.get(i).getId());
//			builder.append(",pId:");
//			builder.append(folderTree.get(i).getFolderId());
//			
//			builder.append(",isParent:");
//			builder.append("true");
//			
//			builder.append(",name:\"");
//			builder.append(folderTree.get(i).getFileName());
//			builder.append("\"}");
//		}
//	}
//	builder.append("]");
//	ActionContext.getContext().getSession().put("folderTreeStr", builder);
//}


public void Navigation(ShareFile curFolder){
	filesForNavigation.clear();
	if(curFolder!=null){
		filesForNavigation.add(curFolder);
		
	}
	ShareFile tempFile=shareFileService.findById(curFolder.getFolderId());
		while(tempFile!=null){
			filesForNavigation.add(tempFile);
			tempFile=shareFileService.findById(tempFile.getFolderId());		
		}
	Collections.reverse(filesForNavigation);
}
public String renavigation(){
	msg=null;
	int fid=Integer.parseInt(ServletActionContext.getRequest().getParameter("folderid"));
	ActionContext.getContext().getSession().put("groupcurFolder", shareFileService.findById(fid));
	listfiles();
	return "groupFileList";
}
public String goUpper(){
	ShareFile oldcurFolder=(ShareFile)ActionContext.getContext().getSession().get("groupcurFolder");
	ShareFile curFolder=shareFileService.findById(oldcurFolder.getFolderId());
	ActionContext.getContext().getSession().put("groupcurFolder", curFolder);
	listfiles();
	return "groupFileList";
}


public void listfiles(){
	msg=null;
    User user = (User)ActionContext.getContext().getSession().get("user");
    ShareFile rootFolder = (ShareFile)ActionContext.getContext().getSession().get("groupcurFolder");
    Navigation(rootFolder);
    ActionContext.getContext().getSession().put("groupnavigation", filesForNavigation);
    shareFiles=shareFileService.queryFolderFileList(rootFolder.getId());
    ActionContext.getContext().getSession().put("shareFiles", shareFiles);
}


public String listfolderfiles(){
	msg=null;
    User user = (User)ActionContext.getContext().getSession().get("user");
    int fid=Integer.parseInt(ServletActionContext.getRequest().getParameter("fileId"));
    shareFiles=shareFileService.queryFolderFileList(fid);
    if(user!=null){
  		ActionContext.getContext().getSession().put("groupcurFolder",shareFileService.findById(fid));
  		 Navigation(shareFileService.findById(fid));
  		ActionContext.getContext().getSession().put("groupnavigation", filesForNavigation);
  		ActionContext.getContext().getSession().put("shareFiles", shareFiles);
  	}
    return "groupFileList";
}

public String openGroup(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	int gId=Integer.parseInt(ServletActionContext.getRequest().getParameter("gId"));
	int uid=user.getId();
	boolean isAdmin;
	isAdmin=false;
	isAdmin=groupAdminsService.isAdmin(uid, gId);
	System.out.println(isAdmin);
	ActionContext.getContext().getSession().put("isAdmin", isAdmin);
	System.out.println(isAdmin);
	Group group =groupService.findById(gId);
	ShareFile curFolder = shareFileService.findRootFolder(group.getGroupName());
	ActionContext.getContext().getSession().put("groupcurFolder", curFolder);
	ActionContext.getContext().getSession().put("group", group);
	if(curFolder!=null){
		Navigation(curFolder);
		ActionContext.getContext().getSession().put("groupnavigation", filesForNavigation);
	}
	listfiles();
	return "groupFileList";
}


public String newFolder() throws IllegalArgumentException, IOException, URISyntaxException{
	msg=null;
	User user = (User)ActionContext.getContext().getSession().get("user");
	Group group = (Group)ActionContext.getContext().getSession().get("group");
	ShareFile groupcurFolder=(ShareFile)ActionContext.getContext().getSession().get("groupcurFolder");
	
//	String hdfsPath = File.separator+"user"+File.separator+"root"+File.separator+"upload"+File.separator+user.getUserName()+File.separator;
	Date time= new java.sql.Date(new java.util.Date().getTime());
	
	String folderName = (String)ServletActionContext.getRequest().getParameter("foldername");
	//folderName = java.net.URLDecoder.decode(folderName,"UTF-8"); 
	folderName = new String(folderName.getBytes( "iso-8859-1" ), "UTF-8" );  
	hdfsUtil.makeDiretory(groupcurFolder.getFilePath()+File.separator+folderName);
	
	//将上传的文件信息写入数据库中
	ShareFile shareFile = new ShareFile();
	shareFile.setUserId(user.getId());
	shareFile.setGroupId(group.getId());
	shareFile.setFileName(folderName);
    
    //普通文件时设文件类型值为1,文件夹是设文件类型为0
	shareFile.setFileType(0);
	shareFile.setFolderId(groupcurFolder.getId());
	shareFile.setUploadTime(time);
	shareFile.setFilePath(groupcurFolder.getFilePath()+File.separator+folderName);
    shareFileService.add(shareFile);

    listfiles();
    return "groupFileList";
}
public String rename() throws IOException, URISyntaxException{
	msg=null;
    //查出要修改的文件信息
	String id = ServletActionContext.getRequest().getParameter("id");
	String newName = ServletActionContext.getRequest().getParameter("newName");
	ShareFile tempShareFile = shareFileService.findById(Integer.parseInt(id));
	hdfsUtil.rename(tempShareFile.getFileName(), newName);
    //修改数据库信息
	tempShareFile.setFileName(newName);
	shareFileService.update(tempShareFile);
    listfiles();
    return "groupFileList";
}

public String deleteFile() throws IOException, URISyntaxException{
	msg=null;
	User user = (User)ActionContext.getContext().getSession().get("user");
	Group group = (Group)ActionContext.getContext().getSession().get("group");
    //查出要删除的文件信息
	String id = ServletActionContext.getRequest().getParameter("id");
	ShareFile tempShareFile = shareFileService.findById(Integer.parseInt(id));
	hdfsUtil.deleteFile(tempShareFile.getFilePath());
	
	//更新用户已使用空间容量的值
	int fileSize=tempShareFile.getFileSize();
	int fileCount=group.getFileCount()-1;
	int usedSpace=group.getUsedSpace()-fileSize;
	group.setUsedSpace(usedSpace);
	group.setFileCount(fileCount);
	groupService.update(group);
    //从数据库删除
	shareFileService.deleteById(Integer.parseInt(id));
    msg="文件已删除！";
    listfiles();
    return "groupFileList";
}

public String shareFile(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	int fileid = Integer.parseInt(ServletActionContext.getRequest().getParameter("fileid"));
	String groupIdsStr = ServletActionContext.getRequest().getParameter("groupIds");
    String[] gIdArray=groupIdsStr.split(" "); 
     for (int i = 0; i < gIdArray.length; i++) {
    	 	Date time= new java.sql.Date(new java.util.Date().getTime());
    		FileInfo tempfile=new FileInfo();
    		tempfile = fileInfoService.findById(fileid);
    		
    		ShareFile tempShareFile = new ShareFile();
    		
    		tempShareFile.setFileId(tempfile.getId());
    		tempShareFile.setFileName(tempfile.getFileName());
    		tempShareFile.setFilePath(tempfile.getFilePath());
    		tempShareFile.setFileSize(tempfile.getFileSize());
    		tempShareFile.setFileType(tempfile.getFileType());
    		tempShareFile.setFolderId(shareFileService.findByGidFname(Integer.parseInt(gIdArray[i]), "审核区").getId());
    		tempShareFile.setGroupId(Integer.parseInt(gIdArray[i]));
    		tempShareFile.setUploadTime(time);
    		tempShareFile.setUserId(user.getId());	
    		shareFileService.add(tempShareFile);
     }
     String message="共享成功！";
     ActionContext.getContext().getSession().put("message", message);

	return "main";
}

public String moveFile(){
	String folderid = ServletActionContext.getRequest().getParameter("folderid");
	String fileid = ServletActionContext.getRequest().getParameter("fileid");
//	System.out.println("folderid:"+folderid);
//	System.out.println("fileid:"+fileid);
	ShareFile tempShareFile=shareFileService.findById(Integer.parseInt(fileid));
	tempShareFile.setFolderId(Integer.parseInt(folderid));
	shareFileService.update(tempShareFile);
	//hdfsUtil.rename(tempFileInfo.getFilePath());
	return "groupFileList";
}

public String colletFile(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	String folderid = ServletActionContext.getRequest().getParameter("folderid");
	String fileid = ServletActionContext.getRequest().getParameter("fileid");

	ShareFile tempShareFile=shareFileService.findById(Integer.parseInt(fileid));
	//tempShareFile.setFolderId(Integer.parseInt(folderid));
	FileInfo tempFile=new FileInfo();
	
	Date time= new java.sql.Date(new java.util.Date().getTime());
	tempFile.setFileName(tempShareFile.getFileName());
	tempFile.setFilePath(tempShareFile.getFilePath());
	tempFile.setFileSize(tempShareFile.getFileSize());
	tempFile.setFileType(tempShareFile.getFileType());
	tempFile.setFolderId(Integer.parseInt(folderid));
	tempFile.setUploadTime(time);
	tempFile.setUserId(user.getId());	
	fileInfoService.add(tempFile);
	return "groupFileList";
}

public String listMyShareFile(){
	User user = (User)ActionContext.getContext().getSession().get("user");
	myshareFiles=shareFileService.getUserShareFiles(user.getId());
	ActionContext.getContext().getSession().put("myshareFiles", myshareFiles);
	return "listMyShareFiles";
}
public String cancelShare(){
	String sharefileId = ServletActionContext.getRequest().getParameter("sharefileId");
	shareFileService.deleteById(Integer.parseInt(sharefileId));
	User user = (User)ActionContext.getContext().getSession().get("user");
	myshareFiles=shareFileService.getUserShareFiles(user.getId());
	ActionContext.getContext().getSession().put("myshareFiles", myshareFiles);
	return "listMyShareFiles";
}
/*
 * Getters and Setters
 */
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
public GroupService getGroupService() {
	return groupService;
}
public void setGroupService(GroupService groupService) {
	this.groupService = groupService;
}
public List<Group> getGroups() {
	return groups;
}
public void setGroups(List<Group> groups) {
	this.groups = groups;
}
public List<Group> getMyGroups() {
	return myGroups;
}
public void setMyGroups(List<Group> myGroups) {
	this.myGroups = myGroups;
}
public GroupUsersService getGroupUsersService() {
	return groupUsersService;
}
public void setGroupUsersService(GroupUsersService groupUsersService) {
	this.groupUsersService = groupUsersService;
}

public List<GroupUsers> getGroupUsers() {
	return groupUsers;
}
public void setGroupUsers(List<GroupUsers> groupUsers) {
	this.groupUsers = groupUsers;
}
public GroupAdminsService getGroupAdminsService() {
	return groupAdminsService;
}

public void setGroupAdminsService(GroupAdminsService groupAdminsService) {
	this.groupAdminsService = groupAdminsService;
}

public boolean isMember() {
	return isMember;
}

public void setMember(boolean isMember) {
	this.isMember = isMember;
}

public ShareFileService getShareFileService() {
	return shareFileService;
}

public void setShareFileService(ShareFileService shareFileService) {
	this.shareFileService = shareFileService;
}

public FileInfoService getFileInfoService() {
	return fileInfoService;
}

public void setFileInfoService(FileInfoService fileInfoService) {
	this.fileInfoService = fileInfoService;
}

public List<ShareFile> getShareFiles() {
	return shareFiles;
}

public void setShareFiles(List<ShareFile> shareFiles) {
	this.shareFiles = shareFiles;
}

public ShareFile getShareFile() {
	return shareFile;
}

public void setShareFile(ShareFile shareFile) {
	this.shareFile = shareFile;
}

public void setFilesForNavigation(List<ShareFile> filesForNavigation) {
	this.filesForNavigation = filesForNavigation;
}

public void setFolderTree(List<ShareFile> folderTree) {
	this.folderTree = folderTree;
}

public List<Group> getOtherGroups() {
	return otherGroups;
}

public void setOtherGroups(List<Group> otherGroups) {
	this.otherGroups = otherGroups;
}

public List<ShareFile> getFilesForNavigation() {
	return filesForNavigation;
}

public List<ShareFile> getFolderTree() {
	return folderTree;
}



public List<ShareFile> getMyshareFiles() {
	return myshareFiles;
}



public void setMyshareFiles(List<ShareFile> myshareFiles) {
	this.myshareFiles = myshareFiles;
}



public List<ShareFile> getSharefolderTree() {
	return sharefolderTree;
}



public void setSharefolderTree(List<ShareFile> sharefolderTree) {
	this.sharefolderTree = sharefolderTree;
}

}
