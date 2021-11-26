package com.mycompany.artistar.artinfo.model.service;

import java.util.List;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;


public interface ArtInfoService {
	public List<ArtInfo> getMyGalleryArtList(String userId) throws Exception;
}
