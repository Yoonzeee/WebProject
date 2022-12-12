package memberManagement;

import java.sql.Date;

public class MemberBean {
	private String uid;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Date joinDate;
	private int available;
	private int admin;
	
	public MemberBean(String uid, String pwd, String name, String phone, String email, Date joinDate, int available, int admin) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
		this.available = available;
		this.admin = admin;
	}
	
	public MemberBean() {
		super();
	}
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
}
