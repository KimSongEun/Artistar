package com.mycompany.artistar.follow.vo;

public class Follow {
	private int follow_num;
	private String id;
	private String follow_id;
	private String follow_date;
	
	public Follow() {}

	public Follow(int follow_num, String id, String follow_id, String follow_date) {
		super();
		this.follow_num = follow_num;
		this.id = id;
		this.follow_id = follow_id;
		this.follow_date = follow_date;
	}

	@Override
	public String toString() {
		return "Follow [follow_num=" + follow_num + ", id=" + id + ", follow_id=" + follow_id + ", follow_date="
				+ follow_date + "]";
	}

	public int getFollow_num() {
		return follow_num;
	}

	public void setFollow_num(int follow_num) {
		this.follow_num = follow_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFollow_id() {
		return follow_id;
	}

	public void setFollow_id(String follow_id) {
		this.follow_id = follow_id;
	}

	public String getFollow_date() {
		return follow_date;
	}

	public void setFollow_date(String follow_date) {
		this.follow_date = follow_date;
	}
	
	
}
