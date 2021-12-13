package com.mycompany.artistar.art_collection_detail_update.vo;

public class ArtCollectionDetailUpdate {
	private int update_num;
	private String artinfo_collection_address;
	private String artinfo_collection_address_lat;
	private String artinfo_collection_address_lon;
	public ArtCollectionDetailUpdate() {
		super();
	}
	public ArtCollectionDetailUpdate(int update_num, String artinfo_collection_address,
			String artinfo_collection_address_lat, String artinfo_collection_address_lon) {
		super();
		this.update_num = update_num;
		this.artinfo_collection_address = artinfo_collection_address;
		this.artinfo_collection_address_lat = artinfo_collection_address_lat;
		this.artinfo_collection_address_lon = artinfo_collection_address_lon;
	}
	@Override
	public String toString() {
		return "ArtCollectionDetailUpdate [update_num=" + update_num + ", artinfo_collection_address="
				+ artinfo_collection_address + ", artinfo_collection_address_lat=" + artinfo_collection_address_lat
				+ ", artinfo_collection_address_lon=" + artinfo_collection_address_lon + "]";
	}
	public int getUpdate_num() {
		return update_num;
	}
	public void setUpdate_num(int update_num) {
		this.update_num = update_num;
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
