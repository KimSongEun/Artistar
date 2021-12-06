package com.mycompany.artistar.post_like.vo;

public class PostLike {
	private int postNum;
	private String id;

	public PostLike() {
	}

	@Override
	public String toString() {
		return "PostLike [postNum=" + postNum + ", id=" + id + "]";
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
