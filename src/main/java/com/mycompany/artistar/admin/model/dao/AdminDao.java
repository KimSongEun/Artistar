package com.mycompany.artistar.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ArtistInsert> artistInsertAll() throws Exception {
		return sqlSession.selectList("Admin.artistInsertAll");
	}
	public List<ArtistInsert> artistInsertNotYet() throws Exception{
		return sqlSession.selectList("Admin.artistInsertNotYet");
	}
	public List<ArtistInsert> artistInsertOk() throws Exception{
		return sqlSession.selectList("Admin.artistInsertOk");
	}
	public List<ArtistInsert> artistInsertNope() throws Exception{
		return sqlSession.selectList("Admin.artistInsertNope");
	}
	public ArtistInsert artistInsertInfoDetail(int insertNum) throws Exception{
		return sqlSession.selectOne("Admin.artistInsertInfoDetail", insertNum);
	}
	public int resultStatusOk(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOk", insertNum);
	}
	public int resultStatusNope(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNope", insertNum);
	}
	public int alarmArtist(int artistNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		map.put("userFromid", userFromId);
		
		return sqlSession.insert("Admin.alarmArtist", map);
	}
	public int insertArtist(Artist artist) throws Exception {
		return sqlSession.insert("Admin.insertArtist", artist);
	}
	public int getArtistSeqNextVal(){
		return sqlSession.selectOne("Admin.getArtistSeqNextVal");
	}
	public int getArtistSeqCurrVal(){
		return sqlSession.selectOne("Admin.getArtistSeqCurrVal");
	}
	public int insertArtistContributor(int artistNum, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		return sqlSession.insert("Admin.insertArtistContributor", map);
	}
}

