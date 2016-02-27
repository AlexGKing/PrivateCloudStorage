package alexking.service;

import java.util.List;
import alexking.domain.ShareFile;

public interface ShareFileService {
	public void add(ShareFile shareFile);
	public void update(ShareFile shareFile);
	public void delete(ShareFile shareFile);
	public void deleteById(int fid);
	public List<ShareFile> list(int fid);
	public ShareFile findById(int fid);
	public List<ShareFile> queryFolderFileList(int fid);
	public List<ShareFile> queryFileList(int uid,int fid);
	public List<ShareFile> getChildren(int fid);
	public ShareFile findRootFolder(String groupname);
	public ShareFile findByGidFname(int gid,String filename);
	public List<ShareFile> getUserShareFiles(int uid);
}
