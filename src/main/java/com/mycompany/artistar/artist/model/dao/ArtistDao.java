package com.mycompany.artistar.artist.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_contributor.vo.ArtistContributor;
import com.mycompany.artistar.artist_follower.vo.ArtistFollower;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

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
		
		List<Artist> artistList = null; 
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRnum", startRow+1);
		map.put("endRnum", startRow+limit);
		artistList = sqlSession.selectList("Artist.artistlist" , map);
		System.out.println("[[[artistList:"+ artistList);
		return artistList;
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
	
	public List<Artist> getMyGalleryArtistList(int startPage, int limit, String userId) throws Exception {
		int startRow=(startPage-1)*limit;
		
		List<Artist> myGalleryArtistList = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRow+1);
		map.put("endRnum", startRow+limit);
		map.put("userId", userId);
		myGalleryArtistList = sqlSession.selectList("Artist.myGalleryArtistList", map);
		System.out.println("[[[myGalleryArtistList:"+ myGalleryArtistList);
		return myGalleryArtistList;
		
	}
	
	public Artist getArtistProfileArtist(int artistNum) throws Exception {
		return sqlSession.selectOne("Artist.artistProfileArtist", artistNum);
	}
	
	public int artistProfileArtCount(int artistNum)  {
		return sqlSession.selectOne("Artist.artistProfileArtCount", artistNum);
	}	
	
	public int artistProfileFollowerCount(int artistNum)  {
		return sqlSession.selectOne("Artist.artistProfileFollowerCount", artistNum);
	}	
	
	public int artistProfileContributorCount(int artistNum) {
		return sqlSession.selectOne("Artist.artistProfileContributorCount", artistNum);
	}	
	
	public int artistUpdateRequest(ArtistUpdate artistUpdate, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistUpdate", artistUpdate);
		map.put("userId", userId);
		System.out.println("dao에서 뿌린 값 : " + artistUpdate);
		return sqlSession.insert("ArtistUpdate.artistUpdateRequest", map);
	}
	
	public int artistDeleteRequest(String reason, String userId, int artistNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reason", reason);
		map.put("userId", userId);
		map.put("artistNum", artistNum);
		return sqlSession.insert("ArtistDelete.artistDeleteRequest", map);
	}
	
	public int artistInsertRequest(ArtistInsert artistInsert, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistInsert", artistInsert);
		map.put("userId", userId);
		return sqlSession.insert("ArtistInsert.artistInsertRequest", map);
	}
	
	public int followCheck(int artistNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		return sqlSession.selectOne("Artist.followCheck", map);
	}	
	
	public int artistFollow(int artistNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		return sqlSession.insert("Artist.follow", map);
	}
	
	public int artistUnfollow(int artistNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		return sqlSession.delete("Artist.unfollow", map);
	}
	
	public List<Artist> getSearchArtist(String keyword) throws Exception {
		return sqlSession.selectList("Artist.getSearchArtist", keyword);
	}
	
	public int searchArtCount(String keyword) throws Exception {
		return sqlSession.selectOne("Artist.searchArtCount", keyword);
	}
	
	public List<ArtInfo> getSearchArt(String keyword) throws Exception {
		return sqlSession.selectList("Artist.getSearchArt", keyword);
	}
	
	public int searchTagCount(String keyword) throws Exception {
		return sqlSession.selectOne("Artist.searchTagCount", keyword);
	}
	
	public List<ArtInfo> getSearchTags(String keyword) throws Exception {
		return sqlSession.selectList("Artist.getSearchTags", keyword);
	}
	public List<ArtistFollower> artistFollowerList (int artistNum) throws Exception {
		return sqlSession.selectList("Artist.artistFollowerList", artistNum);
	}
	public List<ArtistContributor> artistContributorList (int artistNum) throws Exception {
		return sqlSession.selectList("Artist.artistContributorList", artistNum);
	}
}
