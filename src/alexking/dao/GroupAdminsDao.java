package alexking.dao;

import java.util.List;

import alexking.domain.GroupAdmins;

public interface GroupAdminsDao {
	public void add(GroupAdmins groupAdmins);
	public void update(GroupAdmins groupAdmins);
	public void delete(GroupAdmins groupAdmins);
	public void deleteById(int gid);
	public GroupAdmins findById(int gid);
	public List<GroupAdmins> list();
	public List<GroupAdmins> listByGroupId(int gid);
	public List<GroupAdmins> listByUserId(int uid);
	public boolean isAdmin(int uid,int gid);
}
