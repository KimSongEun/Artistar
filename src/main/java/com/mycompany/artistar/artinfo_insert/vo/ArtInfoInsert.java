package com.mycompany.artistar.artinfo_insert.vo;

public class ArtInfoInsert {
	private int insert_num;
	private int artist_num;
	private String id;
	private String artinfo_name;
	private String artinfo_year;
	private String artinfo_trend;
	private String artinfo_kind;
	private String artinfo_technic;
	private String artinfo_size;
	private String artinfo_collection;
	private String artinfo_detail;
	private String artinfo_img;
	private char result;
	private String artinfo_hash_tag;
    private String artinfo_collection_address;
    private String artinfo_collection_address_lat;
    private String artinfo_collection_address_lon;
	
	
	public ArtInfoInsert() {}

	public ArtInfoInsert(int insert_num, int artist_num, String id, String artinfo_name, String artinfo_year,
			String artinfo_trend, String artinfo_kind, String artinfo_technic, String artinfo_size,
			String artinfo_collection, String artinfo_detail, String artinfo_img, char result, String artinfo_hash_tag,
			String artinfo_collection_address, String artinfo_collection_address_lat,
			String artinfo_collection_address_lon) {
		super();
		this.insert_num = insert_num;
		this.artist_num = artist_num;
		this.id = id;
		this.artinfo_name = artinfo_name;
		this.artinfo_year = artinfo_year;
		this.artinfo_trend = artinfo_trend;
		this.artinfo_kind = artinfo_kind;
		this.artinfo_technic = artinfo_technic;
		this.artinfo_size = artinfo_size;
		this.artinfo_collection = artinfo_collection;
		this.artinfo_detail = artinfo_detail;
		this.artinfo_img = artinfo_img;
		this.result = result;
		this.artinfo_hash_tag = artinfo_hash_tag;
		this.artinfo_collection_address = artinfo_collection_address;
		this.artinfo_collection_address_lat = artinfo_collection_address_lat;
		this.artinfo_collection_address_lon = artinfo_collection_address_lon;
	}

	@Override
	public String toString() {
		return "ArtInfoInsert [insert_num=" + insert_num + ", artist_num=" + artist_num + ", id=" + id
				+ ", artinfo_name=" + artinfo_name + ", artinfo_year=" + artinfo_year + ", artinfo_trend="
				+ artinfo_trend + ", artinfo_kind=" + artinfo_kind + ", artinfo_technic=" + artinfo_technic
				+ ", artinfo_size=" + artinfo_size + ", artinfo_collection=" + artinfo_collection + ", artinfo_detail="
				+ artinfo_detail + ", artinfo_img=" + artinfo_img + ", result=" + result + ", artinfo_hash_tag="
				+ artinfo_hash_tag + ", artinfo_collection_address=" + artinfo_collection_address
				+ ", artinfo_collection_address_lat=" + artinfo_collection_address_lat
				+ ", artinfo_collection_address_lon=" + artinfo_collection_address_lon + "]";
	}

	public int getInsert_num() {
		return insert_num;
	}


	public void setInsert_num(int insert_num) {
		this.insert_num = insert_num;
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


	public String getArtinfo_name() {
		return artinfo_name;
	}


	public void setArtinfo_name(String artinfo_name) {
		this.artinfo_name = artinfo_name;
	}


	public String getArtinfo_year() {
		return artinfo_year;
	}


	public void setArtinfo_year(String artinfo_year) {
		this.artinfo_year = artinfo_year;
	}


	public String getArtinfo_trend() {
		return artinfo_trend;
	}


	public void setArtinfo_trend(String artinfo_trend) {
		this.artinfo_trend = artinfo_trend;
	}


	public String getArtinfo_kind() {
		return artinfo_kind;
	}


	public void setArtinfo_kind(String artinfo_kind) {
		this.artinfo_kind = artinfo_kind;
	}


	public String getArtinfo_technic() {
		return artinfo_technic;
	}


	public void setArtinfo_technic(String artinfo_technic) {
		this.artinfo_technic = artinfo_technic;
	}


	public String getArtinfo_size() {
		return artinfo_size;
	}


	public void setArtinfo_size(String artinfo_size) {
		this.artinfo_size = artinfo_size;
	}


	public String getArtinfo_collection() {
		return artinfo_collection;
	}


	public void setArtinfo_collection(String artinfo_collection) {
		this.artinfo_collection = artinfo_collection;
	}


	public String getArtinfo_detail() {
		return artinfo_detail;
	}


	public void setArtinfo_detail(String artinfo_detail) {
		this.artinfo_detail = artinfo_detail;
	}


	public char getResult() {
		return result;
	}


	public void setResult(char result) {
		this.result = result;
	}

	public String getArtinfo_img() {
		return artinfo_img;
	}

	public void setArtinfo_img(String artinfo_img) {
		this.artinfo_img = artinfo_img;
	}

	public String getArtinfo_hash_tag() {
		return artinfo_hash_tag;
	}

	public void setArtinfo_hash_tag(String artinfo_hash_tag) {
		this.artinfo_hash_tag = artinfo_hash_tag;
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
