package com.mycompany.artistar.follower.vo;

public class Follower {
	private int follower_num;
	private String id;
	private String follower_id;
	private String follower_date;
	
	public Follower() {}

	public Follower(int follower_num, String id, String follower_id, String follower_date) {
		super();
		this.follower_num = follower_num;
		this.id = id;
		this.follower_id = follower_id;
		this.follower_date = follower_date;
	}

	@Override
	public String toString() {
		return "Follower [follower_num=" + follower_num + ", id=" + id + ", follower_id=" + follower_id
				+ ", follower_date=" + follower_date + "]";
	}

	public int getFollower_num() {
		return follower_num;
	}

	public void setFollower_num(int follower_num) {
		this.follower_num = follower_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFollower_id() {
		return follower_id;
	}

	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}

	public String getFollower_date() {
		return follower_date;
	}

	public void setFollower_date(String follower_date) {
		this.follower_date = follower_date;
	}
	
	
}
