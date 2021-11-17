package com.mycompany.artistar.art_tag.vo;

public class ArtTag {
	private int art_tag_num;
	private int artinfo_num;
	private String art_tag_hash;
	
	public ArtTag() {}

	public ArtTag(int art_tag_num, int artinfo_num, String art_tag_hash) {
		super();
		this.art_tag_num = art_tag_num;
		this.artinfo_num = artinfo_num;
		this.art_tag_hash = art_tag_hash;
	}

	@Override
	public String toString() {
		return "ArtTag [art_tag_num=" + art_tag_num + ", artinfo_num=" + artinfo_num + ", art_tag_hash=" + art_tag_hash
				+ "]";
	}

	public int getArt_tag_num() {
		return art_tag_num;
	}

	public void setArt_tag_num(int art_tag_num) {
		this.art_tag_num = art_tag_num;
	}

	public int getArtinfo_num() {
		return artinfo_num;
	}

	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}

	public String getArt_tag_hash() {
		return art_tag_hash;
	}

	public void setArt_tag_hash(String art_tag_hash) {
		this.art_tag_hash = art_tag_hash;
	}
	
	
}
