package alexking.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import alexking.dao.GroupAdminsDao;
import alexking.domain.GroupAdmins;

public class GroupAdminsDaoImpl implements GroupAdminsDao{
	
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

	/**
	 * 基础增删改操作
	 */
	public void add(GroupAdmins groupAdmins) {
		getSession().save(groupAdmins);
	}

	public void delete(GroupAdmins groupAdmins) {
		getSession().delete(groupAdmins);
	}

	@Override
	public void deleteById(int id) {
		getSession().delete(getSession().get(GroupAdmins.class, id));
		
	}
	public void update(GroupAdmins groupAdmins) {
		getSession().update(groupAdmins);
	}

	/**
	 * 各种查询操作
	 */
	@SuppressWarnings("unchecked")
	public GroupAdmins findById(int id) {
		List<GroupAdmins> groups = getSession().createQuery("from GroupAdmins where id='" + id + "'").list();
		if(groups.size()>0){
			return groups.get(0);	
		}
		else{
			return null;			
		}	
	}

	
	public List<GroupAdmins> list() {
		@SuppressWarnings("unchecked")
		List<GroupAdmins>  list= getSession().createQuery("select count(*) from GroupAdmins order by adminId asc,groupId asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	public boolean isAdmin(int uid,int gid){
		@SuppressWarnings("unchecked")
		List<GroupAdmins>  list= getSession().createQuery("from GroupAdmins where adminId='"+uid+"' and groupId='"+gid+"'").list();
		if(list.size()>0){
			return true;	
		}
		else{
			return false;			
		}	
		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<GroupAdmins> listByUserId(int uid) {
		List<GroupAdmins>  list= getSession().createQuery("from GroupAdmins where adminId='"+uid+"' order by adminId asc,groupId asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}	
	
	@SuppressWarnings("unchecked")
	public List<GroupAdmins> listByGroupId(int gid) {
		List<GroupAdmins>  list= getSession().createQuery("from GroupAdmins where groupId='"+gid+"' order by adminId asc,groupId asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}	
	
	
}
