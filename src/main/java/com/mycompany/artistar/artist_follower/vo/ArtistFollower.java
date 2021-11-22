package com.mycompany.artistar.artist_follower.vo;

import org.springframework.stereotype.Component;

@Component
public class ArtistFollower {
	private int artfollowerNum;
	private int artistNum;
	private String artfollowerId;
	private String artfollowerDate;
	private int artistfollowerSum;
	
	public ArtistFollower() {}

	public ArtistFollower(int artfollowerNum, int artistNum, String artfollowerId, String artfollowerDate) {
		super();
		this.artfollowerNum = artfollowerNum;
		this.artistNum = artistNum;
		this.artfollowerId = artfollowerId;
		this.artfollowerDate = artfollowerDate;
	}

	@Override
	public String toString() {
		return "ArtistFollower [artfollowerNum=" + artfollowerNum + ", artistNum=" + artistNum + ", artfollowerId="
				+ artfollowerId + ", artfollowerDate=" + artfollowerDate + "]";
	}

	public int getArtfollowerNum() {
		return artfollowerNum;
	}

	public void setArtfollowerNum(int artfollowerNum) {
		this.artfollowerNum = artfollowerNum;
	}

	public int getArtistNum() {
		return artistNum;
	}

	public void setArtistNum(int artistNum) {
		this.artistNum = artistNum;
	}

	public String getArtfollowerId() {
		return artfollowerId;
	}

	public void setArtfollowerId(String artfollowerId) {
		this.artfollowerId = artfollowerId;
	}

	public String getArtfollowerDate() {
		return artfollowerDate;
	}

	public void setArtfollowerDate(String artfollowerDate) {
		this.artfollowerDate = artfollowerDate;
	}

	public int getArtistfollowerSum() {
		return artistfollowerSum;
	}

	public void setArtistfollowerSum(int artistfollowerSum) {
		this.artistfollowerSum = artistfollowerSum;
	}
	
}
