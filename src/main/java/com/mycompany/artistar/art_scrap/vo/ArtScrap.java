package com.mycompany.artistar.art_scrap.vo;

public class ArtScrap {
	private int art_scrap_num;
	private int artinfo_num;
	private String id;
	
	public ArtScrap () {}

	public ArtScrap(int art_scrap_num, int artinfo_num, String id) {
		super();
		this.art_scrap_num = art_scrap_num;
		this.artinfo_num = artinfo_num;
		this.id = id;
	}

	@Override
	public String toString() {
		return "ArtScrap [art_scrap_num=" + art_scrap_num + ", artinfo_num=" + artinfo_num + ", id=" + id + "]";
	}

	public int getArt_scrap_num() {
		return art_scrap_num;
	}

	public void setArt_scrap_num(int art_scrap_num) {
		this.art_scrap_num = art_scrap_num;
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
