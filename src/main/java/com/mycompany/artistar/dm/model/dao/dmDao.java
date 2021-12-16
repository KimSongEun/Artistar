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
	
	//메세지 리스트 가져오기
	public List<Dm> messageList(Dm dm){ 
		return sqlSession.selectList("DmNS.messageList", dm);
	}

	//채팅방 리스트 가져오기
	public List<Member> MemberList(String id) {
		return sqlSession.selectList("Member.memberList", id);
	}
	
	//채팅 방 내역 가져오기
	public List<Dm> massageContent(int dm_room) {
		return sqlSession.selectList("DmNS.messageContent", dm_room);
	}
	
	public int readMessage(int dm_room) {
		return sqlSession.update("DmNS.readMessage", dm_room);
	}

	public int sendMessage(Dm send) {
		return sqlSession.insert("DmNS.sendMessage", send);
	}
}
