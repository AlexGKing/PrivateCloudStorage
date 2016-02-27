package alexking.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import alexking.dao.ShareFileDao;
import alexking.domain.ShareFile;


public class ShareFileDaoImpl implements ShareFileDao{
	
	private SessionFactory sessionFactory;
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public void add(ShareFile shareFile) {
		getSession().save(shareFile);
	}

	@Override
	public void delete(ShareFile shareFile) {
		getSession().delete(shareFile);
	}

	@Override
	public void deleteById(int fid) {
		getSession().delete(getSession().get(ShareFile.class, fid));
	}

	
	@SuppressWarnings("unchecked")
	public ShareFile findById(int fid) {
		List<ShareFile> files = getSession().createQuery("from ShareFile where id='" + fid + "'").list();
		if(files.size()>0){
			return files.get(0);	
		}
		else{
			return null;			
		}	
	}
	
	
	@SuppressWarnings("unchecked")
	public ShareFile findRootFolder(String groupname) {
		List<ShareFile> files = getSession().createQuery("from ShareFile where fileName='" + groupname + "' and folderId='" + 0 + "'").list();
		if(files.size()>0){
			return files.get(0);	
		}
		else{
			return null;			
		}	
	}
	
	@SuppressWarnings("unchecked")
	public ShareFile findByGidFname(int gid,String filename) {
		List<ShareFile> files = getSession().createQuery("from ShareFile where groupId='" + gid + "' and fileName='" + filename + "'").list();
		if(files.size()>0){
			return files.get(0);	
		}
		else{
			return null;			
		}	
	}

	
	public List<ShareFile> list(int fid) {
		return null;
	}
	
	public void update(ShareFile shareFile) {
		getSession().update(shareFile);
	}

	
	public List<ShareFile> queryFileList(int gid,int fid){
		@SuppressWarnings("unchecked")
		List<ShareFile>  list= getSession().createQuery("from ShareFile where groupId='"+gid+"' and folderId='"+fid+"'"+" order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	
	public List<ShareFile> getChildren(int fid){
		@SuppressWarnings("unchecked")
		List<ShareFile>  list= getSession().createQuery("from ShareFile where fileType='"+ 0 +"' and folderId='"+fid+"'"+" order by uploadTime desc,fileName asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	public List<ShareFile> queryFolderFileList(int fid){
		@SuppressWarnings("unchecked")
		List<ShareFile>  list= getSession().createQuery("from ShareFile where folderId='"+fid+"'"+" order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
		
			return list;	
		}
		else{
			return null;			
		}	
	}
	public List<ShareFile> getUserShareFiles(int uid){
		@SuppressWarnings("unchecked")
		List<ShareFile>  list= getSession().createQuery("from ShareFile where userId='"+uid+"'"+" and fileType='1'  order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}


	

}
