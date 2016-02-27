package alexking.service.impl;

import java.util.List;

import alexking.dao.GroupAdminsDao;
import alexking.domain.GroupAdmins;
import alexking.service.GroupAdminsService;


public class GroupAdminsServiceImpl implements GroupAdminsService{
	private GroupAdminsDao groupAdminsDao;

	public GroupAdminsDao getGroupAdminsDao() {
		return groupAdminsDao;
	}

	public void setGroupAdminsDao(GroupAdminsDao groupAdminsDao) {
		this.groupAdminsDao = groupAdminsDao;
	}

	@Override
	public void add(GroupAdmins groupAdmins) {
		groupAdminsDao.add(groupAdmins);		
	}

	@Override
	public void update(GroupAdmins groupAdmins) {
		groupAdminsDao.update(groupAdmins);
		
	}

	@Override
	public void delete(GroupAdmins groupAdmins) {
		groupAdminsDao.delete(groupAdmins);		
	}

	@Override
	public void deleteById(int gid) {
		groupAdminsDao.deleteById(gid);		
	}

	@Override
	public GroupAdmins findById(int gid) {
		return groupAdminsDao.findById(gid);
	}

	@Override
	public List<GroupAdmins> list() {
		return groupAdminsDao.list();
	}


	@Override
	public List<GroupAdmins> listByGroupId(int gid) {
		return groupAdminsDao.listByGroupId(gid);
	}

	@Override
	public List<GroupAdmins> listByUserId(int uid) {
		return groupAdminsDao.listByUserId(uid);
	}
	public boolean isAdmin(int uid,int gid){
		return groupAdminsDao.isAdmin(uid, gid);
		
	}

}
