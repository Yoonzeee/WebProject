package memberManagement;

import java.sql.Date;

public class MemberBean {
	private String uid;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Date joinDate;
	
	public MemberBean(String uid, String pwd, String name, String phone, String email, Date joinDate) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
	}
	public MemberBean(String uid, String pwd, String name, String phone, String email) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
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
	
	
}
