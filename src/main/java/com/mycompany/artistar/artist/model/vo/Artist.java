package com.mycompany.artistar.artist.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist_follower.vo.ArtistFollower;

@Component
public class Artist {
   private int artistNum;
   private String artistName;
   private String artistIntro;
   private String artistCountry;
   private char artistGender;
   private String artistBirth;
   private String artistDead;
   private String artistImg;
   private String artistDetail;
   private int follower;
   private List<ArtInfo> artInfo;
   private List<ArtistFollower> artistFollower;
   
   
   public Artist() {}
   
   
	public Artist(int artistNum, String artistName, String artistIntro, String artistCountry, char artistGender,
			String artistBirth, String artistDead, String artistImg, String artistDetail, int follower,
			List<ArtInfo> artInfo, List<ArtistFollower> artistFollower) {
		super();
		this.artistNum = artistNum;
		this.artistName = artistName;
		this.artistIntro = artistIntro;
		this.artistCountry = artistCountry;
		this.artistGender = artistGender;
		this.artistBirth = artistBirth;
		this.artistDead = artistDead;
		this.artistImg = artistImg;
		this.artistDetail = artistDetail;
		this.follower = follower;
		this.artInfo = artInfo;
		this.artistFollower = artistFollower;
	}
	
	@Override
		public String toString() {
			return "Artist [artistNum=" + artistNum + ", artistName=" + artistName + ", artistIntro=" + artistIntro
					+ ", artistCountry=" + artistCountry + ", artistGender=" + artistGender + ", artistBirth=" + artistBirth
					+ ", artistDead=" + artistDead + ", artistImg=" + artistImg + ", artistDetail=" + artistDetail
					+ ", follower=" + follower + ", artInfo=" + artInfo + ", artistFollower=" + artistFollower + "]";
		}

		
		public int getArtistNum() {
			return artistNum;
		}
		
		public void setArtistNum(int artistNum) {
			this.artistNum = artistNum;
		}
		
		public String getArtistName() {
			return artistName;
		}
		
		public void setArtistName(String artistName) {
			this.artistName = artistName;
		}
		
		public String getArtistIntro() {
			return artistIntro;
		}
		
		public void setArtistIntro(String artistIntro) {
			this.artistIntro = artistIntro;
		}
		
		public String getArtistCountry() {
			return artistCountry;
		}
		
		public void setArtistCountry(String artistCountry) {
			this.artistCountry = artistCountry;
		}
		
		public char getArtistGender() {
			return artistGender;
		}
		
		public void setArtistGender(char artistGender) {
			this.artistGender = artistGender;
		}
		
		public String getArtistBirth() {
			return artistBirth;
		}
		
		public void setArtistBirth(String artistBirth) {
			this.artistBirth = artistBirth;
		}
		
		public String getArtistDead() {
			return artistDead;
		}
		
		public void setArtistDead(String artistDead) {
			this.artistDead = artistDead;
		}
		
		public String getArtistImg() {
			return artistImg;
		}
		
		public void setArtistImg(String artistImg) {
			this.artistImg = artistImg;
		}
		
		public String getArtistDetail() {
			return artistDetail;
		}
		
		public void setArtistDetail(String artistDetail) {
			this.artistDetail = artistDetail;
		}
		
		public List<ArtInfo> getArtInfo() {
			return artInfo;
		}
		
		public void setArtInfo(List<ArtInfo> artInfo) {
			this.artInfo = artInfo;
		}
		
		public List<ArtistFollower> getArtistFollower() {
			return artistFollower;
		}
		
		public void setArtistFollower(List<ArtistFollower> artistFollower) {
			this.artistFollower = artistFollower;
		}
		
		public int getFollower() {
			return follower;
		}


		public void setFollower(int follower) {
			this.follower = follower;
		}
		
   
}