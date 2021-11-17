package com.mycompany.artistar.ad_inquire.vo;

public class AdInquire {
	
	private int ad_inquire_num;
	private int ad_num;
	private String id;
	
	public AdInquire() {}

	public AdInquire(int ad_inquire_num, int ad_num, String id) {
		super();
		this.ad_inquire_num = ad_inquire_num;
		this.ad_num = ad_num;
		this.id = id;
	}

	@Override
	public String toString() {
		return "AdInquire [ad_inquire_num=" + ad_inquire_num + ", ad_num=" + ad_num + ", id=" + id + "]";
	}

	public int getAd_inquire_num() {
		return ad_inquire_num;
	}

	public void setAd_inquire_num(int ad_inquire_num) {
		this.ad_inquire_num = ad_inquire_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
