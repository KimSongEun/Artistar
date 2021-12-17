package com.mycompany.artistar.artist_delete.vo;

import com.mycompany.artistar.artist.model.vo.Artist;

public class ArtistDelete {
	private int delete_num;
	private int artist_num;
	private String id;
	private String reason;
	private char result;
	private Artist artist;
	
	public ArtistDelete() {}


	public ArtistDelete(int delete_num, int artist_num, String id, String reason, char result, Artist artist) {
		super();
		this.delete_num = delete_num;
		this.artist_num = artist_num;
		this.id = id;
		this.reason = reason;
		this.result = result;
		this.artist = artist;
	}


	@Override
	public String toString() {
		return "ArtistDelete [delete_num=" + delete_num + ", artist_num=" + artist_num + ", id=" + id + ", reason="
				+ reason + ", result=" + result + ", artist=" + artist + "]";
	}


	public int getDelete_num() {
		return delete_num;
	}

	public void setDelete_num(int delete_num) {
		this.delete_num = delete_num;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public char getResult() {
		return result;
	}

	public void setResult(char result) {
		this.result = result;
	}


	public Artist getArtist() {
		return artist;
	}


	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	
	
}
