package com.mycompany.artistar.artinfo_delete.vo;

public class ArtInfoDelete {
	
	private int delete_num;
	private int artist_num;
	private String id;
	private String reason;
	private char result;
	
	public ArtInfoDelete() {}

	public ArtInfoDelete(int delete_num, int artist_num, String id, String reason, char result) {
		super();
		this.delete_num = delete_num;
		this.artist_num = artist_num;
		this.id = id;
		this.reason = reason;
		this.result = result;
	}

	@Override
	public String toString() {
		return "ArtInfoDelete [delete_num=" + delete_num + ", artist_num=" + artist_num + ", id=" + id + ", reason="
				+ reason + ", result=" + result + "]";
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

	
	
}
