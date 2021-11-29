package com.mycompany.artistar.artist.model.service;

import java.util.List;

import com.mycompany.artistar.artist.model.vo.Artist;

public interface ArtistService {
	int artistListCount();
	
	public List<Artist> getArtistList(int startPage, int limit) throws Exception;
	
	public int myArtGalleryArtistCount(String userId) throws Exception;

	public int myArtGalleryArtCount(String userId) throws Exception;
	
	public String myArtGalleryProfileImg(String userId) throws Exception;
	
	public List<Artist> getMyGalleryArtistList(String userId) throws Exception;
	
	public Artist getArtistProfileArtist(int artistNum) throws Exception;
	
	public int artistProfileArtCount(int artistNum) throws Exception;
	
	public int artistProfileFollowerCount(int artistNum) throws Exception;
	
	public int artistProfileContributorCount(int artistNum) throws Exception;
}