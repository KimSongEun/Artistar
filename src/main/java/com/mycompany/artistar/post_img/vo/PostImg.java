package com.mycompany.artistar.post_img.vo;

import org.springframework.stereotype.Component;

@Component
public class PostImg {
	private int postImgNum;
	private int postNum;
	private String postImg;
	
	public PostImg() {}

	public PostImg(int postImgNum, int postNum, String postImg) {
		super();
		this.postImgNum = postImgNum;
		this.postNum = postNum;
		this.postImg = postImg;
	}

	@Override
	public String toString() {
		return "PostImg [postImgNum=" + postImgNum + ", postNum=" + postNum + ", postImg=" + postImg + "]";
	}

	public int getPostImgNum() {
		return postImgNum;
	}

	public void setPostImgNum(int postImgNum) {
		this.postImgNum = postImgNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	
	
}
