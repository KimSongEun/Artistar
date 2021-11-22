package com.mycompany.artistar.artist.model.dao;

import java.util.List;

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
	
	public List<Artist> getArtistArtInfoList() throws Exception {
		return sqlSession.selectList("Artist.artistArtInfo");
	}
	
	public List<Artist> getArtistFollowerList() throws Exception {
		return sqlSession.selectList("Artist.artistFollower");
	}
}
