package com.mycompany.artistar.artinfo.model.service;

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
import com.mycompany.artistar.artinfo.model.dao.ArtInfoDao;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;
import com.mycompany.artistar.artinfo_update.vo.ArtInfoUpdate;

@Service("artInfoService")
public class ArtInfoServiceImpl implements ArtInfoService {
	@Autowired
	private ArtInfoDao artInfoDao;	
	
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));	
	
	@Override
	public List<ArtInfo> getMyGalleryArtList(int startPage, int limit, String userId) throws Exception {
		List<ArtInfo> volist = null;
		try {
			volist = artInfoDao.getMyGalleryArtList(startPage, limit, userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public List<ArtInfo> getArtistProfileArtInfoList(int startPage, int limit, int artistNum) throws Exception {
		List<ArtInfo> artistProfileArtInfoList = null;
		try {
			artistProfileArtInfoList = artInfoDao.getArtistProfileArtInfoList(startPage, limit, artistNum);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return artistProfileArtInfoList;
	}

	@Override
	public int artInfoInsertRequest(ArtInfoInsert artInfoInsert, MultipartFile report, String userId) throws Exception {
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
        	artInfoInsert.setArtinfo_img(urlPhoto);
        }
		return artInfoDao.artInfoInsertRequest(artInfoInsert, userId);
	}

	@Override
	public ArtInfo getArtInfoDetail(int artinfoNum) throws Exception {
		return artInfoDao.getArtInfoDetail(artinfoNum);
	}

	@Override
	public int likeCheck(int artinfoNum, String userId) throws Exception {
		return artInfoDao.likeCheck(artinfoNum, userId);
	}

	@Override
	public int artHeart(int artinfoNum, String userId) throws Exception {
		return artInfoDao.artHeart(artinfoNum, userId);
	}

	@Override
	public int artHeartCancel(int artinfoNum, String userId) throws Exception {
		return artInfoDao.artHeartCancel(artinfoNum, userId);
	}
	
	@Override
	public int likeCount(int artinfoNum) {
		return artInfoDao.likeCount(artinfoNum);
	}
	
	@Override
	public int scrapCheck(int artinfoNum, String userId) throws Exception {
		return artInfoDao.scrapCheck(artinfoNum, userId);
	}

	@Override
	public int artScrap(int artinfoNum, String userId) throws Exception {
		return artInfoDao.artScrap(artinfoNum, userId);
	}

	@Override
	public int artScrapCancel(int artinfoNum, String userId) throws Exception {
		return artInfoDao.artScrapCancel(artinfoNum, userId);
	}

	@Override
	public List<ArtInfo> getArtComment(int artinfoNum) throws Exception {
		return artInfoDao.getArtComment(artinfoNum);
	}

	@Override
	public int artComment(String artComment, int artinfoNum, String userId) throws Exception {
		return artInfoDao.artComment(artComment, artinfoNum, userId);
	}

	@Override
	public int artCoComment(String artComment, int artCommentGroup, int artinfoNum, String userId, String replyToId) throws Exception {
		return artInfoDao.artCoComment(artComment, artCommentGroup, artinfoNum, userId, replyToId);
	}

	@Override
	public int deleteComment(int artCommentGroup) throws Exception {
		return artInfoDao.deleteComment(artCommentGroup);
	}

	@Override
	public int deleteCoComment(int artCommentNum) throws Exception {
		return artInfoDao.deleteCoComment(artCommentNum);
	}

	@Override
	public int artInfoUpdateRequest(ArtInfoUpdate artInfoUpdate, MultipartFile report, String userId) throws Exception {
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
        	artInfoUpdate.setArtinfo_img(urlPhoto);
        }
		return artInfoDao.artInfoUpdateRequest(artInfoUpdate, userId);
	}

	@Override
	public int artInfoDeleteRequest(String reason, String userId, int artinfoNum) throws Exception {
		return artInfoDao.artInfoDeleteRequest(reason, userId, artinfoNum);
	}


}
