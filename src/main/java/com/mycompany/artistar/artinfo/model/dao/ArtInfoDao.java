package com.mycompany.artistar.artinfo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;

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
	
	public List<ArtInfo> getArtistProfileArtInfoList(int startPage, int limit, int artistNum) throws Exception {
		int startRow=(startPage-1)*limit;
		
		List<ArtInfo> artistProfileArtInfoList = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRow+1);
		map.put("endRnum", startRow+limit);
		map.put("artistNum", artistNum);
		artistProfileArtInfoList = sqlSession.selectList("ArtInfo.artistProfileArtInfoList", map);
		System.out.println("[[[artistProfileArtInfoList:"+ artistProfileArtInfoList);
		return artistProfileArtInfoList;
	}
	
	public int artInfoInsertRequest(ArtInfoInsert artInfoInsert, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artInfoInsert", artInfoInsert);
		map.put("userId", userId);
		return sqlSession.insert("ArtInfoInsert.artInfoInsertRequest", map);
	}
}
