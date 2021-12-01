package com.mycompany.artistar.artinfo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.vo.Artist;

@Repository("artInfoDao")
public class ArtInfoDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ArtInfo> getMyGalleryArtList(int startPage, int limit, String userId) throws Exception {
		int startRow=(startPage-1)*limit;
		
		List<ArtInfo> myGalleryArtList = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRow+1);
		map.put("endRnum", startRow+limit);
		map.put("userId", userId);
		myGalleryArtList = sqlSession.selectList("ArtInfo.myGalleryArtList", map);
		System.out.println("[[[myGalleryArtistList:"+ myGalleryArtList);
		return myGalleryArtList;
		
	}
	
	public List<ArtInfo> getArtistProfileArtInfoList(int artistNum) throws Exception {
		return sqlSession.selectList("ArtInfo.artistProfileArtInfoList", artistNum);
	}
}
