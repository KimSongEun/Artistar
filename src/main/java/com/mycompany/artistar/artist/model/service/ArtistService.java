package com.mycompany.artistar.artist.model.service;

import java.util.List;

import com.mycompany.artistar.artist.model.vo.Artist;

public interface ArtistService {
	public List<Artist> getArtistList() throws Exception;
	
	public int myArtGalleryArtistCount(String userId) throws Exception;

	public int myArtGalleryArtCount(String userId) throws Exception;
	
	public String myArtGalleryProfileImg(String userId) throws Exception;
}