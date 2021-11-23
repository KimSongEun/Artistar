package com.mycompany.artistar.artinfo.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.art_img.vo.ArtImg;

@Component
public class ArtInfo {
   private int artinfoNum;
   private int artistNum;
   private String artinfoName;
   private String artinfoYear;
   private String artinfoTrend;
   private String artinfoKind;
   private String artinfoTechnic;
   private String artinfoSize;
   private String artinfoCollection;
   private String artinfoDetail;
   private String artinfoDate;
   private List<ArtImg> artImg;
   
   public ArtInfo() {}
   
   public ArtInfo(int artinfoNum, int artistNum, String artinfoName, String artinfoYear, String artinfoTrend,
	String artinfoKind, String artinfoTechnic, String artinfoSize, String artinfoCollection, String artinfoDetail,
	String artinfoDate, List<ArtImg> artImg) {
	super();
	this.artinfoNum = artinfoNum;
	this.artistNum = artistNum;
	this.artinfoName = artinfoName;
	this.artinfoYear = artinfoYear;
	this.artinfoTrend = artinfoTrend;
	this.artinfoKind = artinfoKind;
	this.artinfoTechnic = artinfoTechnic;
	this.artinfoSize = artinfoSize;
	this.artinfoCollection = artinfoCollection;
	this.artinfoDetail = artinfoDetail;
	this.artinfoDate = artinfoDate;
	this.artImg = artImg;
   }

	@Override
	public String toString() {
		return "ArtInfo [artinfoNum=" + artinfoNum + ", artistNum=" + artistNum + ", artinfoName=" + artinfoName
				+ ", artinfoYear=" + artinfoYear + ", artinfoTrend=" + artinfoTrend + ", artinfoKind=" + artinfoKind
				+ ", artinfoTechnic=" + artinfoTechnic + ", artinfoSize=" + artinfoSize + ", artinfoCollection="
				+ artinfoCollection + ", artinfoDetail=" + artinfoDetail + ", artinfoDate=" + artinfoDate + ", artImg="
				+ artImg + "]";
	}

public int getArtinfoNum() {
      return artinfoNum;
   }

   public void setArtinfoNum(int artinfoNum) {
      this.artinfoNum = artinfoNum;
   }

   public int getArtistNum() {
      return artistNum;
   }

   public void setArtistNum(int artistNum) {
      this.artistNum = artistNum;
   }

   public String getArtinfoName() {
      return artinfoName;
   }

   public void setArtinfoName(String artinfoName) {
      this.artinfoName = artinfoName;
   }

   public String getArtinfoYear() {
      return artinfoYear;
   }

   public void setArtinfoYear(String artinfoYear) {
      this.artinfoYear = artinfoYear;
   }

   public String getArtinfoTrend() {
      return artinfoTrend;
   }

   public void setArtinfoTrend(String artinfoTrend) {
      this.artinfoTrend = artinfoTrend;
   }

   public String getArtinfoKind() {
      return artinfoKind;
   }

   public void setArtinfoKind(String artinfoKind) {
      this.artinfoKind = artinfoKind;
   }

   public String getArtinfoTechnic() {
      return artinfoTechnic;
   }

   public void setArtinfoTechnic(String artinfoTechnic) {
      this.artinfoTechnic = artinfoTechnic;
   }

   public String getArtinfoSize() {
      return artinfoSize;
   }

   public void setArtinfoSize(String artinfoSize) {
      this.artinfoSize = artinfoSize;
   }

   public String getArtinfoCollection() {
      return artinfoCollection;
   }

   public void setArtinfoCollection(String artinfoCollection) {
      this.artinfoCollection = artinfoCollection;
   }

   public String getArtinfoDetail() {
      return artinfoDetail;
   }

   public void setArtinfoDetail(String artinfoDetail) {
      this.artinfoDetail = artinfoDetail;
   }

   public String getArtinfoDate() {
      return artinfoDate;
   }

   public void setArtinfoDate(String artinfoDate) {
      this.artinfoDate = artinfoDate;
   }

	public List<ArtImg> getArtImg() {
		return artImg;
	}
	
	public void setArtImg(List<ArtImg> artImg) {
		this.artImg = artImg;
	}


   
   
}