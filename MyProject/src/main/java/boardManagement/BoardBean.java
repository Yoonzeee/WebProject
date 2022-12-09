package boardManagement;

import java.sql.Date;

public class BoardBean {
	private int bno;
	private String category;
	private String title;
	private String content;
	private String uid;
	private Date writeDate;
	private int viewCount;
	
	public BoardBean(int bno, String category, String title, String content, String uid, Date writeDate, int viewCount) {
		super();
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.uid = uid;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
	}
	
	public BoardBean() {
		super();
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}

	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
}
