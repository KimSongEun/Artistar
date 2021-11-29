package com.mycompany.artistar.follow.vo;

import java.util.List;

public class Follow {
	private int followNum;
	private String id;
	private String followId;
	private String followDate;
	private List<Follow> followIdList;
	
	public Follow() {}

	public Follow(int followNum, String id, String followId, String followDate, List<Follow> followIdList) {
		super();
		this.followNum = followNum;
		this.id = id;
		this.followId = followId;
		this.followDate = followDate;
		this.followIdList = followIdList;
	}

	@Override
	public String toString() {
		return "Follow [followNum=" + followNum + ", id=" + id + ", followId=" + followId + ", followDate=" + followDate
				+ ", followIdList=" + followIdList + "]";
	}

	public int getFollowNum() {
		return followNum;
	}

	public void setFollowNum(int followNum) {
		this.followNum = followNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFollowId() {
		return followId;
	}

	public void setFollowId(String followId) {
		this.followId = followId;
	}

	public String getFollowDate() {
		return followDate;
	}

	public void setFollowDate(String followDate) {
		this.followDate = followDate;
	}

	public List<Follow> getFollowIdList() {
		return followIdList;
	}

	public void setFollowIdList(List<Follow> followIdList) {
		this.followIdList = followIdList;
	}
	
}
