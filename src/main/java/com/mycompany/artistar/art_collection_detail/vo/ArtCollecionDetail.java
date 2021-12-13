package com.mycompany.artistar.art_collection_detail.vo;

public class ArtCollecionDetail {
	private int artinfo_num;
	private String artinfo_collection_address;
	private String artinfo_collection_address_lat;
	private String artinfo_collection_address_lon;
	
	
	public ArtCollecionDetail() {
		super();
	}


	public ArtCollecionDetail(int artinfo_num, String artinfo_collection_address, String artinfo_collection_address_lat,
			String artinfo_collection_address_lon) {
		super();
		this.artinfo_num = artinfo_num;
		this.artinfo_collection_address = artinfo_collection_address;
		this.artinfo_collection_address_lat = artinfo_collection_address_lat;
		this.artinfo_collection_address_lon = artinfo_collection_address_lon;
	}


	@Override
	public String toString() {
		return "ArtCollecionDetail [artinfo_num=" + artinfo_num + ", artinfo_collection_address="
				+ artinfo_collection_address + ", artinfo_collection_address_lat=" + artinfo_collection_address_lat
				+ ", artinfo_collection_address_lon=" + artinfo_collection_address_lon + "]";
	}


	public int getArtinfo_num() {
		return artinfo_num;
	}


	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}


	public String getArtinfo_collection_address() {
		return artinfo_collection_address;
	}


	public void setArtinfo_collection_address(String artinfo_collection_address) {
		this.artinfo_collection_address = artinfo_collection_address;
	}


	public String getArtinfo_collection_address_lat() {
		return artinfo_collection_address_lat;
	}


	public void setArtinfo_collection_address_lat(String artinfo_collection_address_lat) {
		this.artinfo_collection_address_lat = artinfo_collection_address_lat;
	}


	public String getArtinfo_collection_address_lon() {
		return artinfo_collection_address_lon;
	}


	public void setArtinfo_collection_address_lon(String artinfo_collection_address_lon) {
		this.artinfo_collection_address_lon = artinfo_collection_address_lon;
	}
	
	
}
