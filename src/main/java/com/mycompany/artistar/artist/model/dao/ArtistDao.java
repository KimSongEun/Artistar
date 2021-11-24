package com.mycompany.artistar.artist.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artist.model.vo.Artist;

@Repository("artistDao")
public class ArtistDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Artist> getArtistList() throws Exception {
		return sqlSession.selectList("Artist.artistlist");
	}
	
	public List<Artist> getArtistArtInfoImgList(int artistNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		return sqlSession.selectList("ArtInfo.artistArtInfoImg", map);
	}
	
	public int myArtGalleryArtistCount(String userId) {
		return sqlSession.selectOne("Artist.myArtGalleryArtistCount", userId);
	}
	public int myArtGalleryArtCount(String userId) {
		return sqlSession.selectOne("Artist.myArtGalleryArtCount", userId);
	}
	public String myArtGalleryProfileImg(String userId) {
		return sqlSession.selectOne("Artist.myArtGalleryProfileImg", userId);
	}
}
