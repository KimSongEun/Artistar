package com.mycompany.artistar.artinfo.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;


public interface ArtInfoService {
	public List<ArtInfo> getMyGalleryArtList(int startPage, int limit, String userId) throws Exception;
	
	public List<ArtInfo> getArtistProfileArtInfoList(int startPage, int limit, int artistNum) throws Exception;
	
	public int artInfoInsertRequest(ArtInfoInsert artInfoInsert, MultipartFile report, String userId) throws Exception;
}
