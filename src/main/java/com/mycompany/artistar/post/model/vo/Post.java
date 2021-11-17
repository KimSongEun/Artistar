package com.mycompany.artistar.post.model.vo;

public class Post {
	private int post_num;
	private String id;
	private String post_content;
	
	public Post() {}

	public Post(int post_num, String id, String post_content) {
		super();
		this.post_num = post_num;
		this.id = id;
		this.post_content = post_content;
	}

	@Override
	public String toString() {
		return "Post [post_num=" + post_num + ", id=" + id + ", post_content=" + post_content + "]";
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

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	
	
}
