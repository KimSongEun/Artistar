package com.mycompany.artistar.artinfo.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;


public interface ArtInfoService {
	public List<ArtInfo> getMyGalleryArtList(int startPage, int limit, String userId) throws Exception;
	
	public List<ArtInfo> getArtistProfileArtInfoList(int startPage, int limit, int artistNum) throws Exception;
	
	public int artInfoInsertRequest(ArtInfoInsert artInfoInsert, MultipartFile report, String userId) throws Exception;
	
	public ArtInfo getArtInfoDetail(int artinfoNum) throws Exception;
	
	public int likeCheck(int artinfoNum, String userId) throws Exception;
	
	public int artHeart(int artinfoNum, String userId) throws Exception;
	
	public int artHeartCancel(int artinfoNum, String userId) throws Exception;
	
	public int likeCount(int artinfoNum);
	
	public int scrapCheck(int artinfoNum, String userId) throws Exception;
	
	public int artScrap(int artinfoNum, String userId) throws Exception;
	
	public int artScrapCancel(int artinfoNum, String userId) throws Exception;
}
