package alexking.service.impl;

import java.util.List;

import alexking.dao.GroupUsersDao;
import alexking.domain.GroupUsers;
import alexking.service.GroupUsersService;

public class GroupUsersServiceImpl implements GroupUsersService{
	private GroupUsersDao groupUsersDao;

	public GroupUsersDao getGroupUsersDao() {
		return groupUsersDao;
	}

	public void setGroupUsersDao(GroupUsersDao groupUsersDao) {
		this.groupUsersDao = groupUsersDao;
	}

	@Override
	public void add(GroupUsers groupUsers) {
		groupUsersDao.add(groupUsers);		
	}

	@Override
	public void update(GroupUsers groupUsers) {
		groupUsersDao.update(groupUsers);
		
	}

	@Override
	public void delete(GroupUsers groupUsers) {
		groupUsersDao.delete(groupUsers);		
	}

	@Override
	public void deleteById(int gid) {
		groupUsersDao.deleteById(gid);		
	}

	@Override
	public GroupUsers findById(int gid) {
		return groupUsersDao.findById(gid);
	}

	@Override
	public List<GroupUsers> list() {
		return groupUsersDao.list();
	}


	@Override
	public List<GroupUsers> listByGroupId(int gid) {
		return groupUsersDao.listByGroupId(gid);
	}

	@Override
	public List<GroupUsers> listByUserId(int uid) {
		return groupUsersDao.listByUserId(uid);
	}
	public GroupUsers findByGidUid(int gid,int uid){
		return groupUsersDao.findByGidUid(gid, uid);
	}

}
