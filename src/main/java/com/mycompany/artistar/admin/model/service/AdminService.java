package com.mycompany.artistar.admin.model.service;

import java.util.List;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;

public interface AdminService {
	public List<ArtistInsert> artistInsertAll() throws Exception;
	
	public List<ArtistInsert> artistInsertNotYet() throws Exception;
	
	public List<ArtistInsert> artistInsertOk() throws Exception;
	
	public List<ArtistInsert> artistInsertNope() throws Exception;
	
	public int resultStatusOk(int insertNum) throws Exception;
	
	public int resultStatusNope(int insertNum) throws Exception;
	
	public int alarmArtist(int artistNum, String userId, String userFromId) throws Exception;
	
	public int insertArtist(Artist artist) throws Exception;
}
