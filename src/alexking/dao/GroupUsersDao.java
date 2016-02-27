package alexking.dao;

import java.util.List;

import alexking.domain.GroupUsers;

public interface GroupUsersDao {
	public void add(GroupUsers groupUsers);
	public void update(GroupUsers groupUsers);
	public void delete(GroupUsers groupUsers);
	public void deleteById(int gid);
	public GroupUsers findById(int gid);
	public List<GroupUsers> list();
	public List<GroupUsers> listByGroupId(int gid);
	public List<GroupUsers> listByUserId(int uid);
	public GroupUsers findByGidUid(int gid,int uid);
}
