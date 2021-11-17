package com.mycompany.artistar.artist_contributor.vo;

public class ArtistContributor {
	private int artist_num;
	private String contributor_id;
	private int contributor_count;
	
	public ArtistContributor() {}

	public ArtistContributor(int artist_num, String contributor_id, int contributor_count) {
		super();
		this.artist_num = artist_num;
		this.contributor_id = contributor_id;
		this.contributor_count = contributor_count;
	}

	@Override
	public String toString() {
		return "ArtistContributor [artist_num=" + artist_num + ", contributor_id=" + contributor_id
				+ ", contributor_count=" + contributor_count + "]";
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getContributor_id() {
		return contributor_id;
	}

	public void setContributor_id(String contributor_id) {
		this.contributor_id = contributor_id;
	}

	public int getContributor_count() {
		return contributor_count;
	}

	public void setContributor_count(int contributor_count) {
		this.contributor_count = contributor_count;
	}
	
	
}
