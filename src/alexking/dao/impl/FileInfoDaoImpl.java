package alexking.dao.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


import alexking.dao.FileInfoDao;
import alexking.domain.FileInfo;


public class FileInfoDaoImpl implements FileInfoDao{
	
	private SessionFactory sessionFactory;
	private static final int BUFFER_SIZE=16*1024;

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
	public void add(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		getSession().save(fileInfo);
	}

	@Override
	public void delete(FileInfo fileInfo) {
		getSession().delete(fileInfo);
		// TODO Auto-generated method stub	
	}

	@Override
	public void deleteById(int fid) {
		getSession().delete(getSession().get(FileInfo.class, fid));
		// TODO Auto-generated method stub
		
	}

	
	@SuppressWarnings("unchecked")
	public FileInfo findById(int fid) {
		// TODO Auto-generated method stub
		List<FileInfo> files = getSession().createQuery("from FileInfo where id='" + fid + "'").list();
		if(files.size()>0){
//			System.out.println("The list.size is:"+list.size());
			return files.get(0);	
		}
		else{
			//System.out.println("The result is null");
			return null;			
		}	
	}

	
	public List<FileInfo> list(int fid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void update(FileInfo fileInfo) {
		System.out.println("The method FileInfo update() has been called!");
		getSession().update(fileInfo);
//		String sql = "update FileInfo set "; 
//		getSession().createSQLQuery(sql).executeUpdate(); 
		
		System.out.println("The fileInfo has been updated successfully!");
		
	}
	@SuppressWarnings("unchecked")
	public List<FileInfo> queryUserFileList(int start,int end, int uid){
		List<FileInfo>  list= getSession().createQuery("from FileInfo where userId='"+uid+"'"+" order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
//			System.out.println("The list.size is:"+list.size());
			return list;	
		}
		else{
			//System.out.println("The result is null");
			return null;			
		}	
	}
	
	
	public FileInfo findByPath(String path){
		path.trim();
		String[] temp=path.split("\\\\");
		String queryPath="";
		for(int i=1;i<temp.length;i++){
			queryPath+="\\\\";
			queryPath+=temp[i];			
		}
		queryPath.trim();
		
		@SuppressWarnings("unchecked")
		List<FileInfo>  list= getSession().createQuery("from FileInfo where filePath='"+queryPath+"'").list();
		if(list.size()>0){
			return list.get(0);	
		}
		else{
			return null;			
		}	
	}
	
	
	
	public List<FileInfo> queryFileList(int uid,int fid){
		@SuppressWarnings("unchecked")
		List<FileInfo>  list= getSession().createQuery("from FileInfo where userId='"+uid+"' and folderId='"+fid+"'"+" order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	
	public List<FileInfo> getChildren(int fid){
		@SuppressWarnings("unchecked")
//		List<FileInfo>  list= getSession().createQuery("from FileInfo where folderId='"+fid+"'"+" order by fileName asc").list();
		List<FileInfo>  list= getSession().createQuery("from FileInfo where fileType='"+ 0 +"' and folderId='"+fid+"'"+" order by uploadTime desc,fileName asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	
	
	
	
	public List<FileInfo> queryFolderFileList(int fid){
		@SuppressWarnings("unchecked")
		List<FileInfo>  list= getSession().createQuery("from FileInfo where folderId='"+fid+"'"+" order by fileType asc,uploadTime desc,fileName asc").list();
		if(list.size()>0){
		
			return list;	
		}
		else{
			//System.out.println("The result is null");
			return null;			
		}	
	}
	
	
	public long copyFile(File src, File dest) throws Exception {
        BufferedInputStream in = null;
        BufferedOutputStream out = null;
        byte[] buffer = new byte[BUFFER_SIZE];
        long total = 0;
        try {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dest), BUFFER_SIZE);
            int curSize = in.read(buffer);
            while (curSize > 0) {
                total += curSize;
                out.write(buffer, 0, curSize);
                curSize = in.read(buffer);
            }
        } catch (Exception e) {
 
        } finally {
            try {
                if (in != null) {
                    in.close();
                    in = null;
                }
                if (out != null) {
                    out.close();
                    out = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return total;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
