package com.mycompany.artistar.follow.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.member.model.vo.Member;

@Repository
public class FollowDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void doFollow(Follow vo) {
		sqlSession.insert("Follow.doFollow", vo);
	}
	public void unFollow(Follow vo) {
		sqlSession.delete("Follow.unFollow", vo);
	}
	public List<Member> getRecommendFollow() {
		return sqlSession.selectList("Follow.getRecommendFollow");
	}
	public List<String> getFollow(String id) {
		return sqlSession.selectList("Follow.getFollow", id);
	}
	public int checkFollow(Follow vo) {
		return sqlSession.selectOne("Follow.checkFollow", vo);
	}
}
