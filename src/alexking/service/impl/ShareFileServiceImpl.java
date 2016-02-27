package alexking.service.impl;

import java.util.List;

import alexking.dao.ShareFileDao;
import alexking.domain.ShareFile;
import alexking.service.ShareFileService;

public class ShareFileServiceImpl implements ShareFileService {
	private ShareFileDao shareFileDao;

	public ShareFileDao getShareFileDao() {
		return shareFileDao;
	}

	public void setShareFileDao(ShareFileDao shareFileDao) {
		this.shareFileDao = shareFileDao;
	}

	@Override
	public void add(ShareFile shareFile) {
		shareFileDao.add(shareFile);

	}

	@Override
	public void update(ShareFile shareFile) {
		shareFileDao.update(shareFile);

	}

	@Override
	public void delete(ShareFile shareFile) {
		shareFileDao.delete(shareFile);

	}

	@Override
	public void deleteById(int fid) {
		shareFileDao.deleteById(fid);

	}

	@Override
	public List<ShareFile> list(int fid) {

		return shareFileDao.list(fid);
	}

	@Override
	public ShareFile findById(int fid) {

		return shareFileDao.findById(fid);
	}

	@Override
	public List<ShareFile> queryFolderFileList(int fid) {

		return shareFileDao.queryFolderFileList(fid);
	}

	@Override
	public List<ShareFile> queryFileList(int uid, int fid) {

		return shareFileDao.queryFileList(uid, fid);
	}

	@Override
	public List<ShareFile> getChildren(int fid) {

		return shareFileDao.getChildren(fid);
	}
	public ShareFile findRootFolder(String groupname){
		return shareFileDao.findRootFolder(groupname);
	}
	public ShareFile findByGidFname(int gid,String filename){
		return shareFileDao.findByGidFname(gid, filename);
				
	}
	public List<ShareFile> getUserShareFiles(int uid){
		return shareFileDao.getUserShareFiles(uid);
	}

}
