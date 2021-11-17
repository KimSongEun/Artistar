package com.mycompany.artistar.post_like.vo;

public class PostLike {
	private int post_like_num;
	private int post_num;
	private String id;
	public PostLike(int post_like_num, int post_num, String id) {
		super();
		this.post_like_num = post_like_num;
		this.post_num = post_num;
		this.id = id;
	}
	
	public PostLike() {}

	@Override
	public String toString() {
		return "PostLike [post_like_num=" + post_like_num + ", post_num=" + post_num + ", id=" + id + "]";
	}

	public int getPost_like_num() {
		return post_like_num;
	}

	public void setPost_like_num(int post_like_num) {
		this.post_like_num = post_like_num;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
