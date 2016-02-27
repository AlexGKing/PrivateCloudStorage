package alexking.domain;
import java.util.Date;
public class User {
	/*
	 *Defined the para
	 */
	private Integer id;
	private String userName;
	private String password;
	private Integer space;
	private Integer usedSpace;
	private Date createTime;
	private String email;
	private Integer fileCount;
	
	/*
	 * 
	 * Getters and Setters
	 */
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getFileCount() {
		return fileCount;
	}
	public void setFileCount(Integer fileCount) {
		this.fileCount = fileCount;
	}

	
	
	

}
