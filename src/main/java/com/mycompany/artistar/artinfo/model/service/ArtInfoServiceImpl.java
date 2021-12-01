package com.mycompany.artistar.artinfo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.artinfo.model.dao.ArtInfoDao;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;

@Service("artInfoService")
public class ArtInfoServiceImpl implements ArtInfoService {
	@Autowired
	private ArtInfoDao artInfoDao;	
	
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
	public List<ArtInfo> getArtistProfileArtInfoList(int artistNum) throws Exception {
		return artInfoDao.getArtistProfileArtInfoList(artistNum);
	}
}
