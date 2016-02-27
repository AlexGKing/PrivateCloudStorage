package alexking.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import alexking.dao.UserDao;
import alexking.domain.User;


public class UserDaoImpl implements UserDao{
	
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
	public void add(User user) {
		getSession().save(user);
		
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(int bid) {
		// TODO Auto-generated method stub
		
	}

	
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public User findByUserName(String un) {
		@SuppressWarnings("unchecked")
		List<User> list= getSession().createQuery("from User where userName='"+un+"'").list();
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	
	public List<User> list(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public User login(User user) {
		@SuppressWarnings("unchecked")
		List<User> list= getSession().createQuery("from User where userName='"+user.getUserName()+"' and password='"+user.getPassword()+"'").list();
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	public User regist(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void update(User user) {
		// TODO Auto-generated method stub
		getSession().update(user);
	}

}
