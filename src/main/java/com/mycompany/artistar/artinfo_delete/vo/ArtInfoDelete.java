package com.mycompany.artistar.artinfo_delete.vo;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;

public class ArtInfoDelete {
	
	private int delete_num;
	private int artinfo_num;
	private String id;
	private String reason;
	private char result;
	private ArtInfo artInfo;
	
	public ArtInfoDelete() {}

	public ArtInfoDelete(int delete_num, int artinfo_num, String id, String reason, char result, ArtInfo artInfo) {
		super();
		this.delete_num = delete_num;
		this.artinfo_num = artinfo_num;
		this.id = id;
		this.reason = reason;
		this.result = result;
		this.artInfo = artInfo;
	}

	@Override
	public String toString() {
		return "ArtInfoDelete [delete_num=" + delete_num + ", artinfo_num=" + artinfo_num + ", id=" + id + ", reason="
				+ reason + ", result=" + result + ", artInfo=" + artInfo + "]";
	}

	public int getDelete_num() {
		return delete_num;
	}

	public void setDelete_num(int delete_num) {
		this.delete_num = delete_num;
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


	public ArtInfo getArtInfo() {
		return artInfo;
	}


	public void setArtInfo(ArtInfo artInfo) {
		this.artInfo = artInfo;
	}

	
	
}
