package com.mycompany.artistar.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artist_insert.vo.ArtistInsert;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ArtistInsert> getArtistInsertList(){
		List<ArtistInsert> artistInsert = null;
		return artistInsert;
	}
}

