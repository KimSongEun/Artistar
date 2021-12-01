package com.mycompany.artistar.artinfo.model.service;

import java.util.List;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;


public interface ArtInfoService {
	public List<ArtInfo> getMyGalleryArtList(int startPage, int limit, String userId) throws Exception;
	
	public List<ArtInfo> getArtistProfileArtInfoList(int startPage, int limit, int artistNum) throws Exception;
}
