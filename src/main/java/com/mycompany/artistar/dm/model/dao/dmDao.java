package com.mycompany.artistar.dm.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;

@Repository("dmDao")
public class dmDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Dm> messageList(Dm dm){ //메세지 리스트 가져오기
		return sqlSession.selectList("DmNS.messageList", dm);
	}

	public List<Member> MemberList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Member.memberList", id);
	}
}
