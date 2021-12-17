package com.mycompany.artistar.admin.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_delete.vo.ArtInfoDelete;
import com.mycompany.artistar.artinfo_delete_info.vo.ArtDeleteInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;
import com.mycompany.artistar.artinfo_update.vo.ArtInfoUpdate;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_delete.vo.ArtistDelete;
import com.mycompany.artistar.artist_delete_info.vo.ArtistDeleteInfo;
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
	
	// Artist Delete
	public List<ArtistDelete> artistDeleteAll() throws Exception;
	
	public List<ArtistDelete> artistDeleteNotYet() throws Exception;
	
	public List<ArtistDelete> artistDeleteOk() throws Exception;
	
	public List<ArtistDelete> artistDeleteNope() throws Exception;
	
	public ArtistDelete artistDeleteInfoDetail(int deleteNum) throws Exception;
	
	public ArtistDelete artistAlreadyDeleteInfoDetail(int deleteNum) throws Exception;
	
	public int resultStatusOkDelete(int artistNum) throws Exception;
	
	public int resultStatusNopeDelete(int deleteNum) throws Exception;
	
	public int alarmArtistDelete(String userId, String userFromId) throws Exception;
	
	public int alarmArtistRejectDelete(String userId, String userFromId) throws Exception;
	
	public int deleteArtist(int artistNum) throws Exception;
	
	public int insertArtistDeleteInfo(ArtistDeleteInfo artistDeleteInfo) throws Exception;
	
	public List<String> artistDeleteAlarmIdList(int artistNum) throws Exception;
	
	// Art Insert
	public List<ArtInfoInsert> artInsertAll() throws Exception;
	
	public List<ArtInfoInsert> artInsertNotYet() throws Exception;
	
	public List<ArtInfoInsert> artInsertOk() throws Exception;
	
	public List<ArtInfoInsert> artInsertNope() throws Exception;
	
	public ArtInfoInsert artInsertInfoDetail(int insertNum) throws Exception;
	
	public int resultStatusOkArtInsert(int insertNum) throws Exception;
	
	public int resultStatusNopeArtInsert(int insertNum) throws Exception;
	
	public int alarmArtInsert(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception;
	
	public int alarmArtRejectInsert(int artistNum, String userId, String userFromId) throws Exception;
	
	public int insertArt(ArtInfo artInfo, MultipartFile report) throws Exception;
	
	public int getArtSeqNextVal();
	
	// Art Update
	public List<ArtInfoUpdate> artUpdateAll() throws Exception;
	
	public List<ArtInfoUpdate> artUpdateNotYet() throws Exception;
	
	public List<ArtInfoUpdate> artUpdateOk() throws Exception;
	
	public List<ArtInfoUpdate> artUpdateNope() throws Exception;
	
	public ArtInfoUpdate artUpdateInfoDetail(int updateNum) throws Exception;
	
	public int resultStatusOkArtUpdate(int updateNum) throws Exception;
	
	public int resultStatusNopeArtUpdate(int updateNum) throws Exception;
	
	public int alarmArtUpdate(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception;
	
	public int alarmArtRejectUpdate(int artistNum, String userId, String userFromId) throws Exception;
	
	public int updateArt(ArtInfo artInfo, MultipartFile report) throws Exception;
	
	// Art Delete
	public List<ArtInfoDelete> artDeleteAll() throws Exception;
	
	public List<ArtInfoDelete> artDeleteNotYet() throws Exception;
	
	public List<ArtInfoDelete> artDeleteOk() throws Exception;
	
	public List<ArtInfoDelete> artDeleteNope() throws Exception;
	
	public ArtInfoDelete artDeleteInfoDetail(int deleteNum) throws Exception;
	
	public ArtInfoDelete artAlreadyDeleteInfoDetail(int deleteNum) throws Exception;
	
	public int resultStatusOkDeleteArt(int artinfoNum) throws Exception;
	
	public int resultStatusNopeDeleteArt(int deleteNum) throws Exception;
	
	public int alarmArtDelete(String userId, String userFromId) throws Exception;
	
	public int alarmArtRejectDelete(String userId, String userFromId) throws Exception;
	
	public int deleteArt(int artinfoNum) throws Exception;
	
	public int insertArtDeleteInfo(ArtDeleteInfo artDeleteInfo) throws Exception;
	
	public List<String> artDeleteAlarmIdList(int artinfoNum) throws Exception;
}
