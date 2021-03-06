package com.mycompany.artistar.artist.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_contributor.vo.ArtistContributor;
import com.mycompany.artistar.artist_follower.vo.ArtistFollower;
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
	
	public int followCheck(int artistNum, String userId) throws Exception;
	
	public int artistFollow(int artistNum, String userId) throws Exception;
	
	public int artistUnfollow(int artistNum, String userId) throws Exception;
	
	public List<Artist> getSearchArtist(String keyword) throws Exception;
	
	public int searchArtCount(String keyword) throws Exception;
	
	public List<ArtInfo> getSearchArt(String keyword) throws Exception;
	
	public int searchTagCount(String keyword) throws Exception;
	
	public List<ArtInfo> getSearchTags(String keyword) throws Exception;

	public List<ArtistFollower> artistFollowerList (int artistNum) throws Exception;
	
	public List<ArtistContributor> artistContributorList (int artistNum) throws Exception;
	
	
}