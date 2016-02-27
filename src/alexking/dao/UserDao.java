package alexking.dao;

import java.util.List;

import alexking.domain.User;

public interface UserDao {
	public void add(User user);
	public void update(User user);
	public void delete(User user);
	public void deleteById(int bid);
	public List<User> list(int uid);
	public User findById(int uid);
	public User login(User user);
	public User regist(User user);
	public User findByUserName(String un);
}
