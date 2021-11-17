package com.mycompany.artistar.artinfo_update.vo;

public class ArtInfoUpdate {
	private int update_num;
	private int artist_num;
	private String id;
	private String artinfo_name;
	private String artinfo_year;
	private String artinfo_trend;
	private String artinfo_kind;
	private String artinfo_technic;
	private String artinfo_size;
	private String artinfo_collection;
	private String artinfo_detail;
	private char result;
	
	public ArtInfoUpdate() {}

	public ArtInfoUpdate(int update_num, int artist_num, String id, String artinfo_name, String artinfo_year,
			String artinfo_trend, String artinfo_kind, String artinfo_technic, String artinfo_size,
			String artinfo_collection, String artinfo_detail, char result) {
		super();
		this.update_num = update_num;
		this.artist_num = artist_num;
		this.id = id;
		this.artinfo_name = artinfo_name;
		this.artinfo_year = artinfo_year;
		this.artinfo_trend = artinfo_trend;
		this.artinfo_kind = artinfo_kind;
		this.artinfo_technic = artinfo_technic;
		this.artinfo_size = artinfo_size;
		this.artinfo_collection = artinfo_collection;
		this.artinfo_detail = artinfo_detail;
		this.result = result;
	}

	@Override
	public String toString() {
		return "ArtInfoUpdate [update_num=" + update_num + ", artist_num=" + artist_num + ", id=" + id
				+ ", artinfo_name=" + artinfo_name + ", artinfo_year=" + artinfo_year + ", artinfo_trend="
				+ artinfo_trend + ", artinfo_kind=" + artinfo_kind + ", artinfo_technic=" + artinfo_technic
				+ ", artinfo_size=" + artinfo_size + ", artinfo_collection=" + artinfo_collection + ", artinfo_detail="
				+ artinfo_detail + ", result=" + result + "]";
	}

	public int getUpdate_num() {
		return update_num;
	}

	public void setUpdate_num(int update_num) {
		this.update_num = update_num;
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getArtinfo_detail() {
		return artinfo_detail;
	}

	public void setArtinfo_detail(String artinfo_detail) {
		this.artinfo_detail = artinfo_detail;
	}

	public char getResult() {
		return result;
	}

	public void setResult(char result) {
		this.result = result;
	}
	
	
}
