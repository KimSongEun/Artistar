package com.mycompany.artistar.artist_update.vo;

public class ArtistUpdate {
	private int update_num;
	private int artist_num;
	private String id;
	private String artist_name;
	private String artist_intro;
	private String artist_country;
	private String artist_birth;
	private String artist_dead;
	private String artist_img;
	private String artist_detail;
	private char result;
	
	public ArtistUpdate() {}

	public ArtistUpdate(int update_num, int artist_num, String id, String artist_name, String artist_intro,
			String artist_country, String artist_birth, String artist_dead, String artist_img, String artist_detail,
			char result) {
		super();
		this.update_num = update_num;
		this.artist_num = artist_num;
		this.id = id;
		this.artist_name = artist_name;
		this.artist_intro = artist_intro;
		this.artist_country = artist_country;
		this.artist_birth = artist_birth;
		this.artist_dead = artist_dead;
		this.artist_img = artist_img;
		this.artist_detail = artist_detail;
		this.result = result;
	}

	@Override
	public String toString() {
		return "ArtistUpdate [update_num=" + update_num + ", artist_num=" + artist_num + ", id=" + id + ", artist_name="
				+ artist_name + ", artist_intro=" + artist_intro + ", artist_country=" + artist_country
				+ ", artist_birth=" + artist_birth + ", artist_dead=" + artist_dead + ", artist_img=" + artist_img
				+ ", artist_detail=" + artist_detail + ", result=" + result + "]";
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

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public String getArtist_intro() {
		return artist_intro;
	}

	public void setArtist_intro(String artist_intro) {
		this.artist_intro = artist_intro;
	}

	public String getArtist_country() {
		return artist_country;
	}

	public void setArtist_country(String artist_country) {
		this.artist_country = artist_country;
	}

	public String getArtist_birth() {
		return artist_birth;
	}

	public void setArtist_birth(String artist_birth) {
		this.artist_birth = artist_birth;
	}

	public String getArtist_dead() {
		return artist_dead;
	}

	public void setArtist_dead(String artist_dead) {
		this.artist_dead = artist_dead;
	}

	public String getArtist_img() {
		return artist_img;
	}

	public void setArtist_img(String artist_img) {
		this.artist_img = artist_img;
	}

	public String getArtist_detail() {
		return artist_detail;
	}

	public void setArtist_detail(String artist_detail) {
		this.artist_detail = artist_detail;
	}

	public char getResult() {
		return result;
	}

	public void setResult(char result) {
		this.result = result;
	}
	
	
}
