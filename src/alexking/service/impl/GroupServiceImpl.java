package alexking.service.impl;

import java.util.List;

import alexking.dao.GroupDao;
import alexking.domain.Group;
import alexking.service.GroupService;

public class GroupServiceImpl implements GroupService{
	private GroupDao groupDao;

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	@Override
	public void add(Group group) {
		groupDao.add(group);		
	}

	@Override
	public void update(Group group) {
		groupDao.update(group);
		
	}

	@Override
	public void delete(Group group) {
		groupDao.delete(group);		
	}

	@Override
	public void deleteById(int gid) {
		groupDao.deleteById(gid);		
	}

	@Override
	public Group findById(int gid) {
		return groupDao.findById(gid);
	}

	@Override
	public List<Group> list() {
		return groupDao.list();
	}

	@Override
	public List<Group> list(int uid) {
		return groupDao.list(uid);
	}

}
