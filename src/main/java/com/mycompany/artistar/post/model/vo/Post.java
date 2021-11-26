package com.mycompany.artistar.post.model.vo;

public class Post {
	private int postNum;
	private String id;
	private String postContent;
	private int postImgNum;
	private String postImg;
	
	public Post() {}
	
	public Post(int postNum, String id, String postContent) {
		super();
		this.postNum = postNum;
		this.id = id;
		this.postContent = postContent;
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", id=" + id + ", postContent=" + postContent + "]";
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

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

}
