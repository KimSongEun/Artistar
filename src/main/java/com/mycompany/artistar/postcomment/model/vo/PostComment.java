package com.mycompany.artistar.postcomment.model.vo;

public class PostComment {
	private int postCommentNum;
	private String postComment;
	private int postNum;
	private String id;
	private String postCommentDate;
	private String member_img;

	public PostComment() {
	}

	@Override
	public String toString() {
		return "PostComment [postCommentNum=" + postCommentNum + ", postComment=" + postComment + ", postNum=" + postNum
				+ ", id=" + id + ", postCommentDate=" + postCommentDate + ", member_img=" + member_img + "]";
	}

	public int getPostCommentNum() {
		return postCommentNum;
	}

	public void setPostCommentNum(int postCommentNum) {
		this.postCommentNum = postCommentNum;
	}

	public String getPostComment() {
		return postComment;
	}

	public void setPostComment(String postComment) {
		this.postComment = postComment;
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

	public String getPostCommentDate() {
		return postCommentDate;
	}

	public void setPostCommentDate(String postCommentDate) {
		this.postCommentDate = postCommentDate;
	}

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}

}
