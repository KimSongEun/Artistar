package com.mycompany.artistar.follow.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Follow {
	private String id;
	private String followId;
	private int followCheck;

	public Follow() {
	}

	@Override
	public String toString() {
		return "Follow [id=" + id + ", followId=" + followId + ", followCheck=" + followCheck + "]";
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

	public int getFollowCheck() {
		return followCheck;
	}

	public void setFollowCheck(int followCheck) {
		this.followCheck = followCheck;
	}

}
