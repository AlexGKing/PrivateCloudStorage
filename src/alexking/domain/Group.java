package alexking.domain;

import java.util.Date;

public class Group {
	private Integer id;
	private String groupName;
	private Integer ownnerId ;
	private Date createTime;
	private Integer userCount;
	private Integer fileCount;
	private Integer space;
	private Integer usedSpace;
	private String comment;
	
	/**
	 * 
	 * Getters and Setters
	 */
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Integer getOwnnerId() {
		return ownnerId;
	}
	public void setOwnnerId(Integer ownnerId) {
		this.ownnerId = ownnerId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getUserCount() {
		return userCount;
	}
	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}
	public Integer getFileCount() {
		return fileCount;
	}
	public void setFileCount(Integer fileCount) {
		this.fileCount = fileCount;
	}
	public Integer getSpace() {
		return space;
	}
	public void setSpace(Integer space) {
		this.space = space;
	}
	public Integer getUsedSpace() {
		return usedSpace;
	}
	public void setUsedSpace(Integer usedSpace) {
		this.usedSpace = usedSpace;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	
}
