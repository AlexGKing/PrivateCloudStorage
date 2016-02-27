package alexking.service.impl;

import java.util.List;

import alexking.dao.FileInfoDao;
import alexking.domain.FileInfo;
import alexking.service.FileInfoService;

public class FileInfoServiceImpl implements FileInfoService {
	private FileInfoDao fileInfoDao;

	public FileInfoDao getFileInfoDao() {
		return fileInfoDao;
	}

	public void setFileInfoDao(FileInfoDao fileInfoDao) {
		this.fileInfoDao = fileInfoDao;
	}

	@Override
	public void add(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		fileInfoDao.add(fileInfo);
		
	}

	@Override
	public void update(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		fileInfoDao.update(fileInfo);
		
	}

	@Override
	public void delete(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		fileInfoDao.delete(fileInfo);
		
	}

	@Override
	public void deleteById(int fid) {
		// TODO Auto-generated method stub
		fileInfoDao.deleteById(fid);
		
	}

	@Override
	public List<FileInfo> list(int fid) {
		// TODO Auto-generated method stub
		return fileInfoDao.list(fid);
	}

	@Override
	public FileInfo findById(int fid) {
		// TODO Auto-generated method stub
		return fileInfoDao.findById(fid);
	}

	@Override
	public List<FileInfo> queryUserFileList(int start, int end, int uid) {
		// TODO Auto-generated method stub
		return fileInfoDao.queryUserFileList(start, end, uid);
	}
	public List<FileInfo> queryFolderFileList(int fid){
		return fileInfoDao.queryFolderFileList(fid);
	}
	public List<FileInfo> queryFileList(int uid,int fid){
		return fileInfoDao.queryFileList(uid, fid);
	}
	public FileInfo findByPath(String path){
		return fileInfoDao.findByPath(path);
	}
	public List<FileInfo> getChildren(int fid){
		return fileInfoDao.getChildren(fid);
	}
	

}
