package com.mycompany.artistar.artcomment.model.vo;

public class ArtComment {
	private int art_comment_num;
	private int art_num;
	private String id;
	private String art_comment;
	private String art_comment_class;
	private String art_comment_group;
	private String art_comment_date;
	private String member_img;
	private String reply_to_id;
	
	public ArtComment() {}




	public ArtComment(int art_comment_num, int art_num, String id, String art_comment, String art_comment_class,
			String art_comment_group, String art_comment_date, String member_img, String reply_to_id) {
		super();
		this.art_comment_num = art_comment_num;
		this.art_num = art_num;
		this.id = id;
		this.art_comment = art_comment;
		this.art_comment_class = art_comment_class;
		this.art_comment_group = art_comment_group;
		this.art_comment_date = art_comment_date;
		this.member_img = member_img;
		this.reply_to_id = reply_to_id;
	}




	@Override
	public String toString() {
		return "ArtComment [art_comment_num=" + art_comment_num + ", art_num=" + art_num + ", id=" + id
				+ ", art_comment=" + art_comment + ", art_comment_class=" + art_comment_class + ", art_comment_group="
				+ art_comment_group + ", art_comment_date=" + art_comment_date + ", member_img=" + member_img
				+ ", reply_to_id=" + reply_to_id + "]";
	}




	public int getArt_comment_num() {
		return art_comment_num;
	}

	public void setArt_comment_num(int art_comment_num) {
		this.art_comment_num = art_comment_num;
	}

	public int getArt_num() {
		return art_num;
	}

	public void setArt_num(int art_num) {
		this.art_num = art_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getArt_comment() {
		return art_comment;
	}

	public void setArt_comment(String art_comment) {
		this.art_comment = art_comment;
	}

	public String getArt_comment_class() {
		return art_comment_class;
	}

	public void setArt_comment_class(String art_comment_class) {
		this.art_comment_class = art_comment_class;
	}

	public String getArt_comment_group() {
		return art_comment_group;
	}

	public void setArt_comment_group(String art_comment_group) {
		this.art_comment_group = art_comment_group;
	}


	public String getArt_comment_date() {
		return art_comment_date;
	}


	public void setArt_comment_date(String art_comment_date) {
		this.art_comment_date = art_comment_date;
	}


	public String getMember_img() {
		return member_img;
	}


	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}




	public String getReply_to_id() {
		return reply_to_id;
	}




	public void setReply_to_id(String reply_to_id) {
		this.reply_to_id = reply_to_id;
	}
	
	
	
	
	
}
