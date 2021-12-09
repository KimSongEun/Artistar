package com.mycompany.artistar.artist.model.service;

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
import com.mycompany.artistar.artist.model.dao.ArtistDao;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

@Service("artistService")
public class ArtistServiceImpl implements ArtistService {
	@Autowired
	private ArtistDao artistDao;
	
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));
	
	@Override
	public int artistListCount() {
		return artistDao.artistListCount();
	}
	
	@Override
	public List<Artist> getArtistList(int startPage, int limit) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistList(startPage, limit);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public int myArtGalleryArtistCount(String userId) {
		int myArtGalleryArtistCount = 0;
		try {
			myArtGalleryArtistCount=artistDao.myArtGalleryArtistCount(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryArtistCount;
	}

	@Override
	public int myArtGalleryArtCount(String userId) {
		int myArtGalleryArtCount = 0;
		try {
			myArtGalleryArtCount=artistDao.myArtGalleryArtCount(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryArtCount;
	}

	@Override
	public String myArtGalleryProfileImg(String userId) throws Exception {
		String myArtGalleryProfileImg = null;
		try {
			myArtGalleryProfileImg=artistDao.myArtGalleryProfileImg(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryProfileImg;
	}

	@Override
	public List<Artist> getMyGalleryArtistList(int startPage, int limit, String userId) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getMyGalleryArtistList(startPage, limit, userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public Artist getArtistProfileArtist(int artistNum) throws Exception {
		return artistDao.getArtistProfileArtist(artistNum);
	}

	@Override
	public int artistProfileArtCount(int artistNum) {
		return artistDao.artistProfileArtCount(artistNum);
	}

	@Override
	public int artistProfileFollowerCount(int artistNum) {
		return artistDao.artistProfileFollowerCount(artistNum);
	}

	@Override
	public int artistProfileContributorCount(int artistNum) {
		return artistDao.artistProfileContributorCount(artistNum);
	}

	@Override
	public int artistUpdateRequest(ArtistUpdate artistUpdate, MultipartFile report, String userId) throws Exception {
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
        	artistUpdate.setArtist_img(urlPhoto);
        }
        System.out.println("뿌려보자 : " + artistUpdate);
		return artistDao.artistUpdateRequest(artistUpdate, userId);
	}

	@Override
	public int artistDeleteRequest(String reason, String userId, int artistNum) throws Exception {
		return artistDao.artistDeleteRequest(reason, userId, artistNum);
	}

	@Override
	public int artistInsertRequest(ArtistInsert artistInsert, MultipartFile report, String userId) throws Exception {
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
        	artistInsert.setArtist_img(urlPhoto);
        }
		return artistDao.artistInsertRequest(artistInsert, userId);
	}
	
	@Override
	public int followCheck(int artistNum, String userId) throws Exception {
		return artistDao.followCheck(artistNum, userId);
	}
	
	@Override
	public int artistFollow(int artistNum, String userId) throws Exception {
		return artistDao.artistFollow(artistNum, userId);
	}

	@Override
	public int artistUnfollow(int artistNum, String userId) throws Exception {
		return artistDao.artistUnfollow(artistNum, userId);
	}
}
