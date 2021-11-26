package com.mycompany.artistar.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public Member memberLogin(Member member) throws Exception {
		return sqlSession.selectOne("Member.memberLogin", member);
	}

	public void memberJoin(Member member) throws Exception {
		sqlSession.insert("Member.memberJoin", member);
	}

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception {
		return sqlSession.selectOne("Member.idCheck", id);
	}

	// 이메일 중복 검사
	public int emailCheck(String email) throws Exception {
		return sqlSession.selectOne("Member.emailCheck", email);
	}

	// 닉네임 중복 검사
	public int nicknameCheck(String nickname) throws Exception {
		return sqlSession.selectOne("Member.nicknameCheck", nickname);
	}
}
