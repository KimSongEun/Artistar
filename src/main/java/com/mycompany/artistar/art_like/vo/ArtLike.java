package com.mycompany.artistar.art_like.vo;

public class ArtLike {
	private int art_like_num;
	private int artinfo_num;
	private String id;
	
	public ArtLike() {}

	public ArtLike(int art_like_num, int artinfo_num, String id) {
		super();
		this.art_like_num = art_like_num;
		this.artinfo_num = artinfo_num;
		this.id = id;
	}

	@Override
	public String toString() {
		return "ArtLike [art_like_num=" + art_like_num + ", artinfo_num=" + artinfo_num + ", id=" + id + "]";
	}

	public int getArt_like_num() {
		return art_like_num;
	}

	public void setArt_like_num(int art_like_num) {
		this.art_like_num = art_like_num;
	}

	public int getArtinfo_num() {
		return artinfo_num;
	}

	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
