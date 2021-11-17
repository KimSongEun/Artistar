package com.mycompany.artistar.art_img.vo;

public class ArtImg {
	private int art_img_num;
	private int artinfo_num;
	private String art_img;
	
	public ArtImg() {}

	public ArtImg(int art_img_num, int artinfo_num, String art_img) {
		super();
		this.art_img_num = art_img_num;
		this.artinfo_num = artinfo_num;
		this.art_img = art_img;
	}

	@Override
	public String toString() {
		return "ArtImg [art_img_num=" + art_img_num + ", artinfo_num=" + artinfo_num + ", art_img=" + art_img + "]";
	}

	public int getArt_img_num() {
		return art_img_num;
	}

	public void setArt_img_num(int art_img_num) {
		this.art_img_num = art_img_num;
	}

	public int getArtinfo_num() {
		return artinfo_num;
	}

	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}

	public String getArt_img() {
		return art_img;
	}

	public void setArt_img(String art_img) {
		this.art_img = art_img;
	}
	
	
}
