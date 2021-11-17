package com.mycompany.artistar.artist_mark.vo;

public class ArtistMark {
	public int mark_num;
	public String id;
	public String request;
	public char result;
	
	public ArtistMark() {}

	public ArtistMark(int mark_num, String id, String request, char result) {
		super();
		this.mark_num = mark_num;
		this.id = id;
		this.request = request;
		this.result = result;
	}

	@Override
	public String toString() {
		return "ArtistMark [mark_num=" + mark_num + ", id=" + id + ", request=" + request + ", result=" + result + "]";
	}

	public int getMark_num() {
		return mark_num;
	}

	public void setMark_num(int mark_num) {
		this.mark_num = mark_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public char getResult() {
		return result;
	}

	public void setResult(char result) {
		this.result = result;
	}
	
	
}
