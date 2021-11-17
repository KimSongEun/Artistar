package com.mycompany.artistar.post_tag.vo;

public class PostTag {
	private int post_tag_num;
	private int post_num;
	private String post_tag_hash;
	
	public PostTag() {}

	public PostTag(int post_tag_num, int post_num, String post_tag_hash) {
		super();
		this.post_tag_num = post_tag_num;
		this.post_num = post_num;
		this.post_tag_hash = post_tag_hash;
	}

	@Override
	public String toString() {
		return "PostTag [post_tag_num=" + post_tag_num + ", post_num=" + post_num + ", post_tag_hash=" + post_tag_hash
				+ "]";
	}

	public int getPost_tag_num() {
		return post_tag_num;
	}

	public void setPost_tag_num(int post_tag_num) {
		this.post_tag_num = post_tag_num;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getPost_tag_hash() {
		return post_tag_hash;
	}

	public void setPost_tag_hash(String post_tag_hash) {
		this.post_tag_hash = post_tag_hash;
	}
	
	
}
