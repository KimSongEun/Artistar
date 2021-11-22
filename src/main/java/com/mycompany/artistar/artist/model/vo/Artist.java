package com.mycompany.artistar.artist.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;

@Component
public class Artist {
   private int artistNum;
   private String artistName;
   private String artistIntro;
   private String artistCountry;
   private char artistGender;
   private String artistBirth;
   private String artistDead;
   private String artistImage;
   private String artistDetail;
   private List<ArtInfo> artInfo;
   
   public Artist() {}

   
   public Artist(int artistNum, String artistName, String artistIntro, String artistCountry, char artistGender,
         String artistBirth, String artistDead, String artistImage, String artistDetail) {
      super();
      this.artistNum = artistNum;
      this.artistName = artistName;
      this.artistIntro = artistIntro;
      this.artistCountry = artistCountry;
      this.artistGender = artistGender;
      this.artistBirth = artistBirth;
      this.artistDead = artistDead;
      this.artistImage = artistImage;
      this.artistDetail = artistDetail;
   }


   @Override
   public String toString() {
      return "Artist [artistNum=" + artistNum + ", artistName=" + artistName + ", artistIntro=" + artistIntro
            + ", artistCountry=" + artistCountry + ", artistGender=" + artistGender + ", artistBirth=" + artistBirth
            + ", artistDead=" + artistDead + ", artistImage=" + artistImage + ", artistDetail=" + artistDetail + "]";
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


   public String getArtistImage() {
      return artistImage;
   }


   public void setArtistImage(String artistImage) {
      this.artistImage = artistImage;
   }


   public String getArtistDetail() {
      return artistDetail;
   }


   public void setArtistEtc(String artistDetail) {
      this.artistDetail = artistDetail;
   }


   
}