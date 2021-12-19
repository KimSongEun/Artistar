package com.mycompany.artistar.member.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.post.model.vo.Post;

public interface MemberService {
	// 로그인
	public Member memberLogin(Member member) throws Exception;

	// 회원가입
	public void memberJoin(Member member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;

	// 이메일 중복 검사
	public int emailCheck(String email) throws Exception;

	// 닉네임 중복 검사
	public int nicknameCheck(String nickname) throws Exception;

	// 비밀번호 변경
	public int pwChange(Member member) throws Exception;

	// 회원정보 수정
	public int memberUpdate(Member member) throws Exception;

	// 회원 탈퇴
	public void memberDelete(Member member) throws Exception;

	// 비밀번호 찾기 회원정보 조회
	public Member pwSelectMember(Member member) throws Exception;

	// 비밀번호 찾기 비밀번호 업데이트
	public int pwFindUpdate(Member member) throws Exception;

	// 회원 프로필사진 수정
	public void memberProfileUpdate(MultipartFile report, String id) throws Exception;

	// 프로필 사진 가져오기
	public List<Member> getMemberProfile(Member vo) throws Exception;

	// 회원 프로필사진 삭제
	public void memberProfileDelete(MultipartFile report, String id) throws Exception;

	// 포스트 개수
	public int myPostCount(String id);

	// 팔로워 수
	public int myFollowerCount(String id) throws Exception;

	// 팔로우 수
	public int myFollowCount(String id) throws Exception;

	// MyPostList
	List<Post> getMyPostList(String id) throws Exception;

	//public List<Member> MemberList(String id) throws Exception;
	public Member memberList(String id) throws Exception ;
}
