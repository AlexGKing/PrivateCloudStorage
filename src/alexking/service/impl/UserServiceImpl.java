package alexking.service.impl;

import java.util.List;

import alexking.dao.UserDao;
import alexking.domain.User;
import alexking.service.UserService;


public class UserServiceImpl implements UserService{
private UserDao userDao;

	@Override
	public void add(User user) {
		userDao.add(user);
		
	}
	public User findByUserName(String un){
		return userDao.findByUserName(un);
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(int bid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> list(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public User regist(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(User user) {
		userDao.update(user);
		
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

}
