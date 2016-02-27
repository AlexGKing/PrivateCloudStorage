package alexking.dao;

import java.util.List;

import alexking.domain.FileInfo;

public interface FileInfoDao {
	public void add(FileInfo fileInfo);
	public void update(FileInfo fileInfo);
	public void delete(FileInfo fileInfo);
	public void deleteById(int fid);
	public List<FileInfo> list(int fid);
	public FileInfo findById(int fid);
	public List<FileInfo> queryUserFileList(int start,int end, int uid);
	public List<FileInfo> queryFolderFileList(int fid);
	public List<FileInfo> queryFileList(int uid,int fid);
	public FileInfo findByPath(String path);
	public List<FileInfo> getChildren(int fid);
}
