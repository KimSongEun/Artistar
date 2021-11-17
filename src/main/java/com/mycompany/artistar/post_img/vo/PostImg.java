package com.mycompany.artistar.post_img.vo;

public class PostImg {
	private int post_img_num;
	private int post_num;
	private String post_img;
	
	public PostImg() {}

	public PostImg(int post_img_num, int post_num, String post_img) {
		super();
		this.post_img_num = post_img_num;
		this.post_num = post_num;
		this.post_img = post_img;
	}

	@Override
	public String toString() {
		return "PostImg [post_img_num=" + post_img_num + ", post_num=" + post_num + ", post_img=" + post_img + "]";
	}

	public int getPost_img_num() {
		return post_img_num;
	}

	public void setPost_img_num(int post_img_num) {
		this.post_img_num = post_img_num;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getPost_img() {
		return post_img;
	}

	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	
	
	
}
