package com.mycompany.artistar.artinfo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;
import com.mycompany.artistar.artinfo_update.vo.ArtInfoUpdate;

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
	
	public ArtInfo getArtInfoDetail(int artinfoNum) throws Exception {
		System.out.println("Dao 들어왔어??" +sqlSession.selectOne("ArtInfo.artInfoDetail", artinfoNum) );
		return sqlSession.selectOne("ArtInfo.artInfoDetail", artinfoNum);
		
	}
	
	public int likeCheck(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.selectOne("ArtInfo.likeCheck", map);
	}
	
	public int artHeart(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.insert("ArtInfo.artHeart", map);
	}
	
	public int artHeartCancel(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.delete("ArtInfo.artHeartCancel", map);
	}
	
	public int likeCount(int artinfoNum)  {
		return sqlSession.selectOne("ArtInfo.likeCount", artinfoNum);
	}
	
	public int scrapCheck(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.selectOne("ArtInfo.scrapCheck", map);
	}
	
	public int artScrap(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.insert("ArtInfo.artScrap", map);
	}
	
	public int artScrapCancel(int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		return sqlSession.delete("ArtInfo.artScrapCancel", map);
	}
	
	public List<ArtInfo> getArtComment(int artinfoNum) throws Exception {
		return sqlSession.selectList("ArtInfo.artCommentList", artinfoNum);
	}
	
	public int artComment(String artComment, int artinfoNum, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artComment", artComment);
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		System.out.println("Dao 뭐 뿌려? " + map);
		return sqlSession.insert("ArtInfo.artComment", map);
	}
	
	public int artCoComment(String artComment, int artCommentGroup, int artinfoNum, String userId, String replyToId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artComment", artComment);
		map.put("artCommentGroup", artCommentGroup);
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		map.put("replyToId", replyToId);
		return sqlSession.delete("ArtInfo.artCoComment", map);
	}
	
	public int deleteComment(int artCommentGroup) throws Exception {
		return sqlSession.delete("ArtInfo.deleteComment", artCommentGroup);
	}

	public int deleteCoComment(int artCommentNum) throws Exception {
		return sqlSession.delete("ArtInfo.deleteCoComment", artCommentNum);
	}
	
	public int artInfoUpdateRequest(ArtInfoUpdate artInfoUpdate, String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artInfoUpdate", artInfoUpdate);
		map.put("userId", userId);
		return sqlSession.insert("ArtInfoUpdate.artInfoUpdateRequest", map);
	}
	
	public int artInfoDeleteRequest(String reason, String userId, int artinfoNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reason", reason);
		map.put("userId", userId);
		map.put("artinfoNum", artinfoNum);
		return sqlSession.insert("ArtInfoDelete.artInfoDeleteRequest", map);
	}
}
