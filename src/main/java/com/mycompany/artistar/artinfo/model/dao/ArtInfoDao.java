package com.mycompany.artistar.artinfo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;

@Repository("artInfoDao")
public class ArtInfoDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ArtInfo> getMyGalleryArtList(String userId) throws Exception {
		return sqlSession.selectList("ArtInfo.myGalleryArtList", userId);
	}
	
	public List<ArtInfo> getArtistProfileArtInfoList(int artistNum) throws Exception {
		return sqlSession.selectList("ArtInfo.artistProfileArtInfoList", artistNum);
	}
}
