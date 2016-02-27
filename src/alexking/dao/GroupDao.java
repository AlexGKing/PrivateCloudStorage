package alexking.dao;

import java.util.List;

import alexking.domain.Group;

public interface GroupDao {
	public void add(Group group);
	public void update(Group group);
	public void delete(Group group);
	public void deleteById(int gid);
	public Group findById(int gid);
	public List<Group> list();
	public List<Group> list(int uid);
}
