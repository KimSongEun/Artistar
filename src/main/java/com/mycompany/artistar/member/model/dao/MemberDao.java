package com.mycompany.artistar.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.post.model.vo.Post;

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

	// 비밀번호 변경
	public int pwChange(Member member) throws Exception {
		return sqlSession.update("Member.pwChange", member);
	}

	// 회원정보 수정
	public int memberUpdate(Member member) throws Exception{		
		return sqlSession.update("Member.memberUpdate", member);
	}
	
	// 회원 탈퇴
	public void memberDelete(Member member) throws Exception {
		sqlSession.delete("Member.memberDelete", member);
	}
	
	// 비밀번호 찾기 회원정보 조회
	public Member pwSelectMember(Member member) throws Exception{		
		return sqlSession.selectOne("Member.pwSelectMember", member);
	}
	
	// 비밀번호 찾기 비밀번호 업데이트
	public int pwFindUpdate(Member member) throws Exception{		
		return sqlSession.update("Member.pwFindUpdate", member);
	}
	
	// 회원 프로필사진 수정
	public int memberProfileUpdate(Member member) {
		return sqlSession.update("Member.memberProfileUpdate", member);
	}
	
	// 프로필 사진 가져오기
	public List<Member> getMemberProfile(Member vo) throws Exception {
		return sqlSession.selectList("Member.getMemberProfile", vo);
	}
	
	// 회원 프로필사진 삭제
	public int memberProfileDelete(Member member) {
		return sqlSession.update("Member.memberProfileDelete", member);
	}
	
	// 포스트 개수
	public int myPostCount(String id) throws Exception {
		return sqlSession.selectOne("Post.myPostCount", id);
	}
	
	// 팔로워 수 
	public int myFollowerCount(String id) throws Exception {
		return sqlSession.selectOne("Follower.myFollowerCount", id);
	}
	
	// 팔로우 수 
	public int myFollowCount(String id) throws Exception {
		return sqlSession.selectOne("Follow.myFollowCount", id);
	}   
	
	// MyPostList
	public List<Post> getMyPostList(String id) throws Exception {
		return sqlSession.selectList("Post.getMyPostList", id);
	}
	

}
