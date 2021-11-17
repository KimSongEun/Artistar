package com.mycompany.artistar.artinfo.model.vo;

public class ArtInfo {
	private int artinfo_num;
	private int artist_num;
	private String artinfo_name;
	private String artinfo_year;
	private String artinfo_trend;
	private String artinfo_kind;
	private String artinfo_technic;
	private String artinfo_size;
	private String artinfo_collection;
	private String artinfo_etc;
	private String artinfo_date;
	private String artinfo_datil;
	
	public ArtInfo() {}

	public ArtInfo(int artinfo_num, int artist_num, String artinfo_name, String artinfo_year, String artinfo_trend,
			String artinfo_kind, String artinfo_technic, String artinfo_size, String artinfo_collection,
			String artinfo_etc, String artinfo_date, String artinfo_datil) {
		super();
		this.artinfo_num = artinfo_num;
		this.artist_num = artist_num;
		this.artinfo_name = artinfo_name;
		this.artinfo_year = artinfo_year;
		this.artinfo_trend = artinfo_trend;
		this.artinfo_kind = artinfo_kind;
		this.artinfo_technic = artinfo_technic;
		this.artinfo_size = artinfo_size;
		this.artinfo_collection = artinfo_collection;
		this.artinfo_etc = artinfo_etc;
		this.artinfo_date = artinfo_date;
		this.artinfo_datil = artinfo_datil;
	}

	@Override
	public String toString() {
		return "ArtInfo [artinfo_num=" + artinfo_num + ", artist_num=" + artist_num + ", artinfo_name=" + artinfo_name
				+ ", artinfo_year=" + artinfo_year + ", artinfo_trend=" + artinfo_trend + ", artinfo_kind="
				+ artinfo_kind + ", artinfo_technic=" + artinfo_technic + ", artinfo_size=" + artinfo_size
				+ ", artinfo_collection=" + artinfo_collection + ", artinfo_etc=" + artinfo_etc + ", artinfo_date="
				+ artinfo_date + ", artinfo_datil=" + artinfo_datil + "]";
	}

	public int getArtinfo_num() {
		return artinfo_num;
	}

	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getArtinfo_name() {
		return artinfo_name;
	}

	public void setArtinfo_name(String artinfo_name) {
		this.artinfo_name = artinfo_name;
	}

	public String getArtinfo_year() {
		return artinfo_year;
	}

	public void setArtinfo_year(String artinfo_year) {
		this.artinfo_year = artinfo_year;
	}

	public String getArtinfo_trend() {
		return artinfo_trend;
	}

	public void setArtinfo_trend(String artinfo_trend) {
		this.artinfo_trend = artinfo_trend;
	}

	public String getArtinfo_kind() {
		return artinfo_kind;
	}

	public void setArtinfo_kind(String artinfo_kind) {
		this.artinfo_kind = artinfo_kind;
	}

	public String getArtinfo_technic() {
		return artinfo_technic;
	}

	public void setArtinfo_technic(String artinfo_technic) {
		this.artinfo_technic = artinfo_technic;
	}

	public String getArtinfo_size() {
		return artinfo_size;
	}

	public void setArtinfo_size(String artinfo_size) {
		this.artinfo_size = artinfo_size;
	}

	public String getArtinfo_collection() {
		return artinfo_collection;
	}

	public void setArtinfo_collection(String artinfo_collection) {
		this.artinfo_collection = artinfo_collection;
	}

	public String getArtinfo_etc() {
		return artinfo_etc;
	}

	public void setArtinfo_etc(String artinfo_etc) {
		this.artinfo_etc = artinfo_etc;
	}

	public String getArtinfo_date() {
		return artinfo_date;
	}

	public void setArtinfo_date(String artinfo_date) {
		this.artinfo_date = artinfo_date;
	}

	public String getArtinfo_datil() {
		return artinfo_datil;
	}

	public void setArtinfo_datil(String artinfo_datil) {
		this.artinfo_datil = artinfo_datil;
	}
	
	

	
	
}
