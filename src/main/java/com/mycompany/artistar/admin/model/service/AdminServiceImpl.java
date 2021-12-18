package com.mycompany.artistar.admin.model.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.artistar.admin.model.dao.AdminDao;
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

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));	
	
	@Override
	public int getArtistInsertCount() {
		return adminDao.getArtistInsertCount();
	}
	
	@Override
	public int getArtistUpdateCount() {
		return adminDao.getArtistUpdateCount();
	}
	
	@Override
	public int getArtistDeleteCount() {
		return adminDao.getArtistDeleteCount();
	}
	
	@Override
	public int getArtInsertCount() {
		return adminDao.getArtInsertCount();
	}
	
	@Override
	public int getArtUpdateCount() {
		return adminDao.getArtUpdateCount();
	}
	
	@Override
	public int getArtDeleteCount() {
		return adminDao.getArtDeleteCount();
	}

	// Artist Insert
	@Override
	public List<ArtistInsert> artistInsertAll() throws Exception {
		return adminDao.artistInsertAll();
	}

	@Override
	public List<ArtistInsert> artistInsertNotYet() throws Exception {
		return adminDao.artistInsertNotYet();
	}

	@Override
	public List<ArtistInsert> artistInsertOk() throws Exception {
		return adminDao.artistInsertOk();
	}

	@Override
	public List<ArtistInsert> artistInsertNope() throws Exception {
		return adminDao.artistInsertNope();
	}
	
	@Override
	public ArtistInsert artistInsertInfoDetail(int insertNum) throws Exception {
		return adminDao.artistInsertInfoDetail(insertNum);
	}

	@Override
	public int resultStatusOk(int insertNum) throws Exception {
		return adminDao.resultStatusOk(insertNum);
	}

	@Override
	public int resultStatusNope(int insertNum) throws Exception {
		return adminDao.resultStatusNope(insertNum);
	}

	@Override
	public int alarmArtist(int artistNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtist(artistNum, userId, userFromId);
	}
	
	@Override
	public int alarmArtistReject(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtistReject(userId, userFromId);
	}

	@Override
	public int insertArtist(Artist artist, MultipartFile report) throws Exception {
		String urlPhoto = null;
        Map uploadResult = null;
        
        if(!report.isEmpty()) {
        	try {
        		File f = Files.createTempFile("temp",report.getOriginalFilename()).toFile();
        		report.transferTo(f);
        		
				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
        	} catch (IOException e) {
        		System.out.println("error with upload photo to cloudinary");
        	}
        	artist.setArtistImg(urlPhoto);
        }
		return adminDao.insertArtist(artist);
	}

	@Override
	public int getArtistSeqNextVal() {
		return adminDao.getArtistSeqNextVal();
	}

	@Override
	public int getArtistSeqCurrVal() {
		return adminDao.getArtistSeqCurrVal();
	}

	@Override
	public int insertArtistContributor(int artistNum, String userId) {
		return adminDao.insertArtistContributor(artistNum, userId);
	}

	// Artist Update
	@Override
	public List<ArtistUpdate> artistUpdateAll() throws Exception {
		return adminDao.artistUpdateAll();
	}
	
	@Override
	public List<ArtistUpdate> artistUpdateNotYet() throws Exception {
		return adminDao.artistUpdateNotYet();
	}
	
	@Override
	public List<ArtistUpdate> artistUpdateOk() throws Exception {
		return adminDao.artistUpdateOk();
	}
	
	@Override
	public List<ArtistUpdate> artistUpdateNope() throws Exception {
		return adminDao.artistUpdateNope();
	}
	
	@Override
	public ArtistUpdate artistUpdateInfoDetail(int updateNum) throws Exception {
		return adminDao.artistUpdateInfoDetail(updateNum);
	}
	
	@Override
	public int resultStatusOkUpdate(int updateNum) throws Exception {
		return adminDao.resultStatusOkUpdate(updateNum);
	}
	
	@Override
	public int resultStatusNopeUpdate(int updateNum) throws Exception {
		return adminDao.resultStatusNopeUpdate(updateNum);
	}
	
	@Override
	public int alarmArtistUpdate(int artistNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtistUpdate(artistNum, userId, userFromId);
	}
	
	@Override
	public int alarmArtistRejectUpdate(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtistRejectUpdate(userId, userFromId);
	}
	
	@Override
	public int updateArtist(Artist artist, MultipartFile report) throws Exception {
		String urlPhoto = null;
		Map uploadResult = null;
		
		if(!report.isEmpty()) {
			try {
				File f = Files.createTempFile("temp",report.getOriginalFilename()).toFile();
				report.transferTo(f);
				
				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
			} catch (IOException e) {
				System.out.println("error with upload photo to cloudinary");
			}
			artist.setArtistImg(urlPhoto);
		}
		return adminDao.updateArtist(artist);
	}
	
	// Artist DELETE
	@Override
	public List<ArtistDelete> artistDeleteAll() throws Exception {
		return adminDao.artistDeleteAll();
	}
	
	@Override
	public List<ArtistDelete> artistDeleteNotYet() throws Exception {
		return adminDao.artistDeleteNotYet();
	}
	
	@Override
	public List<ArtistDelete> artistDeleteOk() throws Exception {
		return adminDao.artistDeleteOk();
	}
	
	@Override
	public List<ArtistDelete> artistDeleteNope() throws Exception {
		return adminDao.artistDeleteNope();
	}
	
	@Override
	public ArtistDelete artistDeleteInfoDetail(int deleteNum) throws Exception {
		return adminDao.artistDeleteInfoDetail(deleteNum);
	}
	
	@Override
	public ArtistDelete artistAlreadyDeleteInfoDetail(int deleteNum) throws Exception {
		return adminDao.artistAlreadyDeleteInfoDetail(deleteNum);
	}
	
	@Override
	public int resultStatusOkDelete(int artistNum) throws Exception {
		return adminDao.resultStatusOkDelete(artistNum);
	}
	
	@Override
	public int resultStatusNopeDelete(int deleteNum) throws Exception {
		return adminDao.resultStatusNopeDelete(deleteNum);
	}
	
	@Override
	public int alarmArtistDelete(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtistDelete(userId, userFromId);
	}
	
	@Override
	public int alarmArtistRejectDelete(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtistRejectDelete(userId, userFromId);
	}
	
	@Override
	public int deleteArtist(int artistNum) throws Exception {
		return adminDao.deleteArtist(artistNum);
	}

	@Override
	public int insertArtistDeleteInfo(ArtistDeleteInfo artistDeleteInfo) throws Exception {
		return adminDao.insertArtistDeleteInfo(artistDeleteInfo);
	}

	@Override
	public List<String> artistDeleteAlarmIdList(int artistNum) throws Exception {
		return adminDao.artistDeleteAlarmIdList(artistNum);
	}
	
	// Art Insert
	@Override
	public List<ArtInfoInsert> artInsertAll() throws Exception {
		return adminDao.artInsertAll();
	}

	@Override
	public List<ArtInfoInsert> artInsertNotYet() throws Exception {
		return adminDao.artInsertNotYet();
	}

	@Override
	public List<ArtInfoInsert> artInsertOk() throws Exception {
		return adminDao.artInsertOk();
	}

	@Override
	public List<ArtInfoInsert> artInsertNope() throws Exception {
		return adminDao.artInsertNope();
	}

	@Override
	public ArtInfoInsert artInsertInfoDetail(int insertNum) throws Exception {
		return adminDao.artInsertInfoDetail(insertNum);
	}

	@Override
	public int resultStatusOkArtInsert(int insertNum) throws Exception {
		return adminDao.resultStatusOkArtInsert(insertNum);
	}

	@Override
	public int resultStatusNopeArtInsert(int insertNum) throws Exception {
		return adminDao.resultStatusNopeArtInsert(insertNum);
	}

	@Override
	public int alarmArtInsert(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtInsert(artistNum, artinfoNum, userId, userFromId);
	}

	@Override
	public int alarmArtRejectInsert(int artistNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtRejectInsert(artistNum, userId, userFromId);
	}

	@Override
	public int insertArt(ArtInfo artInfo, MultipartFile report) throws Exception {
		String urlPhoto = null;
        Map uploadResult = null;
        
        if(!report.isEmpty()) {
        	try {
        		File f = Files.createTempFile("temp",report.getOriginalFilename()).toFile();
        		report.transferTo(f);
        		
				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
        	} catch (IOException e) {
        		System.out.println("error with upload photo to cloudinary");
        	}
        	artInfo.setArtinfoImg(urlPhoto);
        }
		return adminDao.insertArt(artInfo);
	}

	@Override
	public int getArtSeqNextVal() {
		return adminDao.getArtSeqNextVal();
	}

	// Art Update
	@Override
	public List<ArtInfoUpdate> artUpdateAll() throws Exception {
		return adminDao.artUpdateAll();
	}

	@Override
	public List<ArtInfoUpdate> artUpdateNotYet() throws Exception {
		return adminDao.artUpdateNotYet();
	}

	@Override
	public List<ArtInfoUpdate> artUpdateOk() throws Exception {
		return adminDao.artUpdateOk();
	}

	@Override
	public List<ArtInfoUpdate> artUpdateNope() throws Exception {
		return adminDao.artUpdateNope();
	}

	@Override
	public ArtInfoUpdate artUpdateInfoDetail(int updateNum) throws Exception {
		return adminDao.artUpdateInfoDetail(updateNum);
	}

	@Override
	public int resultStatusOkArtUpdate(int updateNum) throws Exception {
		return adminDao.resultStatusOkArtUpdate(updateNum);
	}

	@Override
	public int resultStatusNopeArtUpdate(int updateNum) throws Exception {
		return adminDao.resultStatusNopeArtUpdate(updateNum);
	}

	@Override
	public int alarmArtUpdate(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtUpdate(artistNum, artinfoNum, userId, userFromId);
	}

	@Override
	public int alarmArtRejectUpdate(int artistNum, String userId, String userFromId) throws Exception {
		return adminDao.alarmArtRejectUpdate(artistNum, userId, userFromId);
	}

	@Override
	public int updateArt(ArtInfo artInfo, MultipartFile report) throws Exception {
		String urlPhoto = null;
		Map uploadResult = null;
		
		if(!report.isEmpty()) {
			try {
				File f = Files.createTempFile("temp",report.getOriginalFilename()).toFile();
				report.transferTo(f);
				
				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
			} catch (IOException e) {
				System.out.println("error with upload photo to cloudinary");
			}
			artInfo.setArtinfoImg(urlPhoto);
		}
		return adminDao.updateArt(artInfo);
	}

	// Art Delete
	@Override
	public List<ArtInfoDelete> artDeleteAll() throws Exception {
		return adminDao.artDeleteAll();
	}

	@Override
	public List<ArtInfoDelete> artDeleteNotYet() throws Exception {
		return adminDao.artDeleteNotYet();
	}

	@Override
	public List<ArtInfoDelete> artDeleteOk() throws Exception {
		return adminDao.artDeleteOk();
	}

	@Override
	public List<ArtInfoDelete> artDeleteNope() throws Exception {
		return adminDao.artDeleteNope();
	}

	@Override
	public ArtInfoDelete artDeleteInfoDetail(int deleteNum) throws Exception {
		return adminDao.artDeleteInfoDetail(deleteNum);
	}

	@Override
	public ArtInfoDelete artAlreadyDeleteInfoDetail(int deleteNum) throws Exception {
		return adminDao.artAlreadyDeleteInfoDetail(deleteNum);
	}

	@Override
	public int resultStatusOkDeleteArt(int artinfoNum) throws Exception {
		return adminDao.resultStatusOkDeleteArt(artinfoNum);
	}

	@Override
	public int resultStatusNopeDeleteArt(int deleteNum) throws Exception {
		return adminDao.resultStatusNopeDeleteArt(deleteNum);
	}

	@Override
	public int alarmArtDelete(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtDelete(userId, userFromId);
	}

	@Override
	public int alarmArtRejectDelete(String userId, String userFromId) throws Exception {
		return adminDao.alarmArtRejectDelete(userId, userFromId);
	}

	@Override
	public int deleteArt(int artinfoNum) throws Exception {
		return adminDao.deleteArt(artinfoNum);
	}

	@Override
	public int insertArtDeleteInfo(ArtDeleteInfo artDeleteInfo) throws Exception {
		return adminDao.insertArtDeleteInfo(artDeleteInfo);
	}

	@Override
	public List<String> artDeleteAlarmIdList(int artinfoNum) throws Exception {
		return adminDao.artDeleteAlarmIdList(artinfoNum);
	}

	@Override
	public List<Artist> artistNameSearch(String artistSearch) throws Exception {
		return adminDao.artistNameSearch(artistSearch);
	}

	@Override
	public int artistNumSearch(String artistName) throws Exception {
		return adminDao.artistNumSearch(artistName);
	}

	
}
