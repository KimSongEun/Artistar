package com.mycompany.artistar.artist_follower.vo;

public class ArtistFollower {
	private int artfollower_num;
	private int artist_num;
	private String artfollower__id;
	private String artfollower_date;
	
	public ArtistFollower() {}

	public ArtistFollower(int artfollower_num, int artist_num, String artfollower__id, String artfollower_date) {
		super();
		this.artfollower_num = artfollower_num;
		this.artist_num = artist_num;
		this.artfollower__id = artfollower__id;
		this.artfollower_date = artfollower_date;
	}

	@Override
	public String toString() {
		return "ArtistFollower [artfollower_num=" + artfollower_num + ", artist_num=" + artist_num
				+ ", artfollower__id=" + artfollower__id + ", artfollower_date=" + artfollower_date + "]";
	}

	public int getArtfollower_num() {
		return artfollower_num;
	}

	public void setArtfollower_num(int artfollower_num) {
		this.artfollower_num = artfollower_num;
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getArtfollower__id() {
		return artfollower__id;
	}

	public void setArtfollower__id(String artfollower__id) {
		this.artfollower__id = artfollower__id;
	}

	public String getArtfollower_date() {
		return artfollower_date;
	}

	public void setArtfollower_date(String artfollower_date) {
		this.artfollower_date = artfollower_date;
	}
	
	
	
}
