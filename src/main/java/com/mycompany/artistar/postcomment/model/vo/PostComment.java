package com.mycompany.artistar.postcomment.model.vo;

public class PostComment {
	private int post_comment_num;
	private String id;
	private String post_comment;
	private String post_comment_class;
	private String post_comment_order;
	private String post_comment_group;
	
	public PostComment() {}

	public PostComment(int post_comment_num, String id, String post_comment, String post_comment_class,
			String post_comment_order, String post_comment_group) {
		super();
		this.post_comment_num = post_comment_num;
		this.id = id;
		this.post_comment = post_comment;
		this.post_comment_class = post_comment_class;
		this.post_comment_order = post_comment_order;
		this.post_comment_group = post_comment_group;
	}

	@Override
	public String toString() {
		return "PostComment [post_comment_num=" + post_comment_num + ", id=" + id + ", post_comment=" + post_comment
				+ ", post_comment_class=" + post_comment_class + ", post_comment_order=" + post_comment_order
				+ ", post_comment_group=" + post_comment_group + "]";
	}

	public int getPost_comment_num() {
		return post_comment_num;
	}

	public void setPost_comment_num(int post_comment_num) {
		this.post_comment_num = post_comment_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPost_comment() {
		return post_comment;
	}

	public void setPost_comment(String post_comment) {
		this.post_comment = post_comment;
	}

	public String getPost_comment_class() {
		return post_comment_class;
	}

	public void setPost_comment_class(String post_comment_class) {
		this.post_comment_class = post_comment_class;
	}

	public String getPost_comment_order() {
		return post_comment_order;
	}

	public void setPost_comment_order(String post_comment_order) {
		this.post_comment_order = post_comment_order;
	}

	public String getPost_comment_group() {
		return post_comment_group;
	}

	public void setPost_comment_group(String post_comment_group) {
		this.post_comment_group = post_comment_group;
	}
	
	
	
}
