package com.mycompany.artistar.art_collection_detail_insert.vo;

public class ArtCollectionDetailInsert {
	private int insert_num;
	private String artinfo_collection_address;
	private String artinfo_collection_address_lat;
	private String artinfo_collection_address_lon;
	public ArtCollectionDetailInsert() {
		super();
	}
	public ArtCollectionDetailInsert(int insert_num, String artinfo_collection_address,
			String artinfo_collection_address_lat, String artinfo_collection_address_lon) {
		super();
		this.insert_num = insert_num;
		this.artinfo_collection_address = artinfo_collection_address;
		this.artinfo_collection_address_lat = artinfo_collection_address_lat;
		this.artinfo_collection_address_lon = artinfo_collection_address_lon;
	}
	@Override
	public String toString() {
		return "ArtCollectionDetailInsert [insert_num=" + insert_num + ", artinfo_collection_address="
				+ artinfo_collection_address + ", artinfo_collection_address_lat=" + artinfo_collection_address_lat
				+ ", artinfo_collection_address_lon=" + artinfo_collection_address_lon + "]";
	}
	public int getInsert_num() {
		return insert_num;
	}
	public void setInsert_num(int insert_num) {
		this.insert_num = insert_num;
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
