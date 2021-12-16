package com.mycompany.artistar.admin.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

public interface AdminService {
	public int getArtistInsertCount();
	
	public int getArtistUpdateCount();
	
	public int getArtistDeleteCount();
	
	public int getArtInsertCount();
	
	public int getArtUpdateCount();
	
	public int getArtDeleteCount();
	
	// Artist Insert
	public List<ArtistInsert> artistInsertAll() throws Exception;
	
	public List<ArtistInsert> artistInsertNotYet() throws Exception;
	
	public List<ArtistInsert> artistInsertOk() throws Exception;
	
	public List<ArtistInsert> artistInsertNope() throws Exception;
	
	public ArtistInsert artistInsertInfoDetail(int insertNum) throws Exception;
	
	public int resultStatusOk(int insertNum) throws Exception;
	
	public int resultStatusNope(int insertNum) throws Exception;
	
	public int alarmArtist(int artistNum, String userId, String userFromId) throws Exception;
	
	public int alarmArtistReject(String userId, String userFromId) throws Exception;
	
	public int insertArtist(Artist artist, MultipartFile report) throws Exception;
	
	public int getArtistSeqNextVal();
	
	public int getArtistSeqCurrVal();
	
	public int insertArtistContributor(int artistNum, String userId);
	
	// Artist Update
	public List<ArtistUpdate> artistUpdateAll() throws Exception;
	
	public List<ArtistUpdate> artistUpdateNotYet() throws Exception;
	
	public List<ArtistUpdate> artistUpdateOk() throws Exception;
	
	public List<ArtistUpdate> artistUpdateNope() throws Exception;
	
	public ArtistUpdate artistUpdateInfoDetail(int updateNum) throws Exception;
	
	public int resultStatusOkUpdate(int updateNum) throws Exception;
	
	public int resultStatusNopeUpdate(int updateNum) throws Exception;
	
	public int alarmArtistUpdate(int artistNum, String userId, String userFromId) throws Exception;
	
	public int alarmArtistRejectUpdate(String userId, String userFromId) throws Exception;
	
	public int updateArtist(Artist artist, MultipartFile report) throws Exception;
	
	
	
}
