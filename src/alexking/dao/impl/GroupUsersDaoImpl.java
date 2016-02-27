package alexking.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import alexking.dao.GroupUsersDao;
import alexking.domain.GroupUsers;

public class GroupUsersDaoImpl implements GroupUsersDao{
	
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
	public void add(GroupUsers groupUsers) {
		getSession().save(groupUsers);
	}

	public void delete(GroupUsers groupUsers) {
		getSession().delete(groupUsers);
	}

	@Override
	public void deleteById(int id) {
		getSession().delete(getSession().get(GroupUsers.class, id));
		
	}
	public void update(GroupUsers groupUsers) {
		getSession().update(groupUsers);
	}

	/**
	 * 各种查询操作
	 */
	@SuppressWarnings("unchecked")
	public GroupUsers findById(int id) {
		List<GroupUsers> groupUsers = getSession().createQuery("from GroupUsers where id='" + id + "'").list();
		if(groupUsers.size()>0){
			return groupUsers.get(0);	
		}
		else{
			return null;			
		}	
	}

	public GroupUsers findByGidUid(int gid,int uid) {
		@SuppressWarnings("unchecked")
		List<GroupUsers> groupUsers = getSession().createQuery("from GroupUsers where groupId='" + gid + "' and userId='"+uid+"'").list();
		if(groupUsers.size()>0){
			return groupUsers.get(0);	
		}
		else{
			return null;			
		}	
	}

	
	public List<GroupUsers> list() {
		@SuppressWarnings("unchecked")
		List<GroupUsers>  list= getSession().createQuery("select count(*) from GroupUsers order by userId asc,groupId asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	
	
	@SuppressWarnings("unchecked")
	public List<GroupUsers> listByUserId(int uid) {
		List<GroupUsers>  list= getSession().createQuery("from GroupUsers where userId='"+uid+"' order by userId asc,groupId asc").list();
		System.out.println("list.size=="+list.size());
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}	
	
	@SuppressWarnings("unchecked")
	public List<GroupUsers> listByGroupId(int gid) {
		List<GroupUsers>  list= getSession().createQuery("from GroupUsers where groupId='"+gid+"' order by userId asc,groupId asc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}	
	
	
}
