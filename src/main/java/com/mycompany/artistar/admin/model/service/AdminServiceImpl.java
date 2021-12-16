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
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));	
	

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


	
	
}
