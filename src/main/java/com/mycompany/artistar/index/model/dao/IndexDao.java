package com.mycompany.artistar.index.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.member.model.vo.Member;
@Repository("indexdao")
public class IndexDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Artist> getArtistList(String searchValue) {
		String artistName = searchValue;
		return sqlSession.selectList("Artist.getartist",artistName);
	}

	public List<Member> getMemberList(String searchValue) {
		String id = searchValue;
		return sqlSession.selectList("Member.getmember",id);
	}

}
