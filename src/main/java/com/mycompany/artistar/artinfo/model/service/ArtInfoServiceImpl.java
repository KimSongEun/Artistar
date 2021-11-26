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
	public List<ArtInfo> getMyGalleryArtList(String userId) throws Exception {
		List<ArtInfo> volist = null;
		try {
			volist = artInfoDao.getMyGalleryArtList(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}
}
