package com.mycompany.artistar.artist.model.vo;

public class Artist {
	private int artist_num;
	private String artist_name;
	private String artist_intro;
	private String artist_country;
	private char artist_gender;
	private String artist_birth;
	private String artist_dead;
	private String artist_img;
	private String artist_etc;
	
	public Artist() {}

	
	public Artist(int artist_num, String artist_name, String artist_intro, String artist_country, char artist_gender,
			String artist_birth, String artist_dead, String artist_img, String artist_etc) {
		super();
		this.artist_num = artist_num;
		this.artist_name = artist_name;
		this.artist_intro = artist_intro;
		this.artist_country = artist_country;
		this.artist_gender = artist_gender;
		this.artist_birth = artist_birth;
		this.artist_dead = artist_dead;
		this.artist_img = artist_img;
		this.artist_etc = artist_etc;
	}


	@Override
	public String toString() {
		return "Artist [artist_num=" + artist_num + ", artist_name=" + artist_name + ", artist_intro=" + artist_intro
				+ ", artist_country=" + artist_country + ", artist_gender=" + artist_gender + ", artist_birth="
				+ artist_birth + ", artist_dead=" + artist_dead + ", artist_img=" + artist_img + ", artist_etc="
				+ artist_etc + "]";
	}


	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
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

	public char getArtist_gender() {
		return artist_gender;
	}

	public void setArtist_gender(char artist_gender) {
		this.artist_gender = artist_gender;
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

	public String getArtist_etc() {
		return artist_etc;
	}

	public void setArtist_etc(String artist_etc) {
		this.artist_etc = artist_etc;
	}
	
	
}
