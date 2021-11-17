package com.mycompany.artistar.admin.ad.model.vo;

public class Ad {
	private int ad_num;
	private String id;
	private String ad_img;
	private String ad_date;
	
	public Ad() {}

	public Ad(int ad_num, String id, String ad_img, String ad_date) {
		super();
		this.ad_num = ad_num;
		this.id = id;
		this.ad_img = ad_img;
		this.ad_date = ad_date;
	}

	@Override
	public String toString() {
		return "Ad [ad_num=" + ad_num + ", id=" + id + ", ad_img=" + ad_img + ", ad_date=" + ad_date + "]";
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

	public String getAd_img() {
		return ad_img;
	}

	public void setAd_img(String ad_img) {
		this.ad_img = ad_img;
	}

	public String getAd_date() {
		return ad_date;
	}

	public void setAd_date(String ad_date) {
		this.ad_date = ad_date;
	}
	
	
}
