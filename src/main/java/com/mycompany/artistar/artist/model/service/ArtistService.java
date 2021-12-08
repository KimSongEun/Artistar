package com.mycompany.artistar.artist.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

public interface ArtistService {
	int artistListCount();
	
	public List<Artist> getArtistList(int startPage, int limit) throws Exception;
	
	public int myArtGalleryArtistCount(String userId);

	public int myArtGalleryArtCount(String userId);
	
	public String myArtGalleryProfileImg(String userId) throws Exception;
	
	public List<Artist> getMyGalleryArtistList(int startPage, int limit, String userId) throws Exception;
	
	public Artist getArtistProfileArtist(int artistNum) throws Exception;
	
	int artistProfileArtCount(int artistNum);
	
	int artistProfileFollowerCount(int artistNum);
	
	int artistProfileContributorCount(int artistNum);
	
	public int artistUpdateRequest(ArtistUpdate artistUpdate, MultipartFile report, String userId) throws Exception;
	
	public int artistDeleteRequest(String reason, String userId, int artistNum) throws Exception;
	
	public int artistInsertRequest(ArtistInsert artistInsert, MultipartFile report, String userId) throws Exception;
	
	public int artistFollow(int artistNum, String userId) throws Exception;

}