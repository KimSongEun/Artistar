package com.mycompany.artistar.artist.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artist.model.vo.Artist;

@Repository("artistDao")
public class ArtistDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int artistListCount() {
		return sqlSession.selectOne("Artist.artistListCount");
	}
	
	public List<Artist> getArtistList(int startPage, int limit) throws Exception {
		int startRow=(startPage-1)*limit;
		System.out.println("startPage"+ startPage);
		System.out.println("limit"+ limit);
		System.out.println("startRow"+ startRow);
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Artist.artistlist" , null, row);
	}
	
	public int myArtGalleryArtistCount(String userId) throws Exception {
		return sqlSession.selectOne("Artist.myArtGalleryArtistCount", userId);
	}
	public int myArtGalleryArtCount(String userId) throws Exception {
		return sqlSession.selectOne("Artist.myArtGalleryArtCount", userId);
	}
	public String myArtGalleryProfileImg(String userId) throws Exception {
		return sqlSession.selectOne("Artist.myArtGalleryProfileImg", userId);
	}
	
	public List<Artist> getMyGalleryArtistList(String userId) throws Exception {
		return sqlSession.selectList("Artist.myGalleryArtistList", userId);
	}
	
	public Artist getArtistProfileArtist(int artistNum) throws Exception {
		return sqlSession.selectOne("Artist.artistProfileArtist", artistNum);
	}
	
	public int artistProfileArtCount(int artistNum) throws Exception {
		return sqlSession.selectOne("Artist.artistProfileArtCount", artistNum);
	}	
	
	public int artistProfileFollowerCount(int artistNum) throws Exception {
		return sqlSession.selectOne("Artist.artistProfileFollowerCount", artistNum);
	}	
	
	public int artistProfileContributorCount(int artistNum) throws Exception {
		return sqlSession.selectOne("Artist.artistProfileContributorCount", artistNum);
	}	
}
