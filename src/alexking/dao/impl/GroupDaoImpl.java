package alexking.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import alexking.dao.GroupDao;
import alexking.domain.Group;

public class GroupDaoImpl implements GroupDao{
	
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
	@Override
	public void add(Group group) {
		getSession().save(group);
	}

	@Override
	public void delete(Group group) {
		getSession().delete(group);
	}

	@Override
	public void deleteById(int gid) {
		getSession().delete(getSession().get(Group.class, gid));
		
	}
	public void update(Group group) {
		getSession().update(group);
	}

	/**
	 * 各种查询操作
	 */
	@SuppressWarnings("unchecked")
	public Group findById(int gid) {
		List<Group> groups = getSession().createQuery("from Group where id='" + gid + "'").list();
		if(groups.size()>0){
			return groups.get(0);	
		}
		else{
			return null;			
		}	
	}

	
	public List<Group> list() {
		@SuppressWarnings("unchecked")
		//List<Group>  list= getSession().createQuery("select count(*) from Group order by groupName asc,createTime desc").list();
		List<Group>  list= getSession().createQuery("from Group").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Group> list(int uid) {
		List<Group>  list= getSession().createQuery("from Group where ownnerId='"+uid+"' order by groupName asc,createTime desc").list();
		if(list.size()>0){
			return list;	
		}
		else{
			return null;			
		}	
	}	


	

}
