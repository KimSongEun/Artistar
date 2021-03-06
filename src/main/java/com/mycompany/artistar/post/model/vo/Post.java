package com.mycompany.artistar.post.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.post_img.vo.PostImg;

@Component
public class Post {
	private int postNum;
	private String id;
	private String postContent;
	private String postDate;
	private List<PostImg> postImgList;
	private int postLikeCount;
	private int likeCheck;

	public Post() {
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", id=" + id + ", postContent=" + postContent + ", postDate=" + postDate
				+ ", postImgList=" + postImgList + ", postLikeCount=" + postLikeCount + ", likeCheck=" + likeCheck
				+ "]";
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

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public List<PostImg> getPostImgList() {
		return postImgList;
	}

	public void setPostImgList(List<PostImg> postImgList) {
		this.postImgList = postImgList;
	}

	public int getPostLikeCount() {
		return postLikeCount;
	}

	public void setPostLikeCount(int postLikeCount) {
		this.postLikeCount = postLikeCount;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

}
