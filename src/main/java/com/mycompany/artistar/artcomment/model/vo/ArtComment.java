package com.mycompany.artistar.artcomment.model.vo;

public class ArtComment {
	private int art_comment_num;
	private int art_num;
	private String id;
	private String art_comment;
	private String art_comment_class;
	private String art_comment_order;
	private String art_comment_group;
	
	public ArtComment() {}

	public ArtComment(int art_comment_num, int art_num, String id, String art_comment, String art_comment_class,
			String art_comment_order, String art_comment_group) {
		super();
		this.art_comment_num = art_comment_num;
		this.art_num = art_num;
		this.id = id;
		this.art_comment = art_comment;
		this.art_comment_class = art_comment_class;
		this.art_comment_order = art_comment_order;
		this.art_comment_group = art_comment_group;
	}

	@Override
	public String toString() {
		return "ArtComment [art_comment_num=" + art_comment_num + ", art_num=" + art_num + ", id=" + id
				+ ", art_comment=" + art_comment + ", art_comment_class=" + art_comment_class + ", art_comment_order="
				+ art_comment_order + ", art_comment_group=" + art_comment_group + "]";
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

	public String getArt_comment_order() {
		return art_comment_order;
	}

	public void setArt_comment_order(String art_comment_order) {
		this.art_comment_order = art_comment_order;
	}

	public String getArt_comment_group() {
		return art_comment_group;
	}

	public void setArt_comment_group(String art_comment_group) {
		this.art_comment_group = art_comment_group;
	}
	
	
}
